import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "resetman")
public class resetman extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        Db_tools db = new Db_tools();
        if(flag==null){
            response.sendRedirect("/login.do");
        }else {
            JSONObject result = new JSONObject();
            String method = request.getParameter("method");
            if(method.isEmpty()){
                response.getWriter().write("error");
            }else if(method.equals("info")){
                JSONObject info = new JSONObject();
                info.put("sex",request.getParameter("sex"));
                info.put("age",request.getParameter("age"));
                info.put("id",request.getSession().getAttribute("id"));
                if(db.UpdateuserSA(info)){
                    result.put("success",200);
                }else {
                    result.put("success",201);
                }
            }else if(method.equals("mail")){
                db.UpdateUserMail()
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
