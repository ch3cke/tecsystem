package UserOperate;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
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
                if(request.getParameter("method").equals("delete")){
                    response.getWriter().write(deleteUser(request.getParameter("id")).toString());
                }else if(request.getParameter("method").equals("toadmin")){
//                    response.getWriter().write(toAdmin(request.getParameter("id"),request.getParameter("statues")).toString());
                    JSONObject result = new JSONObject();
                    String index = request.getParameter("indexs");
                    if(index.equals("0")){
                        toAdmin(request.getParameter("id"),"worker");
                        result.put("success",200);
                    }else if(index.equals("1")) {
                        toAdmin(request.getParameter("id"),"manage");
                        result.put("success",200);
                    }else if(index.equals("2")){
                        toAdmin(request.getParameter("id"),"finance");
                        result.put("success",200);
                    }else {
                        result.put("success",203);
                        result.put("reason","erroe");
                    }
                    response.getWriter().write(result.toString());
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
        Db_tools db = new Db_tools();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        JSONArray users = db.GetAllUser();
        response.getWriter().write(users.toString());
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
