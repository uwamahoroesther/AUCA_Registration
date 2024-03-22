<%@ page import="rw.ac.auca.service.interfaces.StudentRegInterface" %>
<%@ page import="rw.ac.auca.service.StudentRegService" %>
<%@ page import="rw.ac.auca.model.enums.EQualificatio" %>
<%@ page import="rw.ac.auca.model.enums.ERegistrationStatus" %>
<%@ page import="rw.ac.auca.service.interfaces.StudentCourceInterface" %>
<%@ page import="rw.ac.auca.service.StudentCourceService" %>
<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.service.interfaces.CourseInterface" %>
<%@ page import="rw.ac.auca.service.CourseService" %>
<%@ page import="rw.ac.auca.model.*" %>



<%
   String id= request.getParameter("id");
   if(id != null){
       ERegistrationStatus status=ERegistrationStatus.APPROVED;

       StudentRegInterface infc= new StudentRegService();
       boolean update= infc.updateRegistrationStatus(id,status);
       if(update){
           AccademicUnit acc= new AccademicUnit();
           Semester sem=new Semester();


          StudentRegistration find=infc.getStudentRegistrationByStudentId(id);
          if(find != null){
              acc.setCode(find.getAccademicUnit().getCode());
              sem.setSemId(find.getSemester().getSemId());

              CourseInterface courseInterface=new CourseService();
              List<Cource> courceList=courseInterface.getCourseByDepartmentAndSemester(acc,sem);
              for(Cource cource: courceList){
                  StudentCource studentCource = new StudentCource();
                  Cource c=new Cource();
                  c.setCourseCode(cource.getCourseCode());

                  StudentRegistration std=new StudentRegistration();
                  std.setStudentId(id);

                  studentCource.setCource(c);
                  studentCource.setStdReg(std);

                  StudentCourceInterface stdIfc= new StudentCourceService();
                  boolean stdSave=stdIfc.addStudentCource(studentCource);
                  if(stdSave){
                      ///mail for approve ment and course liste

                  }
              }

          }







           request.getRequestDispatcher("StudentReg.jsp").forward(request,response);
       }


   }

    %>