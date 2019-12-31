package GetApplicant;

import net.sf.json.JSONObject;
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

@WebServlet(name = "GetApplicant.applicant")
public class applicant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            response.sendRedirect("/GetIn.login");
        }else {
            JSONObject result = new JSONObject();
            Date time = new Date();
            Db_tools db = new Db_tools();
            JSONObject appliant = new JSONObject();
            appliant.put("Aid",encrypt.encryptToMD5(time.toString()));
            appliant.put("id",request.getSession().getAttribute("id").toString());
            //appliant.put("id","2294458237@qq.com");
            appliant.put("Aplace",request.getParameter("Aplace"));
            appliant.put("Atime",request.getParameter("Atime"));
            appliant.put("Amoney",request.getParameter("Amoney"));
            appliant.put("Dname",request.getParameter("Dname"));
            appliant.put("indexs","not");
            appliant.put("Areason1",request.getParameter("Areason1"));
            appliant.put("Urgent",request.getParameter("Urgent"));
            appliant.put("Areason2",request.getParameter("Areason2"));
            appliant.put("Areason3",request.getParameter("Areason3"));
            if(db.InsertApplicant(appliant)){
                result.put("success",true);
                response.getWriter().write(result.toString());
            }else {
                result.put("success",false);
                response.getWriter().write(result.toString());
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            response.sendRedirect("/GetIn.login");
        }else {
            request.getRequestDispatcher("/user/GetIn.login.jsp").forward(request,response);
        }
    }
}