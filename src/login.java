import org.apache.tools.ant.taskdefs.Sleep;
import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

@WebServlet(name = "login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession res = request.getSession();
        Map<String, String>userinfo = new HashMap<>();
        Object flag = res.getAttribute("islogin");
        String email = request.getParameter("email");
        String password = encrypt.encryptToMD5(request.getParameter("password"));
        Db_tools db = new Db_tools();
        userinfo = db.GetUserInfo(email);
        String password2 = userinfo.get("password");
        String code = request.getParameter("code");
        String id = userinfo.get("id");
        String sessionCode = request.getSession().getAttribute("code").toString();
        if(flag==null){
            if(code.equals(sessionCode)){
                if (password.equals(password2)){
                    res.setAttribute("islogin",true);
                    res.setAttribute("id",id);
                    res.setAttribute("statues",userinfo.get("statues"));
                    response.sendRedirect("/index.html");
                }else {
                    response.getWriter().write("<script type='text/javascript'>alert('username or password error');");
                }
                response.getWriter().write("用户名或密码错误");
            }else {
                response.getWriter().write("<script type='text/javascript'>alert('code error');function jumurl(){" +
                        "window.location.href='http://localhost:8080/login';"+
                        "}" +
                        "setTimeout(jumurl,1000);</script>");
            }
        }else {
            response.sendRedirect("/index.html");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        }else {
            response.sendRedirect("/index.html");
        }
    }
}

