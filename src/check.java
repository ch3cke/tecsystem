import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "check")
public class check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recode = request.getParameter("recode");
        String password = request.getParameter("newpasswd");
        String username = (String)request.getSession().getAttribute("id");
        String recode2 = (String)request.getSession().getAttribute("resetcode");
        JSONObject result = new JSONObject();
        if(recode.equals(recode2)){
            Db_tools db = new Db_tools();
            if(db.UpdateUserpasswd(username,password)){
                result.put("success",200);
                result.put("reason","修改成功");
            }
            else {
                result.put("success",201);
                result.put("reason","修改失败");
            }
        }else {
            result.put("success",202);
            result.put("reason","验证码错误");
        }
        response.getWriter().write(result.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
