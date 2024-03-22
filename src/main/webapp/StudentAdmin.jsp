<%--
  Created by IntelliJ IDEA.
  User: la paix
  Date: 20/10/2023
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="rw.ac.auca.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ page import="rw.ac.auca.service.interfaces.AccademicUnitInterface" %>
<%@ page import="rw.ac.auca.service.AccademicUnitService" %>
<%@ page import="rw.ac.auca.model.AccademicUnit" %>
<%@ page import="rw.ac.auca.model.enums.ERegistrationStatus" %>
<%@ page import="rw.ac.auca.service.interfaces.SemesterInterface" %>
<%@ page import="rw.ac.auca.service.SemesterService" %>
<%@ page import="rw.ac.auca.model.Semester" %>
<%-- Set the appropriate imports and necessary dependencies --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@include file="pages/NavBar.jsp" %>
<div class="container mt-4">
    <h2>New Student Form</h2>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
    <form method="post" action="/StudentAdminServlet" >
        <div class="mb-3">
            <%
                Random random = new Random();
                int min = 1000; // Define your minimum registration number
                int max = 9999; // Define your maximum registration number
                int randomRegistrationNumber = random.nextInt(max - min + 1) + min;
            %>
            <label for="regNo" class="form-label">Registration Number</label>
            <input type="text" class="form-control" id="regNo" name="regNo" value="<%="AUCA-REG-"+randomRegistrationNumber %>" required readonly>
        </div>
        <div class="mb-3">
            <label for="fName" class="form-label">First Name</label>
            <input type="text" class="form-control" id="fName" name="fName" required>
        </div>
        <div class="mb-3">
            <label for="lName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lName" name="lName" required>
        </div>
        <div class="mb-3">
            <label for="dateOfBirth" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
        </div>

        <div class="mb-3">
            <label for="studentId" class="form-label">Student ID</label>
            <input type="text" class="form-control" id="studentId" name="studentId" required>
        </div>
        <div class="mb-3">
            <label for="registrationDate" class="form-label">Registration Date</label>
            <input type="text" class="form-control" id="registrationDate" name="registrationDate" readonly>
        </div>
        <div class="mb-3">
            <label for="accademicUnit" class="form-label">Academic Unit</label>
            <select class="form-select" id="accademicUnit" name="accademicUnit" required>
                <%
                    AccademicUnitInterface infc1=new AccademicUnitService();
                    List<AccademicUnit> departments = infc1.getAllDepartments();
                    for (AccademicUnit department : departments) {
                %>
                <option value="<%=department.getCode()%>"><%=department.getName()%></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="mb-3">
            <label for="Regstatus" class="form-label">Registration Status</label>
            <select class="form-select" id="Regstatus" name="Regstatus" required readonly="">
                <option value="<%=ERegistrationStatus.PENDING%>">Pending</option>

<%--                <option value="<%=ERegistrationStatus.APPROVED%>">Approved</option>--%>
<%--                <option value="<%=ERegistrationStatus.REJECTED%>">Rejected</option>--%>
            </select>
        </div>
<%--        <div class="mb-3">--%>
<%--            <label for="student" class="form-label">Student</label>--%>
<%--            <input type="text" class="form-control" id="student" name="student" required>--%>
<%--        </div>--%>
        <div class="mb-3">
            <label for="semester" class="form-label">Semester</label>
            <select class="form-select" id="semester" name="semester" required>
                <%
                    // Replace 'YourSemesterService' with your actual service class for semesters
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


        <label style="color: #0a4d98">${message}</label><br>

        <button type="submit" class="btn btn-primary">Add Student</button>
    </form>
</div>

<script>
    // Set the registration date input to today's date
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; // January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }

    var formattedDate = yyyy + '-' + mm + '-' + dd;
    document.getElementById("registrationDate").value = formattedDate;
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

