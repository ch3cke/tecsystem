import com.sun.javafx.collections.MappingChange;
import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "resetUserInfo")
public class resetUserInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            response.sendRedirect("/login");
        }else {
            JSONObject userinfo = new JSONObject();
            userinfo.put("id",request.getSession().getAttribute("id").toString());
            userinfo.put("username",request.getParameter("username"));
            userinfo.put("sex",request.getParameter("sex"));
            userinfo.put("age",request.getParameter("age"));
            userinfo.put("Did",request.getParameter("Did"));
            userinfo.put("Dname",request.getParameter("Dname"));
            Db_tools db = new Db_tools();
            JSONObject result = new JSONObject();
            if(db.UpdateUserInfo(userinfo)){
                result.put("success",true);
            }else {
                result.put("success",false);
            }
            response.getWriter().write(result.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
