package tools.Db_tools;

import GetInSys.check;
import GetInfo.userinfo;
import groovy.sql.Sql;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.*;


public class Db_tools {
    private String ConnetcStr = "jdbc:mysql://47.98.167.108:3306/tecsystem";
    private String user = "db_user";
    private String pass = "ch3cke";
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
    
    public boolean UpdateuserSA(JSONObject info){
        String sqlStr = "update userinfo set age=?, sex=? where id =?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,info.getString("age"));
            sql.setString(2,info.getString("sex"));
            sql.setString(3,info.getString("id"));
            sql.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    //获取所有的用户信息
    /*
    * @param mail 邮箱
    * */
    public JSONObject GetUserInfo(String mail){
        JSONObject result = new JSONObject();
        try{
            String sqlStr = "select * from userinfo where id = ?";
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,mail);
            res = sql.executeQuery();
            setuser(result);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * @param name
     * @return
     */
    public JSONObject GetUserInfoByname(String name){
        JSONObject result = new JSONObject();
        try{
            String sqlStr = "select * from userinfo where username = ?";
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,name);
            res = sql.executeQuery();
            setuser(result);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    private void setuser(JSONObject result) throws SQLException {
        while (res.next()){
            result.put("id",res.getString("id"));
            result.put("name",res.getString("username"));
            result.put("sex",res.getString("sex"));
            result.put("age",res.getString("age"));
            result.put("password",res.getString("password"));
            result.put("Did",res.getString("Did"));
            result.put("Dname",res.getString("Dname"));
            result.put("Mail",res.getString("Mail"));
            result.put("Medals",res.getInt("Medals"));
            result.put("statues",res.getString("statues"));
            result.put("mailck",res.getBoolean("mailck"));
        }
    }

    /**
     *
     * @param id
     * @param mail
     * @return
     */
    public Boolean UpdateUserM(String id,String mail){
        String sqlStr = "update userinfo set Mail=? where id =?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,mail);
            sql.setString(2,id);
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public Boolean UpdateUserMail(String id){
        String sqlStr = "update userinfo set mailck=? where id =?";
        try {
            sql =con.prepareStatement(sqlStr);
            sql.setBoolean(1,true);
            sql.setString(2,id);
            sql.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //插入用户信息
    /*
    @param userinfo 用户信息
     */
    public boolean InsertUserInfo(JSONObject userinfo){
        try {
            String insertUserInfo = "insert into userinfo(id, username, sex, age, password, Did, Dname, Mail, Medals, statues) values(?,?,?,?,?,?,?,?,?,?)";
            sql = con.prepareStatement(insertUserInfo);
            sql.setString(1, userinfo.get("id").toString());
            sql.setString(2, userinfo.get("username").toString());
            sql.setString(3, userinfo.get("sex").toString());
            sql.setString(4, userinfo.get("age").toString());
            sql.setString(5, userinfo.get("password").toString());
            sql.setString(6, userinfo.get("Did").toString());
            sql.setString(7, userinfo.get("Dname").toString());
            sql.setString(8, userinfo.get("email").toString());
            sql.setInt(9, Integer.parseInt(userinfo.get("Medals").toString()));
            sql.setString(10, userinfo.get("statues").toString());
            sql.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private void setValue(JSONObject result, JSONArray results) throws SQLException {
        while(res.next()){
            result.put("Aid",res.getString("Aid"));
            result.put("id",res.getString("id"));
            result.put("Aplace",res.getString("Aplace"));
            result.put("Atime",res.getString("Atime"));
            result.put("Amoney",res.getString("Amoney"));
            result.put("Dname",res.getString("Dname"));
            result.put("index",res.getString("indexs"));
            result.put("Areason1",res.getString("Areason1"));
            result.put("Urgent",res.getString("Urgent"));
            result.put("Areason2",res.getString("Areason2"));
            result.put("Areason3",res.getString("Areason3"));
            result.put("Atime2",res.getString("Atime2"));
            results.put(result);
        }
    }

    private void setValue2(JSONObject result, JSONArray results) throws SQLException {
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
            result.put("paths",res.getString("paths"));
            results.put(result);
        }
    }

    private void getResult(String indexs, String sqlStr,JSONObject result, JSONArray results) {
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,indexs);
            res = sql.executeQuery();
            setValue(result, results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean updateValue(String id, String medal, String sqlStr) {
        try {
            sql =con.prepareStatement(sqlStr);
            sql.setString(1,medal);
            sql.setString(2,id);
            sql.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /*
    查找所有申请记录
     */
    public JSONArray GetAllApplicant(){
        String sqlStr = "select applicant.Aid,applicant.Atime2,applicant.Atime,applicant.Amoney,userinfo.username,applicant.Dname,applicant.Areason1,applicant.Areason2,applicant.Areason3,applicant.indexs from userinfo,applicant where applicant.id = userinfo.id";

        JSONArray results = new JSONArray();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while(res.next()){
                JSONObject result = new JSONObject();
                result.put("Aid",res.getString("Aid"));
                result.put("username",res.getString("username"));
                result.put("Dname",res.getString("Dname"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("index",res.getString("indexs"));
                result.put("Areason1",res.getString("Areason1"));
                result.put("Areason2",res.getString("Areason2"));
                result.put("Areason3",res.getString("Areason3"));
                result.put("Atime2",res.getString("Atime2"));
                result.put("Atime",res.getString("Atime"));
                results.put(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    /*
    通过id查找申请记录
     */
    public JSONArray GetApplicantByid(String id){
        String sqlStr = "select * from applicant where id = ?";
        JSONArray results = new JSONArray();
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,id);
            res=sql.executeQuery();
            while (res.next()){
                JSONObject result = new JSONObject();
                result.put("Aid",res.getString("Aid"));
                result.put("id",res.getString("id"));
                result.put("Aplace",res.getString("Aplace"));
                result.put("Atime",res.getString("Atime"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("Dname",res.getString("Dname"));
                result.put("index",res.getString("indexs"));
                result.put("Areason1",res.getString("Areason1"));
                result.put("Urgent",res.getString("Urgent"));
                result.put("Areason2",res.getString("Areason2"));
                result.put("Areason3",res.getString("Areason3"));
                result.put("Atime2",res.getString("Atime2"));
                results.put(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    private void getApplicant(String id, JSONObject result, String sqlStr) {
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,id);
            res=sql.executeQuery();
            while (res.next()){
                result.put("Aid",res.getString("Aid"));
                result.put("id",res.getString("id"));
                result.put("Aplace",res.getString("Aplace"));
                result.put("Atime",res.getString("Atime"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("Dname",res.getString("Dname"));
                result.put("index",res.getString("indexs"));
                result.put("Areason1",res.getString("Areason1"));
                result.put("Urgent",res.getString("Urgent"));
                result.put("Areason2",res.getString("Areason2"));
                result.put("Areason3",res.getString("Areason3"));
                result.put("Atime2",res.getString("Atime2"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public JSONObject GetApplicantByAid(String aid){
        JSONObject result = new JSONObject();
        String sqlStr = "select * from applicant where Aid = ?";
        getApplicant(aid, result, sqlStr);
        return result;
    }

    public JSONObject GetUserInfoById(String id){
        String sqlStr = "select * from userinfo where id = ?";
        JSONObject result = new JSONObject();
        try{
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,id);
            res = sql.executeQuery();
            setuser(result);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    /*
    通过状态查找记录
     */
    public JSONArray GetApplicantByIndex(String indexs){
        String sqlStr = "select * from applicant where indexs = ?";
        JSONObject result = new JSONObject();
        JSONArray results = new JSONArray();
        getResult(indexs, sqlStr, result, results);
        return results;
    }

    /*
    通过姓名查找申请记录
     */
    public JSONArray GetApplicantByDName(String Dname){
        String sqlStr = "select * from applicant where Dname = ?";
        JSONObject result = new JSONObject();
        JSONArray results = new JSONArray();
        getResult(Dname, sqlStr, result, results);
        return results;
    }

    /*
    插入申请记录
     */
    public  boolean InsertApplicant(JSONObject applicant){
        String sqlStr = "insert into applicant(Aid, id, Aplace, Atime, Amoney, Dname, indexs,Areason1, Urgent, Areason2, Areason3,Atime2) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, applicant.get("Aid").toString());
            sql.setString(2, applicant.get("id").toString());
            sql.setString(3, applicant.get("Aplace").toString());
            sql.setString(4, applicant.get("Atime").toString());
            sql.setInt(5, Integer.parseInt(applicant.get("Amoney").toString()));
            sql.setString(6, applicant.get("Dname").toString());
            sql.setString(7, applicant.get("indexs").toString());
            sql.setString(8, applicant.get("Areason1").toString());
            sql.setString(9, applicant.get("Urgent").toString());
            sql.setString(10, applicant.get("Areason2").toString());
            sql.setString(11, applicant.get("Areason3").toString());
            sql.setString(12,applicant.get("Atime2").toString());
            sql.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public JSONArray GetAllScheduleById(String id){
        String sqlStr = "select Sid, Aplace, Amoney, isgive from schedule where id = ?";
        JSONArray results = new JSONArray();
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,id);
            res = sql.executeQuery();
            while (res.next()){
                JSONObject result = new JSONObject();
                result.put("Sid",res.getString("Sid"));
                result.put("Aplace",res.getString("Aplace"));
                result.put("Amoney",res.getString("Amoney"));
                result.put("isgive",res.getString("isgive"));
                results.put(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public JSONObject GetScheduleBySid(String sid){
        JSONObject result = new JSONObject();
        String sqlStr = "select * from schedule where Sid = ?";
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
                result.put("path",res.getString("paths"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public JSONArray GetAllSchedule(){
        String sqlStr = "select * from schedule";
        JSONArray results = new JSONArray();
        JSONObject result = new JSONObject();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            setValue2(result,results);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public JSONArray GetAllScheduleByDname(String Dname){
        String sqlStr = "select * from schedule where Dname = ?";
        JSONObject result = new JSONObject();
        JSONArray results = null;
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

    public JSONArray GetAllScheduleByIsGive(String isgive){
        String sqlStr = "select * from schedule where isgive = ?";
        JSONObject result = new JSONObject();
        JSONArray results = null;
        ;
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

    public boolean InsertSchedule(JSONObject schedule){
        String sqlStr = "insert into schedule(Sid, id, Aplace, Atime, Amoney, Dname, Areason1, Areason2, Areason3, isgive,paths) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, schedule.get("Aid").toString());
            sql.setString(2, schedule.get("id").toString());
            sql.setString(3, schedule.get("Aplace").toString());
            sql.setString(4, schedule.get("Atime").toString());
            sql.setInt(5, Integer.parseInt(schedule.get("Amoney").toString()));
            sql.setString(6, schedule.get("Dname").toString());
            sql.setString(7, schedule.get("Areason1").toString());
            sql.setString(8, schedule.get("Areason2").toString());
            sql.setString(9, schedule.get("Areason3").toString());
            sql.setString(10, "n");
            sql.setString(11, schedule.get("paths").toString());
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public JSONObject Getfinance(String Iid){
        String sqlStr = "select * from finance where Iid = ?";
        JSONObject result = new JSONObject();
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

    public JSONArray GetAllFinance(){
        JSONArray results = null;
        JSONObject result = new JSONObject();
        String sqlStr = "select * from finance";
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while (res.next()){
                result.put("Iid",res.getString("Iid"));
                result.put("IsFinance",res.getString("IsFinance"));
                results.put(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public boolean InsertFinance(JSONObject finance){
        String sqlStr = "insert into finance(Iid,IsFinance) values(?,?)";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,finance.get("Lid").toString());
            sql.setString(2,finance.get("IsFinance").toString());
            sql.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean UpdateFinance(String Iid,String indexs){
        String sqlStr = "update finance set IsFinance = ? where Iid = ?";
        return updateValue(Iid, indexs, sqlStr);
    }

    public boolean UpdateSchedule(String Sid,String indexs){
        String sqlStr = "update getSchedule set indexs = ? where Sid = ?";
        return updateValue(Sid, indexs, sqlStr);
    }

    public boolean DeleteUser(String id) {
        String sqlStr = "DELETE FROM userinfo WHERE id = ?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1, id);
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean UpdateUserpasswd(String username, String password){
        String sqlStr = "update userinfo set password=? where username =?";
        return updateValue(username,password,sqlStr);
    }

    public boolean UpdateUserMedal(String id  , int medal){
        Integer m = Integer.parseInt(GetUserInfoById(id).getString("Medals"));
        String sqlStr = "update userinfo set Medals=? where id =?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setInt(1,medal+m);
            sql.setString(2,id);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean UpdateUserInfo(JSONObject userinfo){
        String sqlStr = "update userinfo set username=?,sex=?,age=?,Did=?,Dname=? where id =?";
        try {
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,userinfo.get("username").toString());
            sql.setString(2,userinfo.get("sex").toString());
            sql.setString(3,userinfo.get("age").toString());
            sql.setString(4,userinfo.get("Did").toString());
            sql.setString(5,userinfo.get("Dname").toString());
            sql.setString(6,userinfo.get("id").toString());
            sql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean UpdateApplicant(String aid,String indexs){
        String sqlStr = "update applicant set indexs = ? where aid = ?";
        return updateValue(aid, indexs, sqlStr);
    }

    public boolean UpdateUserStatue(String id, String statues){
        String Sqlstr = "Update userinfo set statues=? where id = ?";
        try {
            sql = con.prepareStatement(Sqlstr);
            sql.setString(1,statues);
            sql.setString(2,id);
            sql.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public JSONObject StatisticalSchdeuleById(String userId){
        String sqlStr = "select SUM(Amoney) as 'money', count(*) as 'count' from tecsystem.schedule where id = ?";
        JSONObject result = new JSONObject();
        try{
            sql = con.prepareStatement(sqlStr);
            sql.setString(1,userId);
            res = sql.executeQuery();
            while (res.next()){
                result.put("Money",res.getInt("money"));
                result.put("Count",res.getInt("count"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public JSONArray GetTen(){
        String sqlStr = "select id, username, Medals from userinfo order by Medals limit 0,10";
        JSONArray results = new JSONArray();
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while (res.next()){
                JSONObject result = new JSONObject();
                result.put("medals",res.getInt("Medals"));
                result.put("id",res.getString("id"));
                result.put("username",res.getString("username"));
                results.put(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public JSONArray StaticEveryOne(String table){
        JSONArray results = new JSONArray();
        String sqlStr = "select userinfo.username, count(*) as 'count',SUM(Amoney) as 'money' from tecsystem."+table+", tecsystem.userinfo where userinfo.id = "+table+".id group by userinfo.username";
        try{
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while (res.next()){
                JSONObject re = new JSONObject();
                re.put("Count",res.getInt("count"));
                re.put("Money",res.getInt("money"));
                re.put("name",res.getString("username"));
                results.put(re);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return results;
    }

    public JSONArray StaticEveryPart(String table){
        JSONArray results = new JSONArray();
        String sqlStr = "select Dname , count(*) as 'count',SUM(Amoney) as 'money' from tecsystem."+table+" group by DName";
        try{
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while(res.next()){
                JSONObject re = new JSONObject();
                re.put("Count",res.getInt("count"));
                re.put("Money",res.getInt("Money"));
                re.put("name",res.getString("Dname"));
                results.put(re);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return results;
    }

    public JSONObject StaticPlace(String table,String username,String method){
        String sqlStr = "select Aplace,count(Aplace) as 'time' from"+table+" where id = (select id from userinfo where username="+username+") group by Aplace";
        JSONObject result = new JSONObject();
        if(method.equals("depart")){
            sqlStr = "select Aplace,count(Aplace) as 'time' from"+table+" where id = (select id from userinfo where username="+username+") group by Aplace";
        }else {
            sqlStr = "select Aplace,count(Aplace) as 'time' from"+table+" where Dname ="+username+" group by Aplace";
        }
        try {
            sql = con.prepareStatement(sqlStr);
            res = sql.executeQuery();
            while (res.next()){
                JSONObject r = new JSONObject();
                r.put("place",res.getString("Aplace"));
                r.put("count",res.getString("time"));
                result.put(username,r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
