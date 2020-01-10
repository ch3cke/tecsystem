package GetSchedule;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;
import tools.untils.upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetSchedule.putSchedule")
public class putSchedule extends HttpServlet {
    Db_tools db = new Db_tools();
    String ppath = "D:\\project\\tecsystem\\web\\upload";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        JSONObject result = new JSONObject();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        if(flag!=null){
            if(upload.uploadFile(request,ppath, 1024 * 30, 1024 * 30, null)){
                result.put("success",200);
                result.put("reason","ok");
            }else {
                result.put("success",201);
            }
            response.getWriter().write(result.toString());
        }else {
            response.sendRedirect("/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if (flag==null){
            response.sendRedirect("/login");
        }else {
            String aid = request.getParameter("Aid");
            request.getSession().setAttribute("aid",aid);
            JSONObject result = new JSONObject();
            result.put("aid",aid);
            response.getWriter().write(result.toString());
        }
    }
}
