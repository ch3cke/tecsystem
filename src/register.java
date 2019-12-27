import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String password = encrypt.encryptToMD5(request.getParameter("password"));
        String repassword = encrypt.encryptToMD5(request.getParameter("repassword"));
        String code = request.getParameter("code");
        String sessionCode = request.getSession().getAttribute("code").toString();
        if (code.equals(sessionCode)){
            if(repassword.equals(password)){
                Map<String,String> info = new HashMap<>();
                info.put("username",username);
                info.put("id",userId);
                info.put("email",email);
                info.put("statues","worker");
                info.put("Medals","0");
                info.put("age","20");
                info.put("sex","man");
                info.put("Did","000000");
                info.put("Dname","default");
                info.put("password",password);
                Date date = new Date();
                info.put("log_time",date.toString());
                Db_tools db = new Db_tools();
                if(db.InsertUserInfo(info)){
                    response.getWriter().write("<script type='text/javascript'>alert('register success');function jumurl(){" +
                            "window.location.href='http://localhost:8080/login';"+
                            "}setTimeout(jumurl,3000);</script>");
                }else {
                    response.getWriter().write("<script type='text/javascript'>alert('user exits');function jumurl(){" +
                            "window.location.href='http://localhost:8080/login';"+
                            "}setTimeout(jumurl,3000);</script>");
                }
            }else {
                response.getWriter().write("<script type='text/javascript'>alert('user exits');function jumurl(){" +
                        "window.location.href='http://localhost:8080/register';" +
                        "}"+"setTimeout(jumurl,3000);</script>");
            }
        }else {
            response.getWriter().write("<script type='text/javascript'>alert('code error');function jumurl(){" +
                    "window.location.href='http://localhost:8080/register';"+
                    "}" +
                    "setTimeout(jumurl,3000);</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/user/register.jsp").forward(request,response);
    }
}
