import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StaticAll")
public class StaticAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        String statues = null;
        if(flag!=null){
            statues = request.getParameter("statues");
            if(statues.equals("admin")){
                Db_tools db = new Db_tools();
                response.getWriter().write(db.StaticEveryOne().toString());
            }else {
                JSONObject result = new JSONObject();
                result.put("success",201);
                result.put("reason","permission denied");
                response.getWriter().write(result.toString());
            }
        }else {
            response.sendRedirect("/login.do");
        }
    }
}
