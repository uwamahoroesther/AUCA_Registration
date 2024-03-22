package rw.ac.auca.controller;

import rw.ac.auca.model.Teacher;
import rw.ac.auca.model.enums.EQualificatio;
import rw.ac.auca.service.TeacherService;
import rw.ac.auca.service.interfaces.TeacherInterface;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TeacherUpdateServlet", value = "/TeacherUpdateServlet")
public class TeacherUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Teacher teacher=new Teacher();
        String tCode=request.getParameter("tCode");
        String names=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String qualification=request.getParameter("qualification");
        String teacherType=request.getParameter("teacherType");
        teacher.settCode(tCode);
        teacher.setName(names);
        teacher.setEmail(email);
        teacher.setPhone(phone);
        teacher.setQualification(EQualificatio.valueOf(qualification));
        teacher.setTeacherType(teacherType);
        TeacherInterface teacherInterface=new TeacherService();
        boolean updated=teacherInterface.updateTeacher(teacher);
        if(updated){
            request.setAttribute("info","Teacher Update");
            request.getRequestDispatcher("Teacher.jsp").forward(request,response);
        }else{
            request.setAttribute("info1","Teacher not update Update");
            request.getRequestDispatcher("Teacher.jsp").forward(request,response);

        }
    }
}
