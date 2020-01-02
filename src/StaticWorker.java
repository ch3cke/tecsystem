import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StaticWorker")
public class StaticWorker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        //flag = "11";
        if(flag==null){
            response.sendRedirect("/login.do");
        }else {
            String userId = request.getSession().getAttribute("id").toString();
            Db_tools db = new Db_tools();
            response.getWriter().write(db.StatisticalSchdeuleById(userId).toString());
        }
    }
}
