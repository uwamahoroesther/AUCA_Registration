<%--
  Created by IntelliJ IDEA.
  User: la paix
  Date: 20/10/2023
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="rw.ac.auca.model.StudentRegistration" %>
<%@ page import="rw.ac.auca.model.enums.ERegistrationStatus" %>
<%@ page import="rw.ac.auca.model.Student" %>
<%@ page import="rw.ac.auca.model.Semester" %>
<%@ page import="rw.ac.auca.model.AccademicUnit" %>
<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.service.interfaces.StudentRegInterface" %>
<%@ page import="rw.ac.auca.service.StudentRegService" %>
<%@ page import="rw.ac.auca.service.interfaces.AccademicUnitInterface" %>
<%@ page import="rw.ac.auca.service.AccademicUnitService" %>
<%@ page import="rw.ac.auca.service.interfaces.SemesterInterface" %>
<%@ page import="rw.ac.auca.service.SemesterService" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@include file="pages/NavBar.jsp" %>
<div class="container mt-4">
    <h2>Student Registration</h2>
<%--    <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudentRegistrationModal">--%>
<%--        Add Student Registration--%>

<%--    </button>--%>

  <a href="StudentAdmin.jsp"><button type="submit" class="btn btn-success">New Student Registration</button></a>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Student ID</th>
            <th>Registration Date</th>
            <th>Academic Unit</th>
            <th>Registration Status</th>
            <th>Student</th>
            <th>Semester</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <!-- Loop through the list of student registrations and display them in the table -->
        <%
            StudentRegInterface infc= new StudentRegService();
            List<StudentRegistration> studentRegistrations = infc.studentRegistrationList();
            for (StudentRegistration studentRegistration : studentRegistrations) {
        %>
        <tr>
            <td><%= studentRegistration.getStudentId() %></td>
            <td><%= studentRegistration.getRegistrationDate() %></td>
            <td><%= studentRegistration.getAccademicUnit().getName() %></td>
            <td><%= studentRegistration.getRegstatus() %></td>
            <td><%= studentRegistration.getStudent().getfName()+" "+studentRegistration.getStudent().getlName() %></td>
            <td><%= studentRegistration.getSemester().getName() %></td>
            <td>
                <a href="editStudentRegistration.jsp?id=<%= studentRegistration.getStudentId() %>">
                    <i class="fas fa-edit"></i>
                </a>
            </td>
            <td>
                <a href="pages/Delete.jsp?id=<%= studentRegistration.getStudentId() %>" onclick="return confirm('Are you sure you want to delete this teacher?')">
                    <i class="fas fa-trash delete-icon"></i>
                </a>
            </td>
            <td>
                <button class="btn btn-danger">Reject</button>

            </td>
            <td ><a href="Applove.jsp?id=<%= studentRegistration.getStudentId() %>"><button class="btn btn-success">Approve</button></a> </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Add Student Registration Modal -->
<div class="modal fade" id="addStudentRegistrationModal" tabindex="-1" role="dialog" aria-labelledby="addStudentRegistrationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSemesterModalLabel">Add New Semester</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-l`  abel="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/StudentRegServlet" >
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
                        <select class="form-select" id="Regstatus" name="Regstatus" required>
                            <option value="<%=ERegistrationStatus.PENDING%>">Pending</option>
                            <option value="<%=ERegistrationStatus.APPROVED%>">Approved</option>
                            <option value="<%=ERegistrationStatus.REJECTED%>">Rejected</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="student" class="form-label">Student</label>
                        <input type="text" class="form-control" id="student" name="student" required>
                    </div>
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
                    <button type="submit" class="btn btn-primary">Register Student</button>
                </form>
            </div>
        </div>
    </div>
</div>
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
