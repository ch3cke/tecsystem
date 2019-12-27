package tools.Db_tools;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Db_tools {
    private String ConnetcStr = "jdbc:mysql://47.98.167.108:3306/tecsystem";
    private String user = "db_user";
    private String pass = "guess";
    private Connection con;
    private PreparedStatement sql;
    private ResultSet res;
    public Db_tools(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(ConnetcStr, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    //获取所有的用户信息
    /*
    * @param mail 邮箱
    * */
    public Map<String, String> GetUserInfo(String mail){
        Map<String, String> result = new HashMap<String, String>();
        try{
            String sqlStr = "select * from userinfo where mail = ?";
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,mail);
            res = sql.executeQuery();
            while (res.next()){
                result.put("id",res.getString("id"));
                result.put("name",res.getString("username"));
                result.put("sex",res.getString("sex"));
                result.put("age",res.getString("age"));
                result.put("password",res.getString("password"));
                result.put("Did",res.getString("Did"));
                result.put("Dname",res.getString("Dname"));
                result.put("Mail",res.getString("Mail"));
                result.put("Medals",res.getString("Medals"));
                result.put("statues",res.getString("statues"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


    //插入用户信息
    /*
    @param userinfo 用户信息
     */
    public boolean InsertUserInfo(Map<String, String> userinfo){
        try {
            String insertUserInfo = "insert into userinfo(id, username, sex, age, password, Did, Dname, Mail, Medals, statues) values(?,?,?,?,?,?,?,?,?,?)";
            sql = con.prepareStatement(insertUserInfo);
            sql.setString(1, userinfo.get("id"));
            sql.setString(2, userinfo.get("username"));
            sql.setString(3, userinfo.get("sex"));
            sql.setString(4, userinfo.get("age"));
            sql.setString(5, userinfo.get("password"));
            sql.setString(6, userinfo.get("Did"));
            sql.setString(7, userinfo.get("Dname"));
            sql.setString(8, userinfo.get("email"));
            sql.setString(9, userinfo.get("Medals"));
            sql.setString(10, userinfo.get("statues"));
            sql.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private void setValue(Map<String, String> result, List<Map<String, String>> results) throws SQLException {
        while(res.next()){
            result.put("Aid",res.getString("Aid"));
            result.put("id",res.getString("id"));
            result.put("Aplace",res.getString("Aplace"));
            result.put("Atime",res.getString("Atime"));
            result.put("Amoney",res.getString("Amoney"));
            result.put("Dname",res.getString("Dname"));
            result.put("index",res.getString("index"));
            result.put("Areason1",res.getString("Areason1"));
            result.put("Urgent",res.getString("Urgent"));
            result.put("Areason2",res.getString("Areason2"));
            result.put("Areason3",res.getString("Areason3"));
            results.add(result);
        }
    }

    private void setValue2(Map<String, String> result, List<Map<String, String>> results) throws SQLException {
        while(res.next()){
            result.put("Sid",res.getString("Sid"));
            result.put("id",res.getString("id"));
            result.put("Aplace",res.getString("Aplace"));
            result.put("Atime",res.getString("Atime"));
            result.put("Amoney",res.getString("Amoney"));
            result.put("Dname",res.getString("Dname"));
            result.put("Areason1",res.getString("Areason1"));
            result.put("isgive",res.getString("isgive"));
            result.put("Areason2",res.getString("Areason2"));
            result.put("Areason3",res.getString("Areason3"));
            results.add(result);
        }
    }

    private void getResult(String indexs, String sqlStr, Map<String, String> result, List<Map<String, String>> results) {
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,indexs);
            res = sql.executeQuery();
            setValue(result, results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateValue(String id, String medal, String sqlStr) {
        try {
            sql =con.prepareStatement(sqlStr);
            sql.setString(1,medal);
            sql.setString(2,id);
            sql.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    /*
    查找所有申请记录
     */
    public List<Map<String,String>> GetAllApplicant(){
        String sqlStr = "select * from applicant";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            setValue(result, results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    /*
    通过aid查找申请记录
     */
    public Map<String,String> GetApplicantById(String aid){
        Map<String,String> result = new HashMap<>();
        String sqlStr = "select * from applicant where Aid = ?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,aid);
            res=sql.executeQuery();
            while (res.next()){
                result.put("Aid",res.getString("Aid"));
                result.put("id",res.getString("id"));
                result.put("Aplace",res.getString("Aplace"));
                result.put("Atime",res.getString("Atime"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("Dname",res.getString("Dname"));
                result.put("index",res.getString("index"));
                result.put("Areason1",res.getString("Areason1"));
                result.put("Urgent",res.getString("Urgent"));
                result.put("Areason2",res.getString("Areason2"));
                result.put("Areason3",res.getString("Areason3"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /*
    通过状态查找记录
     */
    public List<Map<String,String>> GetApplicantByIndex(String indexs){
        String sqlStr = "select * from applicant where indexs = ?";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        getResult(indexs, sqlStr, result, results);
        return results;
    }

    /*
    通过姓名查找申请记录
     */
    public List<Map<String,String>> GetApplicantByDName(String Dname){
        String sqlStr = "select * from applicant where Dname = ?";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        getResult(Dname, sqlStr, result, results);
        return results;
    }

    /*
    插入申请记录
     */
    public  void InsertApplicant(Map<String,String> applicant){
        String sqlStr = "insert into applicant(Aid, id, Aplace, Atime, Amoney, Dname, indexs,Areason1, Urgent, Areason2, Areason3) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, applicant.get("Aid"));
            sql.setString(2, applicant.get("id"));
            sql.setString(3, applicant.get("Aplace"));
            sql.setString(4, applicant.get("Atime"));
            sql.setString(5, applicant.get("Amoney"));
            sql.setString(6, applicant.get("Dname"));
            sql.setString(7, applicant.get("indexs"));
            sql.setString(8, applicant.get("Areason1"));
            sql.setString(9, applicant.get("Urgent"));
            sql.setString(10, applicant.get("Areason2"));
            sql.setString(11, applicant.get("Areason3"));
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Map<String,String>> GetAllSchedule(){
        String sqlStr = "select * from schedule";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            setValue2(result,results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public Map<String,String> GetScheduleBySid(String sid){
        Map<String,String> result = new HashMap<>();
        String sqlStr = "select * from schedule where Aid = ?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,sid);
            res=sql.executeQuery();
            while (res.next()){
                result.put("Sid",res.getString("Sid"));
                result.put("id",res.getString("id"));
                result.put("Aplace",res.getString("Aplace"));
                result.put("Atime",res.getString("Atime"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("Dname",res.getString("Dname"));
                result.put("Areason1",res.getString("Areason1"));
                result.put("isgive",res.getString("isgive"));
                result.put("Areason2",res.getString("Areason2"));
                result.put("Areason3",res.getString("Areason3"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Map<String,String>> GetAllScheduleByDname(String Dname){
        String sqlStr = "select * from schedule where Dname = ?";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,Dname);
            res = sql.executeQuery();
            setValue2(result,results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Map<String,String>> GetAllScheduleByIsGive(String isgive){
        String sqlStr = "select * from schedule where isgive = ?";
        Map<String,String> result = new HashMap<>();
        List<Map<String,String>> results = null;
        results = new ArrayList<Map<String, String>>();
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,isgive);
            res = sql.executeQuery();
            setValue2(result,results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public void InsertSchedule(Map<String,String> schedule){
        String sqlStr = "insert into schedule(Sid, id, Aplace, Atime, Amoney, Dname, Areason1, Areason2, Areason3, isgive) values(?,?,?,?,?,?,?,?,?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, schedule.get("Sid"));
            sql.setString(2, schedule.get("id"));
            sql.setString(3, schedule.get("Aplace"));
            sql.setString(4, schedule.get("Atime"));
            sql.setString(5, schedule.get("Amoney"));
            sql.setString(6, schedule.get("Dname"));
            sql.setString(7, schedule.get("Areason1"));
            sql.setString(8, schedule.get("Areason2"));
            sql.setString(9, schedule.get("Areason3"));
            sql.setString(10, schedule.get("isgive"));
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Map<String,String> Getfinance(String Iid){
        String sqlStr = "select * from finance where Iid = ?";
        Map<String,String> result = new HashMap<>();
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,Iid);
            res = sql.executeQuery();
            while (res.next()){
                result.put("Iid",res.getString("Iid"));
                result.put("IsFinance",res.getString("IsFinance"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Map<String,String>> GetAllFinance(){
        List<Map<String,String>> results = null;
        Map<String,String> result = new HashMap<>();
        String sqlStr = "select * from finance";
        results = new ArrayList<Map<String, String>>();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while (res.next()){
                result.put("Iid",res.getString("Iid"));
                result.put("IsFinance",res.getString("IsFinance"));
                results.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public void InsertFinance(Map<String,String> finance){
        String sqlStr = "insert into finance(Lid,IsFinance) values(?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,finance.get("Iid"));
            sql.setString(2,finance.get("IsFinance"));
            sql.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void UpdateFinance(String Iid,String indexs){
        String sqlStr = "update finance set IsFinance = ? where Iid = ?";
        updateValue(Iid, indexs, sqlStr);

    }

    public void UpdateSchedule(String Sid,String indexs){
        String sqlStr = "update schedule set indexs = ? where Sid = ?";
        updateValue(Sid, indexs, sqlStr);

    }

    public void DeleteUser(String id) {
        String sqlStr = "DELETE FROM userinfo WHERE id = ?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, id);
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateUserpasswd(String id, String password){
        String sqlStr = "update userinfo set password=? where id =?";
        updateValue(id,password,sqlStr);
    }

    public void UpdateUserMedal(String id , String medal){
        String sqlStr = "update userinfo set Medals=? where id =?";
        updateValue(id, medal, sqlStr);
    }

    public void UpdateApplicant(String aid,String indexs){
        String sqlStr = "update applicant set indexs = ? where aid = ?";
        updateValue(aid, indexs, sqlStr);

    }

}
