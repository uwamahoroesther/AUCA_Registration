<%@ page import="java.util.List" %>
<%@ page import="rw.ac.auca.service.interfaces.*" %>
<%@ page import="rw.ac.auca.service.*" %>
<%@ page import="rw.ac.auca.model.*" %>
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
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">Add New Course</button>
    <label style="color: Green;">${info}</label>
    <label style="color: red;">${info1}</label><br>
    <h2>Course List</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Course Code</th>
            <th>Course Credit</th>
            <th>Course Definition</th>
            <th>Teacher</th>
            <th>Semester</th>
            <th>Department</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <!-- Loop through your existing courses and display them here -->
        <%
                        try {
                CourseInterface courseService = new CourseService();
                List<Cource> courseList = courseService.courceList();

                for (Cource course : courseList) {
        %>
        <tr><td><%=course.getCourseCode()%></td>
            <td><%= course.getCredit() %></td>
            <td><%= course.getCourceDefinition().getName() %></td>
            <td><%= course.getTreTeacher().getName() %></td>
            <td><%= course.getSemester().getName() %></td>
            <td><%= course.getAccademicUnit().getName()%></td>
            <td>
                <a href="editCourse.jsp?id=<%= course.getCourseCode() %>">
                    <i class="fas fa-edit"></i>
                </a>
            </td>
            <td>
                <a href="deleteCourse.jsp?id=<%= course.getCourseCode() %>" onclick="return confirm('Are you sure you want to delete this course?')">
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

        </tbody>
    </table>
    <!-- New Course Form Modal -->
    <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCourseModalLabel">Add New Course</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/CourseServlet" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="credit" class="form-label">Course Code</label>
                            <input type="text" class="form-control" id="courseCode" name="courseCode" required>
                        </div>
                        <div class="mb-3">
                            <label for="credit" class="form-label">Course Credit</label>
                            <input type="number" class="form-control" id="credit" name="credit" required>
                        </div>
                        <div class="mb-3">
                            <label for="courseDefinition" class="form-label">Course Definition</label>
                            <select class="form-select" id="courseDefinition" name="courseDefinition" required>
                                <%

                                        CourceDefInterface courseInterface = new CourceDefService();
                                        List<CourceDefinition> cdf = courseInterface.courceDefinitionList();

                                    for (CourceDefinition course : cdf) {
                                %>
                                <option value="<%= course.getCodeDef() %>"><%= course.getName() %></option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="teacher" class="form-label">Teacher</label>
                            <select class="form-select" id="teacher" name="teacher" required>
                                <%
                                    List<Teacher> teacherList = null;

                                        TeacherInterface infc = new TeacherService();
                                        teacherList = infc.teacherList();

                                    for (Teacher teacher : teacherList) {
                                %>
                                <option value="<%= teacher.gettCode() %>"><%= teacher.getName() %></option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="semester" class="form-label">Semester</label>
                            <select class="form-select" id="semester" name="semester" required>
                                <%
                                    List<Semester> semesterList = null;

                                        SemesterInterface inf = new SemesterService();
                                        semesterList = inf.semesterList();

                                    for (Semester semester : semesterList) {
                                %>
                                <option value="<%= semester.getSemId() %>"><%= semester.getName() %></option>
                                <%

                                    }
                                %>


                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="accademicUnit" class="form-label">Department</label>
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
                        <button type="submit" class="btn btn-primary">Add Course</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
