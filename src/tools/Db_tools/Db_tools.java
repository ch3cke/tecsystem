package tools.Db_tools;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class Db_tools {
    private String ConnetcStr = "jdbc:mysql://localhost:3306/product";
    private String user = "root";
    private String pass = "root";
//    private String SelectUserInfo = "select * from user_info";

    public Map<String, String> GetUserInfo(String username){
        Connection con;
        PreparedStatement sql;
        ResultSet res;
        Map<String, String> result = new HashMap<String, String>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(ConnetcStr, user, pass);
            String selectUserInfoByOne = "select * from user_info where username = ?";
            sql = con.prepareStatement(selectUserInfoByOne);
            sql.setString(1,username);
            res = sql.executeQuery();
            while(res.next()){
                result.put("username",res.getString("username"));
                result.put("passwd",res.getString("passwd"));
                result.put("statu",res.getString("statu"));
                result.put("log_time",res.getString("log_time"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public void InsertUserInfo(Map<String, String> userinfo){
        Connection con;
        PreparedStatement sql;
        ResultSet res;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(ConnetcStr, user, pass);
            String insertUserInfo = "insert into user_info(username, passwd, statu) values(?,?,?)";
            sql = con.prepareStatement(insertUserInfo);
            sql.setString(1, userinfo.get("username"));
            sql.setString(2, userinfo.get("password"));
            sql.setString(3, userinfo.get("statu"));
            sql.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
