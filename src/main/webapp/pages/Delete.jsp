<%@ page import="rw.ac.auca.model.Teacher" %>
<%@ page import="rw.ac.auca.service.interfaces.TeacherInterface" %>
<%@ page import="rw.ac.auca.service.TeacherService" %>


<%
    String teacherDel=request.getParameter("Tid");

    if(!teacherDel.trim().isEmpty()) {
        Teacher teacher = new Teacher();
        teacher.settCode(teacherDel);
        TeacherInterface ifc = new TeacherService();
        boolean d = ifc.deleteTeacher(teacher);
        if (d) {
            request.setAttribute("info", "Teacher Deleted");
            request.getRequestDispatcher("../Teacher.jsp").forward(request,response);


        } else {
            request.setAttribute("info1", "Teacher Not Deleted");
            request.getRequestDispatcher("../Teacher.jsp").forward(request,response);

        }
    }
%>
