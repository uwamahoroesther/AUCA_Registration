        <%--
  Created by IntelliJ IDEA.
  User: la paix
  Date: 15/10/2023
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="rw.ac.auca.model.enums.EQualificatio" %>
<%@ page import="rw.ac.auca.service.interfaces.TeacherInterface" %>
<%@ page import="rw.ac.auca.service.TeacherService" %>
<%@ page import="rw.ac.auca.model.Teacher" %>
<%@ page import="java.util.List" %>
<%-- Set the Qualification enum values as an attribute --%>

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
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTeacherModal">Add New Teacher</button>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
    <h2>Teacher List</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Teacher Code</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Teacher Type</th>
            <th>Qualification</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <!-- Loop through your existing teachers and display them here -->
        <%
            List<Teacher> teacherList = null;
            try {
                TeacherInterface infc = new TeacherService();
                teacherList = infc.teacherList();

                for (Teacher teacher : teacherList) {
        %>
        <tr>
            <td><%=teacher.gettCode()%></td>
            <td><%=teacher.getName()%></td>
            <td><%=teacher.getEmail()%></td>
            <td><%=teacher.getPhone()%></td>
            <td><%=teacher.getTeacherType()%></td>
            <td><%=teacher.getQualification()%></td>
            <td>
                <a href="./updatePages/TeacherUp.jsp?id=<%= teacher.gettCode() %>">
                    <i class="fas fa-edit"></i>
                </a>
            </td>
            <td>
                <a href="/pages/Delete.jsp?Tid=<%= teacher.gettCode() %>" onclick="return confirm('Are you sure you want to delete this teacher?')">
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


        <!-- Repeat the above row for each teacher -->
        </tbody>
    </table>



    

    <!-- New Teacher Form Modal -->
    <div class="modal fade" id="addTeacherModal" tabindex="-1" role="dialog" aria-labelledby="addTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTeacherModalLabel">Add New Teacher</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/TeacherServlet" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="tCode" class="form-label">Teacher Code</label>
                            <input type="text" class="form-control" id="tCode" name="tCode" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="qualification" class="form-label">Qualification</label>
                            <select class="form-select" id="qualification" name="qualification" required>
                                <option value="PROFESSOR">Professor</option>
                                <option value="MASTER">Master's</option>
                                <option value="PHD">Doctorate</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="qualification" class="form-label">Teacher Type</label>
                            <select class="form-select" id="teacherType" name="teacherType" required>
                                <option selected>---Select Teacher Type---</option>
                                <option value="Tutor">Tutor</option>
                                <option value="Assistant">Assistant</option>

                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Teacher</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
