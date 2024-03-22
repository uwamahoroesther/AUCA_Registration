package rw.ac.auca.controller;

import rw.ac.auca.model.StudentUser;
import rw.ac.auca.model.SystemUser;
import rw.ac.auca.service.interfaces.StudentUserInterface;
import rw.ac.auca.service.StudentUserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName= request.getParameter("userName");
        String password= request.getParameter("password");
        String userType=request.getParameter("user_type");
        System.out.println("This your data /n ===============================");
        System.out.println("User name "+ userName);
        System.out.println("password  " + password);
        System.out.println("user type  " +userType);
        StudentUserInterface login= new StudentUserService();

        if(userType==null){
            System.out.println("This is Student ");
            StudentUser std= new StudentUser();
            std.setStudentId(userName);
            std.setPassword(password);
           StudentUser user=(StudentUser) login.StudentUserLogin(std);
            if(user != null){
                request.getRequestDispatcher("StudentDash.jsp").forward(request,response);
            }else{
                String message="Incorrect Password or Id, Try again";
                request.setAttribute("message",message);

                request.getRequestDispatcher("index.jsp").forward(request,response);
            }



        }
        if("staff".equals(userType)){
            System.out.println("This is Staff ");

            SystemUser systemUser = new SystemUser();
            systemUser.setEmail(userName);
            systemUser.setPassword(password);
           SystemUser st=(SystemUser) login.sytemUserLogin(systemUser);
            if(st != null){
                request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
            }else{
                String message="Incorrect Password or User Name, Try again";
                request.setAttribute("message",message);
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }

        }




    }
}
