package rw.ac.auca.controller;

import rw.ac.auca.model.*;
import rw.ac.auca.service.CourseService;
import rw.ac.auca.service.interfaces.CourseInterface;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CourseServlet", value = "/CourseServlet")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int credit =Integer.parseInt(request.getParameter("credit")) ;
        String courseDefinitionId = request.getParameter("courseDefinition");
        String teacherCode = request.getParameter("teacher");
        String semesterId = request.getParameter("semester");
        String department = request.getParameter("accademicUnit");
        String courseCode=request.getParameter("courseCode");



        Cource course = new Cource();
        CourceDefinition def=new CourceDefinition();
        def.setCodeDef(courseDefinitionId);
        Teacher tc=new Teacher();
        tc.settCode(teacherCode);
        Semester sem= new Semester();
        sem.setSemId(semesterId);

        AccademicUnit acc=new AccademicUnit();
        acc.setCode(department);

        course.setCredit(credit);
        course.setCourceDefinition(def);
        course.setTreTeacher(tc);
        course.setSemester(sem);
        course.setCourseCode(courseCode);
        course.setAccademicUnit(acc);




        CourseInterface courseService = new CourseService();
       boolean saved= courseService.newCourse(course);
        if(saved ==true){
            String info="New Course Added!!";
            request.setAttribute("info",info);
            request.getRequestDispatcher("Cources.jsp").forward(request,response);
        }else{
            String info1="Course Is Exist!!";
            request.setAttribute("info1",info1);
            request.getRequestDispatcher("Cources.jsp").forward(request,response);

        }



    }
}
