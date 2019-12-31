package GetSchedule;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "getSchedule")
public class getSchedule extends HttpServlet {
    Db_tools db = new Db_tools();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag!=null){
            JSONArray Applicants = new JSONArray();
            String userid = request.getSession().getAttribute("id").toString();
            Applicants = db.GetApplicantByid(userid);
            response.getWriter().write(Applicants.toString());
        }else {
            response.sendRedirect("/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
