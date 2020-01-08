import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "maninfo")
public class maninfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        Db_tools db = new Db_tools();
        if(flag==null){
            response.sendRedirect("/login.do");
        }else {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(db.GetUserInfoById(request.getSession().getAttribute("id").toString()).toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
