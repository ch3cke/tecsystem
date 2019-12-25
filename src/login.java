import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = encrypt.encryptToMD5(request.getParameter("password"));
        Db_tools db = new Db_tools();
        String password2 = db.GetUserInfo(username).get("passwd");
        if (password.equals(password2)){
            request.getRequestDispatcher("/index.html").forward(request,response);
        }else {
            request.setAttribute("some","<script>alert('passwd or username error')</script>");
            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/user/login.jsp").forward(request,response);
    }
}

