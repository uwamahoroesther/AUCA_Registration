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
<%@include file="/pages/NavBar.jsp" %>
<div class="container mt-4">



   <%
       String getId= request.getParameter("id");
       Teacher teacher= new Teacher();
       if(!getId.trim().isEmpty()){
           teacher.settCode(getId);

           TeacherInterface ifc=new TeacherService();
           List<Teacher> teacherList=ifc.findById(teacher);
           if(teacherList != null){
               for(Teacher teacher1 : teacherList){

               %>
       <div class="modal-content">
           <div class="modal-header">
               <h5 class="modal-title" id="addTeacherModalLabel">Update Teacher Information</h5>

           </div>
           <div class="modal-body">
               <form method="post" action="/TeacherUpdateServlet" class="needs-validation" novalidate>
                   <div class="mb-3">
                       <label for="tCode" class="form-label">Teacher Code</label>
                       <input type="text" class="form-control" id="tCode" value="<%=teacher1.gettCode()%>" name="tCode" readonly required>
                   </div>
                   <div class="mb-3">
                       <label for="name" class="form-label">Name</label>
                       <input type="text" class="form-control" id="name" value="<%=teacher1.getName()%>" name="name" required>
                   </div>
                   <div class="mb-3">
                       <label for="email" class="form-label">Email</label>
                       <input type="email" class="form-control" id="email" value="<%=teacher1.getEmail()%>"  name="email" required>
                   </div>
                   <div class="mb-3">
                       <label for="phone" class="form-label">Phone</label>
                       <input type="tel" class="form-control" id="phone" value="<%=teacher1.getPhone()%>"  name="phone" required>
                   </div>
                   <div class="mb-3">
                       <label for="qualification" class="form-label">Qualification</label>
                       <select class="form-select" id="qualification" name="qualification" required>
                           <option value="<%=teacher1.getQualification()%>" selected><%=teacher1.getQualification()%></option>
                           <option value="PROFESSOR">Professor</option>
                           <option value="MASTER">Master's</option>
                           <option value="PHD">Doctorate</option>
                       </select>
                   </div>
                   <div class="mb-3">
                       <label for="qualification" class="form-label">Teacher Type</label>
                       <select class="form-select" id="teacherType" name="teacherType" required>
                           <option selected value="<%=teacher1.getTeacherType()%>"><%=teacher1.getTeacherType()%></option>
                           <option value="Tutor">Tutor</option>
                           <option value="Assistant">Assistant</option>

                       </select>
                   </div>
                   <button type="submit" class="btn btn-primary">Update Teacher</button>
                   <button type="submit" class="btn btn-danger">Delete Teacher</button>
               </form>
           </div>
       </div>

    <%

           }
       }
           }



   %>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
