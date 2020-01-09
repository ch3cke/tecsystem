import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "getoneapp")
public class getoneapp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            response.sendRedirect("/login.do");
        }else {
            String aid  = request.getParameter("aid");
            Db_tools db = new Db_tools();
            JSONObject app = new JSONObject();
            app = db.GetApplicantByAid(aid);
            response.getWriter().write(app.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
