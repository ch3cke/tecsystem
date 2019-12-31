package finance;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;
import tools.Mail_tools.sendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet")
public class Servlet extends HttpServlet {
    Db_tools db = new Db_tools();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        JSONObject result = new JSONObject();
        if(flag==null){
            response.sendRedirect("/login");
        }else {
            if(request.getSession().getAttribute("statues").equals("finance")){
                String Sid = request.getParameter("Sid");
                db.UpdateSchedule(Sid,"y");
                JSONObject schedule = new JSONObject();
                schedule = db.GetScheduleBySid(request.getParameter("Sid"));
                Integer Amoney = Integer.parseInt(db.GetApplicantByAid(request.getParameter("Sid")).getString("Amoney"));
                Integer Bmoney = Integer.parseInt(schedule.getString("Amoney"));
                if(Amoney>Bmoney){
                    db.UpdateUserMedal(schedule.getString("id"),(Amoney-Bmoney)/100);
                }
                db.UpdateFinance("Sid","y");
                sendMail sender = new sendMail();
                try {
                    sender.sendMessageEmail(db.GetUserInfoById(db.GetApplicantByAid(request.getParameter("Sid")).getString("id")).getString("email"),"PASS",request.getParameter("Sid"));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                result.put("success",200);
                response.getWriter().write(result.toString());
            }else {
                result.put("success",201);
                result.put("reason","permission denied");
                response.getWriter().write(result.toString());
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        JSONObject result = new JSONObject();
        if(flag==null){
            response.sendRedirect("/login");
        }else {
            if(request.getSession().getAttribute("statues").equals("finance")){
                response.getWriter().write(db.GetAllSchedule().toString());
            }else {
                result.put("success",201);
                result.put("reason","permission denied");
                response.getWriter().write(result.toString());
            }
        }

    }
}
