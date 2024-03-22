<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.model.*" %>
<%@ page import="rw.ac.auca.service.interfaces.*" %>
<%@ page import="rw.ac.auca.service.*" %>
<%@ page import="jakarta.persistence.criteria.CriteriaBuilder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<!-- Imports and HTML structure are unchanged -->

<body>
<%@include file="pages/NavBar.jsp" %>
<%@include file="pages/SubNav.jsp"%>

<div class="container">
    <h1 class="mt-5">List of Students by Semester</h1>
    <form class="form-inline mt-3" method="post" action="StudentCourseSemester.jsp">
        <div class="form-group flex-grow-1">
            <label for="course" class="mr-2">Select Course:</label>
            <select class="form-control" id="course" name="selectedCourse">
                <%
                    CourseInterface std = new CourseService();
                    List<Cource> courseList = std.courceList();
                    for (Cource course : courseList) {
                %>
                <option value="<%=course.getCourseCode()%>"><%=course.getCourceDefinition().getName()%></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group flex-grow-1">
            <label for="semester" class="mr-2">Select Semester:</label>
            <select class="form-control" id="semester" name="selectedSemester">
                <%
                    SemesterInterface semesterService = new SemesterService();
                    List<Semester> semesters = semesterService.semesterList();
                    for (Semester semester : semesters) {
                %>
                <option value="<%= semester.getSemId() %>"><%= semester.getName() %></option>
                <%
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary ml-2">Search</button>
    </form>
    <%
        String selectedSemester = request.getParameter("selectedSemester");
        String selectedCourse = request.getParameter("selectedCourse");
        if (selectedSemester != null && selectedCourse != null) {
            Semester semester = new Semester();
            semester.setSemId(selectedSemester);



           Cource course=new Cource();
           course.setCourseCode(selectedCourse);


           StudentCourceInterface infc = new StudentCourceService();
            List<StudentCource> studentList = infc.getStudentsByCourseAndSemester(course, semester);
    %>
    <h3 class="mt-5">List of Students in Course of <b><%=selectedCourse%></b>  In Semester <b><%=selectedSemester%></b></h3>
    <table class="table table-bordered table-striped mt-3">
        <thead class="thead-dark">
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Date of Birth</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (studentList != null) {
                for (StudentCource student : studentList) {
        %>
        <tr>
            <td><%= student.getStdReg().getStudentId() %></td>
            <td><%= student.getStdReg().getStudent().getfName() %></td>
            <td><%= student.getStdReg().getStudent().getlName() %></td>
            <td><%= student.getStdReg().getStudent().getDateOfBirth() %></td>
        </tr>
        <%
            }}
        %>
        </tbody>
    </table>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
