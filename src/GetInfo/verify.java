package GetInfo;

import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetInfo.verify")
public class verify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object id = request.getSession().getAttribute("id");
        JSONObject result = new JSONObject();
        if(id!=null){
            Db_tools db = new Db_tools();
            if(db.UpdateUserMail(id.toString())){
                result.put("success",200);
            }else {
                result.put("success",201);
            }
        }else {
            result.put("success",202);
        }
        response.getWriter().write(result.toString());
    }
}
