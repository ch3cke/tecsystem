import javax.imageio.ImageIO;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

import tools.untils.verifycode;

@WebServlet(name = "getcode")
public class getcode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        verifycode code = new verifycode();
        Map<String,Object> codeImg = code.createVeriCode();
        HttpSession session = request.getSession();
        session.setAttribute("code",codeImg.get("code").toString());

        //禁止缓存
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.addDateHeader("Expires",-1);

        response.setContentType("image/jpeg");
        ServletOutputStream sos;
        try {
            sos = response.getOutputStream();
            ImageIO.write((RenderedImage) codeImg.get("image"),"jpeg",sos);
            sos.close();
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}
