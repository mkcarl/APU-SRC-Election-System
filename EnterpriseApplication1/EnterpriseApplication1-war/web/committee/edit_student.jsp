<%-- 
    Document   : registration
    Created on : Oct 25, 2022, 8:59:06 AM
    Author     : carl
--%>

<%@page import="model.MyUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit student page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .center{
                display: flex;
                flex-direction: column;
                padding: 0 45rem;
                justify-content: center;
                align-content: center;
                height: 90vh;
            }

            .submit-div{
                width:100%;
                display: flex;
                flex-direction: row;
                gap: 1rem;
                justify-content: flex-end;
            }

            label{
                font-size: 125%;
            }

            .message{
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>

        <% MyUser edit = (MyUser) request.getSession().getAttribute("edit"); %>

        <div class="center">

            <h1>Edit student</h1>
            <form>
                <label for="username" class="form-label">Username:</label>
                <input id="username" name="username" type="text" class="form-control"  value="${edit.username}">
                <label for="password" class="form-label">Password:</label>
                <input id="password" name="password" type="text" class="form-control" value="${edit.password}" >
                <label for="name" class="form-label">Full name:</label>
                <input id="name" name="name" type="text" class="form-control" value="${edit.name}">
                <label for="email" class="form-label">Email address:</label>
                <input id="email" name="email" type="email" class="form-control" value="${edit.email}">
                <label for="gender" class="form-label">Gender:</label>
                <input id="gender" name="gender" type="text" class="form-control" value="${edit.gender}">
                <label for="major" class="form-label">Major:</label>
                <input id="major" name="major" type="text" class="form-control" value="${edit.major}">
                <label for="yob" class="form-label">Year of Birth:</label>
                <input id="yob" name="yob" type="text" class="form-control" value="${edit.yearOfBirth}">                

                <%
                    if (request.getSession().getAttribute("message") != null) {
                %>
                <p class="message"><%=request.getSession().getAttribute("message")%></p>

                <%
                        request.getSession().removeAttribute("message");
                    }
                %>

                <div class="submit-div">
                    <button type="submit" class="btn btn-primary" formaction="UpdateStudent" formmethod="POST" name="id" value="${edit.id}">Confirm</button>
                    <a type="submit" class="btn btn-secondary" href="student.jsp">Cancel</a>
                </div>

            </form>
            <%
                request.getSession().removeAttribute("edit");
            %>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
