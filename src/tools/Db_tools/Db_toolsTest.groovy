package tools.Db_tools

import java.sql.Connection
import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet

class Db_toolsTest extends GroovyTestCase {
    void testInsertUserInfo() {
        Connection con;
        PreparedStatement sql;
        ResultSet res;
        String ConnetcStr = "jdbc:mysql://localhost:3306/product";
        String user = "root";
        String pass = "root";
        Map userinfo = new HashMap();
        userinfo.put("username","GetInSys.check")
        userinfo.put("password","admin")
        userinfo.put("statu","admin")
        Date date = new Date();
        userinfo.put("log_time",date.toString());
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
