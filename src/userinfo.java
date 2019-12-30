import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "userinfo")
public class userinfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Object flag = request.getSession().getAttribute("islogin");
        String flag = "sss";
        if(flag==null){
            response.sendRedirect("/login");
        }else {
            //String id  = request.getSession().getAttribute("id").toString();
            String id = "2294458237@qq.com";
            Map<String,String> info = new HashMap<>();
            Db_tools db = new Db_tools();
            response.getWriter().write(db.GetApplicantByid(id).toString());
        }
    }
}
