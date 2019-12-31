package OperateApplicant;

import net.sf.json.JSONObject;
import org.apache.tools.ant.taskdefs.SendEmail;
import tools.Db_tools.Db_tools;
import tools.Mail_tools.sendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OperateApplicant.review")
public class review extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("statues");
        String aid =  request.getParameter("Aid");
        String indexs = request.getParameter("indexs");
        JSONObject result = new JSONObject();
        if(flag != null){
            if(flag.toString()=="admin"){
                Db_tools db = new Db_tools();
                if(db.UpdateApplicant(aid,indexs)){
                    sendMail sender = new sendMail();
                    String userid = db.GetApplicantByAid(aid).getString("id");
                    try {
                        sender.sendMessageEmail(db.GetUserInfoById(userid).getString("email"),"allow",aid);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    JSONObject fina = new JSONObject();
                    fina.put("lid",aid);
                    fina.put("isgive","n");
                    db.InsertFinance(fina);
                    result.put("success",200);
                    result.put("reason","success");
                }else {
                    result.put("success",201);
                    result.put("reason","insert error");
                }
            }else {
                result.put("success",202);
                result.put("reason","permission denied");
            }
        }else {
            result.put("success",204);
            result.put("reason","login first");
        }
        response.getWriter().write(result.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
