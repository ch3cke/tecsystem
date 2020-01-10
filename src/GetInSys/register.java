package GetInSys;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;
import tools.Mail_tools.sendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "GetIn.register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String password = encrypt.encryptToMD5(request.getParameter("password"));
        String repassword = encrypt.encryptToMD5(request.getParameter("repassword"));
        String code = request.getParameter("code");
        JSONObject result = new JSONObject();
        String sessionCode = request.getSession().getAttribute("code").toString();
        if (code.equals(sessionCode)){
            if(repassword.equals(password)){
                JSONObject info = new JSONObject();
                info.put("username",username);
                info.put("id",userId);
                info.put("email",email);
                info.put("statues","worker");
                info.put("Medals","0");
                info.put("age","20");
                info.put("sex","男");
                info.put("Did","000000");
                info.put("Dname","default");
                info.put("password",password);
                Date date = new Date();
                info.put("log_time",date.toString());
                Db_tools db = new Db_tools();
                sendMail sender = new sendMail();
                        if(db.InsertUserInfo(info)) {
                            try {
                                sender.sendEmail(info.get("email").toString(),info.get("id").toString());
                                request.getSession().setAttribute("id",info.get("id").toString());
                                result.put("reason", "注册成功");
                                result.put("success", 200);
                            }catch (Exception e){
                                result.put("reason","邮件未发送");
                                result.put("success",201);
                                response.getWriter().write(result.toString());
                            }
                        }else {
                                result.put("reason","用户已存在");
                                result.put("success",202);
                                response.getWriter().write(result.toString());
                            }
                            response.getWriter().write(result.toString());

            }else {
                result.put("reason","验证码错误");
                result.put("success",203);
                response.getWriter().write(result.toString());
            }
        }else {
            result.put("reason","密码不匹配");
            result.put("success",204);
            response.getWriter().write(result.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            request.getRequestDispatcher("/register.jsp").forward(request,response);
        }else {
            String statue = request.getSession().getAttribute("statues").toString();
            response.sendRedirect("/"+statue+"/home.jsp");
        }
    }
}
