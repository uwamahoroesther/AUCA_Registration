<%@ page import="rw.ac.auca.model.StudentCource" %>
<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.service.interfaces.StudentCourceInterface" %>
<%@ page import="rw.ac.auca.service.StudentCourceService" %>
<%@ page import="rw.ac.auca.model.StudentRegistration" %>
<%@ page import="rw.ac.auca.model.Student" %><%-- Created by IntelliJ IDEA. User: la paix Date: 21/10/2023 Time: 01:02 --%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Course Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<%@include file="pages/NavBar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-6 p-3 border">
            <form method="post" action="/SearchStudentServlet" class="mt-4">
                <h2>Search Student</h2>
                <div class="form-group">
                    <label for="studentId">Student ID</label>
                    <input type="text" class="form-control" id="studentId" name="studentId" required>
                </div>
                <div class="form-group">
                    <label for="studentName">Student Name</label>
                    <input type="text" class="form-control" id="studentName" value="${names}" name="studentName" readonly>

                </div>
                <label style="color: red">${message}</label><br>
                <button type="submit" class="btn btn-primary">Search Student</button>
            </form>
        </div>


        <!-- Form for adding a course (on the right) -->
        <div class="col-md-6 p-3 bg-light">
            <form id="courseForm" class="mt-4" method="post">
                <h2>Add Course</h2>
                <div class="form-group">
                    <label for="courseId">Course ID</label>
                    <input type="hidden" name="studentId" value="${stdId}">
                    <input type="hidden" name="studentNAme" value="${names}">
                    <input type="text" class="form-control" id="courseId" name="courseId" value="${courseId}" required>
                </div>
                <div class="form-group">
                    <label for="courseName">Course Name</label>
                    <input type="text" class="form-control" id="courseName" value="${cname}" name="courseName" readonly>
                </div>
                <div class="form-group">
                    <label for="courseCredit">Course Credit</label>
                    <input type="text" class="form-control" id="courseCredit" value="${cCredit}" name="courseCredit" readonly>
                </div>
                <!-- Add more course-related fields as needed -->

                <!-- Total Credit -->

                <!-- Buttons for Search and Add Course (on the same line) -->
                <div class="form-group">
                    <label style="color: red">${message1}</label><br>
                    <label style="color: green">${message11}</label><br>
                    <button type="button" class="btn btn-primary" onclick="searchCourse()">Search Course</button>
                    <button type="button" class="btn btn-success ml-2" onclick="addCourse()">Add Course</button>
                    <button type="button" class="btn btn-danger ml-2" onclick="removeCourse()">Remove Course</button>
                </div>
                <div class="form-group">
                    <label for="totalCredit">Total Credit</label>
                    <input type="text" class="form-control" id="totalCredit" name="totalCredit" readonly>
                </div>
            </form>
        </div>
    </div>


    <!-- Table to display courses and credits -->
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
            String studentIdFound = request.getParameter("studentId");

            if (studentIdFound != null) {
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
        <%}
        }%>
        </tbody>
    </table>
</div>

<script>
    function searchCourse() {
        // Submit the form to the SearchCourseServlet
        document.getElementById('courseForm').action = '/SearchCourseServlet';
        document.getElementById('courseForm').submit();

    }

    function addCourse() {
        // Submit the form to the AddCourseServlet
        document.getElementById('courseForm').action = '/AddCourseServlet';
        document.getElementById('courseForm').submit();
    }

    function removeCourse() {
        // Submit the form to the RemoveCourseServlet
        document.getElementById('courseForm').action = '/RemoveCourseServlet';
        document.getElementById('courseForm').submit();
    }
</script>
<!-- Add Bootstrap JS and jQuery links -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
