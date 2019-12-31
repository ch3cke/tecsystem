package GetInSys;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "GetIn.login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession res = request.getSession();
        JSONObject userinfo = new JSONObject();
        Object flag = res.getAttribute("islogin");
        String email = request.getParameter("email");
        String password = encrypt.encryptToMD5(request.getParameter("password"));
        Db_tools db = new Db_tools();
        userinfo = db.GetUserInfo(email);
        String password2 = userinfo.get("password").toString();
        String code = request.getParameter("code");
        String id = userinfo.get("id").toString();
        String sessionCode = request.getSession().getAttribute("code").toString();
        JSONObject result = new JSONObject();
        if(flag==null){
            if(code.equals(sessionCode)){
                if (password.equals(password2)){
                    result.put("success",200);
                    result.put("reason","登录成功");
                    res.setAttribute("islogin",true);
                    res.setAttribute("id",id);
                    res.setAttribute("statues",userinfo.get("statues"));
                    response.getWriter().write(result.toString());
                }else {
                    result.put("reason","用户名或密码错误");
                    result.put("success",201);
                    response.getWriter().write(result.toString());
                }
            }else {
                result.put("reason","验证码错误");
                result.put("success",202);
                response.getWriter().write(result.toString());
            }
        }else {
                result.put("reason","用户已经登录");
                result.put("success",203);
                response.getWriter().write(result.toString());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            request.getRequestDispatcher("/user/GetIn.login.jsp").forward(request,response);
        }else {
            response.sendRedirect("/index.html");
        }
    }
}

