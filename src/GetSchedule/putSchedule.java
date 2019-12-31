package GetSchedule;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetSchedule.putSchedule")
public class putSchedule extends HttpServlet {
    Db_tools db = new Db_tools();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        JSONObject result = new JSONObject();
        if(flag!=null){
            JSONObject schedule = new JSONObject();
            schedule.put("Sid",request.getSession().getAttribute("Aid"));
            schedule.put("id",request.getSession().getAttribute("id"));
            schedule.put("Aplace",request.getParameter("Aplace"));
            schedule.put("Atime",request.getParameter("Atime"));
            schedule.put("Amoney",request.getParameter("Amoney"));
            schedule.put("Dname",request.getParameter("Dname"));
            schedule.put("Areason1",request.getParameter("Areason1"));
            schedule.put("Areason2",request.getParameter("Areason2"));
            schedule.put("Areason3",request.getParameter("Areason3"));
            schedule.put("isgive","n");
            if(db.InsertSchedule(schedule)){
                result.put("success",200);
            }else {
                result.put("success",201);
            }
            response.getWriter().write(result.toString());
        }else {
            response.sendRedirect("/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if (flag==null){
            response.sendRedirect("/login");
        }else {
            String aid = request.getParameter("Aid");
            request.getSession().setAttribute("aid",aid);
            JSONObject result = new JSONObject();
            result.put("aid",aid);
            response.getWriter().write(result.toString());
        }
    }
}
