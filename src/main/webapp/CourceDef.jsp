<%@ page import="rw.ac.auca.service.interfaces.CourceDefInterface" %>
<%@ page import="rw.ac.auca.service.CourceDefService" %>
<%@ page import="rw.ac.auca.model.CourceDefinition" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: la paix
  Date: 15/10/2023
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .delete-icon {
            color: red;
        }

    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@include file="pages/NavBar.jsp" %>
<div class="container mt-4">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseDefinitionModal">Add New Course Definition</button>
    <h2>Course Definition List</h2>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>COURSE CODE</th>
            <th>COURSE NAME</th>

            <th>DESCRIPTION</th>
            <th colspan="2">ACTION</th>
        </tr>
        </thead>
        <tbody>
        <!-- Loop through your existing course definitions and display them here -->
        <%
            try {
                CourceDefInterface courseInterface = new CourceDefService();
                List<CourceDefinition> courseList = courseInterface.courceDefinitionList();

                for (CourceDefinition course : courseList) {
        %>
        <tr>
            <td><%= course.getCodeDef() %></td>
            <td><%= course.getName() %></td>

            <td><%= course.getDescription() %></td>
            <td>
                <a href="#">
                    <i class="fas fa-edit"></i>
                </a>
            </td>
            <td>
                <a href="#" onclick="return confirm('Are you sure you want to delete this Course Definition?')">
                    <i class="fas fa-trash delete-icon"></i>
                </a>
            </td>
        </tr>
        <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
        <!-- Repeat the above row for each course definition -->
        </tbody>
    </table>
<!-- New Course Definition Form Modal -->
<div class="modal fade" id="addCourseDefinitionModal" tabindex="-1" role="dialog" aria-labelledby="addCourseDefinitionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCourseDefinitionModalLabel">Add New Course Definition</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/CourceDefServlet" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="courseCode" class="form-label">Course Code</label>
                        <input type="text" class="form-control" id="courseCode" name="courseCode" required>
                    </div>
                    <div class="mb-3">
                        <label for="courseName" class="form-label">Course Name</label>
                        <input type="text" class="form-control" id="courseName" name="courseName" required>
                    </div>

                    <div class="mb-3">
                        <label for="courseDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="courseDescription" name="courseDescription" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Course Definition</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
