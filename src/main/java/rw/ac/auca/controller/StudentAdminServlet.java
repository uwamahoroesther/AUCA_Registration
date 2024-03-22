package rw.ac.auca.controller;

import rw.ac.auca.model.AccademicUnit;
import rw.ac.auca.model.Semester;
import rw.ac.auca.model.Student;
import rw.ac.auca.model.StudentRegistration;
import rw.ac.auca.model.enums.ERegistrationStatus;
import rw.ac.auca.service.StudentRegService;
import rw.ac.auca.service.StudentService;
import rw.ac.auca.service.interfaces.StudentInterface;
import rw.ac.auca.service.interfaces.StudentRegInterface;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "StudentAdminServlet", value = "/StudentAdminServlet")
public class StudentAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ///DATA FOR STUDENT
        String regNo= request.getParameter("regNo");
        String fName=request.getParameter("fName");
        String lName=request.getParameter("lName");
        String dateOfBirth= request.getParameter("dateOfBirth");
        Student student=new Student();
        student.setRegNo(regNo);
        student.setfName(fName);
        student.setlName(lName);

        student.setDateOfBirth(dateOfBirth);
        StudentInterface infc=new StudentService();
        boolean result=infc.newStudent(student);
        /// DATA FOR STUDENT REGISTRATION

        String studentId = request.getParameter("studentId");
        String registrationDate = request.getParameter("registrationDate");
        String academicUnitId = request.getParameter("accademicUnit");
        String registrationStatus = request.getParameter("Regstatus");
        String studentName = request.getParameter("regNo");
        String semesterId = request.getParameter("semester");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate regDate= null;
        regDate = LocalDate.parse(registrationDate,formatter);


        StudentRegistration registration=new StudentRegistration();
        registration.setRegistrationDate(regDate);
        registration.setStudentId(studentId);
        registration.setRegstatus(ERegistrationStatus.valueOf(registrationStatus));
        AccademicUnit acc= new AccademicUnit();
        acc.setCode(academicUnitId);
        Student std= new Student();
        std.setRegNo(studentName);
        Semester sem= new Semester();
        sem.setSemId(semesterId);
        registration.setAccademicUnit(acc);
        registration.setStudent(std);
        registration.setSemester(sem);

        StudentRegInterface infc1=new StudentRegService();
        boolean saved1=infc1.newStudentRegistration(registration);



        if(result  && saved1){
            String message="Dear "+fName+" and "+lName+" you have Send your Request with new Reg Number "+regNo;
            request.setAttribute("message",message);
            request.getRequestDispatcher("StudentReg.jsp").forward(request,response);
        }else {
            String message="Dear "+fName+" and "+lName+" Sutudent of this information exist "+regNo;
            request.setAttribute("message",message);
            request.getRequestDispatcher("StudentAdmin.jsp").forward(request,response);
        }
    }
}
