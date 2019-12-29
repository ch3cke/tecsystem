import org.apache.tools.ant.taskdefs.SendEmail;
import tools.Db_tools.Db_tools;
import tools.Mail_tools.sendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "reset")
public class reset extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        Db_tools db = new Db_tools();
        String mail = db.GetUserInfoByname(username).get("Mail").toString();
        sendMail sender =new sendMail();
        String resetcode = getRandomString(6);
        request.getSession().setAttribute("resetcode",resetcode);
        request.getSession().setAttribute("username",username);
        try {
            sender.sendResetEmail(mail,"reset",resetcode);
            response.sendRedirect("/check");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/user/reset.jsp").forward(request,response);
    }

    public static String getRandomString(int length){
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
}
