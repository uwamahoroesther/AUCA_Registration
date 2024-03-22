        <%@ page import="rw.ac.auca.model.Semester" %>
<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.service.interfaces.SemesterInterface" %>
<%@ page import="rw.ac.auca.service.SemesterService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Semester Management</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .delete-icon {
            color: red;
        }
    </style>
</head>
<%@include file="pages/NavBar.jsp" %>
<div class="container mt-4">
<h1>Semester Management</h1>

<!-- Button to open the add semester form as a modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSemesterModal">
    Add Semester

</button>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
<%
    List<Semester> semesterList = null;
    try {
        SemesterInterface infc = new SemesterService();
        semesterList = infc.semesterList();
    } catch (Exception e) {
        e.printStackTrace();
    }


%>
<!-- Semester Table -->
<table class="table mt-3">
    <thead>
    <tr>
        <th>Semester ID</th>
        <th>Semester Name</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Semester semester : semesterList) {
    %>
    <tr>
        <td><%=semester.getSemId()%></td>
        <td><%=semester.getName()%></td>
        <td><%=semester.getStartDate()%></td>
        <td><%=semester.getEndDate()%></td>
        <td>
            <a href="editSemester.jsp?id=<%=semester.getSemId() %>">
                <i class="fas fa-edit"></i>
            </a>
        </td>
        <td>
            <a href="pages/Delete.jsp?id=<%= semester.getSemId() %>" onclick="return confirm('Are you sure you want to delete this teacher?')">
                <i class="fas fa-trash delete-icon"></i>
            </a>
        </td>
    </tr>
    <%
        }
    %>

    </tbody>
</table>

<!-- Add Semester Modal -->
<div class="modal fade" id="addSemesterModal" tabindex="-1" role="dialog" aria-labelledby="addSemesterModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSemesterModalLabel">Add New Semester</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-l`  abel="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/SemesterServlet" method="post">
                    <div class="form-group">
                        <label for="semId">Semester ID</label>
                        <input type="text" class="form-control" id="semId" name="semId">
                    </div>
                    <div class="form-group">
                        <label for="semesterName">Semester Name</label>
                        <input type="text" class="form-control" id="semesterName" name="semesterName">
                    </div>
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                    </div>
                    <div class="form-group">
                        <label for="endDate">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Semester</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
