package GetInfo;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetInfo.getAllApplicant")
public class getAllApplicant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("statues");
        JSONObject result = new JSONObject();
        if (flag!=null) {
            if (flag.toString().equals("manage")) {
                Db_tools db = new Db_tools();
                response.getWriter().write(db.GetAllApplicant().toString());
            } else {
                result.put("reason", "permission denied");
                result.put("success", 202);
            }
        }else {
            result.put("reason", " login first");
            result.put("success", 201);
        }

    }
}
