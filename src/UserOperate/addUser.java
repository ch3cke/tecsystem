package UserOperate;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import tools.Db_tools.Db_tools;
import tools.Db_tools.encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserOperate.addUser")
public class addUser extends HttpServlet {
    private Db_tools db = new Db_tools();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object flag = request.getSession().getAttribute("islogin");
        if(flag==null){
            response.sendRedirect("/login");
        }else {
            if(request.getSession().getAttribute("statues").toString().equals("root")){
                if(request.getParameter("method")=="add"){
                    JSONObject user = new JSONObject();
                    user.put("id",request.getParameter("id"));
                    user.put("username",request.getParameter("username"));
                    user.put("sex",request.getParameter("id"));
                    user.put("age",request.getParameter("id"));
                    user.put("password", encrypt.encryptToMD5(request.getParameter("password")));
                    user.put("Did",request.getParameter("Did"));
                    user.put("Dname",request.getParameter("Dname"));
                    user.put("Mail",request.getParameter("Mail"));
                    user.put("statues",request.getParameter("statues "));
                    user.put("Medals",0);
                    response.getWriter().write(addOneUser(user).toString());
                }else if(request.getParameter("method")=="delete"){
                    response.getWriter().write(deleteUser(request.getParameter("id")).toString());
                }else if(request.getParameter("method")=="toadmin"){
                    response.getWriter().write(toAdmin(request.getParameter("id"),request.getParameter("statues")).toString());
                }
            }else {
                JSONObject result = new JSONObject();
                result.put("success",202);
                result.put("reason","permission denied");
                response.getWriter().write(result.toString());
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private JSONObject addOneUser(JSONObject info){
        JSONObject result = new JSONObject();
        if(db.InsertUserInfo(info)){
            result.put("success",200);
        }else {
            result.put("success",201);
        }
        return result;
    }

    private JSONObject deleteUser(String id){
        JSONObject result = new JSONObject();
        if(db.DeleteUser(id)){
            result.put("success",200);
        }else {
            result.put("success",201);
        }
        return result;
    }

    private JSONObject toAdmin(String id,String statues){
        JSONObject result = new JSONObject();
        if(db.UpdateUserStatue(id,statues)){
            result.put("success",200);
        }else {
            result.put("success",201);
        }
        return result;
    }
}
