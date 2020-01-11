import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StaticAll")
public class StaticAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        String statues = "worker";
//        String flag ="sss";
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        if(flag!=null){
            statues = request.getSession().getAttribute("statues").toString();
            Db_tools db = new Db_tools();
            if(statues.equals("manage")){
                String method = request.getParameter("method");
                if(method.equals("person")){
                    response.getWriter().write(db.StaticEveryOne("applicant").toString());
                }else if(method.equals("depart")) {
                    response.getWriter().write(db.StaticEveryPart("applicant").toString());
                }
            }else if(statues.equals("finance")) {
                String method = request.getParameter("method");
                if(method.equals("person")){
                    response.getWriter().write(db.StaticEveryOne("schedule").toString());
                }else if(method.equals("depart")) {
                    response.getWriter().write(db.StaticEveryPart("schedule").toString());
                }
            }else {
                JSONObject resu = new JSONObject();
                resu.put("success",201);
                resu.put("reason","permission denied");
                response.getWriter().write(resu.toString());
            }
        }else {
            response.sendRedirect("/login.do");
        }
    }
}
