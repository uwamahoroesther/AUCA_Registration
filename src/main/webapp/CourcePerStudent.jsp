<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.model.StudentRegistration" %>
<%@ page import="rw.ac.auca.model.StudentCource" %>
<%@ page import="rw.ac.auca.service.interfaces.StudentCourceInterface" %>
<%@ page import="rw.ac.auca.service.StudentCourceService" %>
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
<body>
<%@include file="pages/NavBar.jsp" %>
<%@include file="pages/SubNav.jsp"%>

<div class="container">
    <h1 class="mt-5">List of Course per Student</h1>
    <form class="form-inline mt-3" method="post" action="CourcePerStudent.jsp">
        <div class="form-group flex-grow-1">
            <label for="studentId" class="mr-2">Student ID</label>
            <input type="text" name="studentId" id="studentId" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary ml-2">Search</button>
    </form>
    <%
        String studentIdFound = request.getParameter("studentId");
        if (studentIdFound != null) {
            %>
    <h3 class="mt-5">List of Course For Student  <%= studentIdFound%> </h3>

            <table class="table table-bordered table-striped mt-3">
        <thead class="thead-dark">
        <tr>
            <th>Cource Code</th>
            <th>Cource NAme</th>
            <th>Course Credit</th>
            <th>Teacher</th>
        </tr>
        </thead>
                <tbody>
         <%
            StudentRegistration studentRegistration = new StudentRegistration();
            studentRegistration.setStudentId(studentIdFound);
            StudentCourceInterface infc = new StudentCourceService();
            List<StudentCource> courceList = infc.getStudentCourcesByStudent(studentRegistration);
            for (StudentCource stdCource : courceList) {
    %>


        <tr>
            <td><%= stdCource .getCource().getCourseCode() %></td>
            <td><%= stdCource .getCource().getCourceDefinition().getName() %></td>
            <td><%= stdCource .getCource().getCredit() %></td>
            <td><%= stdCource .getCource().getTreTeacher().getName() %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
