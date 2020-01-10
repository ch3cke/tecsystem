package tools.untils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import tools.Db_tools.Db_tools;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class upload {
    /**
     * 该方法实现了浏览器上传文件的实现
     *
     * @param request
     *            浏览器请求头
     * @param outPath
     *            文件保存路径
     * @param sizeLimit
     *            上传文件设置的是否存放在内存还是磁盘的临界值
     * @param bufferSize
     *            输出文件的缓冲字节数组的大小
     * @param message
     *            在下载完成后要输出的文字
     * @return 正常下载时true,否则为false
     */
    public static boolean uploadFile(HttpServletRequest request, String outPath, int sizeLimit, int bufferSize,
                                        String message) {
        FileOutputStream out = null;
        InputStream in = null;

        JSONObject se = new JSONObject();
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String id = request.getSession().getAttribute("id").toString();
        se.put("id",id);
        Db_tools db = new Db_tools();
        JSONObject user = new JSONObject();
        String fileName="";
        se.put("Dname",db.GetUserInfoById(id).get("Dname"));


        // 创建一个apache文件上传的文件的DiskFileItemFactory，用于初始化文件上传的参数设置
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // 设置文件上传时是否保存在缓存中还是磁盘中的临界值，当高于临界值时放在磁盘中
        factory.setSizeThreshold(sizeLimit);

        // 设置临时存放的文件目录，"java.io.tmpdir"表示jvm默认的磁盘缓存目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // 创建文件上传的传输对象，并传入配置对象
        ServletFileUpload fileUpload = new ServletFileUpload(factory);

        // 设置文件传输对象识别接收信息头的编码
        fileUpload.setHeaderEncoding("utf-8");

        // 调用apache中的静态方法来判断当前请求时传输的内容是不是文件类型
        if (!ServletFileUpload.isMultipartContent(request)) {
            return false;
        }
        try {
            // 将当前请求中的内容提取出里面的文件部分，并将文件部分提取出来，封装在FileItem中，
            // 由于一个提交过来的请求有可能有多个文件，所以返回一个list<FileItem>
            List fileItems = fileUpload.parseRequest(request);

            // 对每一个文件项目进行遍历
            // 使用迭代器的方式迭代，提升效率
            Iterator iterator = fileItems.iterator();
            for (; iterator.hasNext();) {
                FileItem item = (FileItem) iterator.next();

                // 判断当前文件项目是不是只是普通表单字段，如果是，就不对其进行i/o操作
                if (item.isFormField()) {
                    se.put(item.getFieldName(),new String(item.getString().getBytes("ISO8859-1"), StandardCharsets.UTF_8));
                } else {
                    // 获取输入流，获取每个文件项目的输入流
                    in = item.getInputStream();

                    // 获取上传的文件的文件名
                    fileName= item.getName();
                    File test = new File(outPath);
                    if(!test.exists()){
                        test.mkdir();
                    }

                    // 开启输出流,输出
                    //到指定的文件
                    out = new FileOutputStream(outPath + File.separator + fileName);


                    // 创建字节缓冲数组
                    byte[] buffer = new byte[bufferSize];

                    int readNUm = 0;

                    // 读取并输出
                    while ((readNUm = in.read(buffer, 0, bufferSize)) != -1) {
                        out.write(buffer, 0, readNUm);
                        out.flush();
                    }
                    in.close();
                    out.close();
                    if (message != null)
                        System.out.println(message);

                }

            }
            se.put("paths",fileName);
            if(db.InsertSchedule(se)) {
                return true;
            }else {
                return false;
            }
        } catch (FileUploadException | IOException e) {
            e.printStackTrace();
            return false;
        }
    }

}
