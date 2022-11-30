<%-- 
    Document   : edit_profile
    Created on : Oct 26, 2022, 9:14:49 AM
    Author     : carl
--%>

<%@page import="model.MyUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .center{
                display: flex;
                flex-direction: column;
                padding: 0 45rem;
                justify-content: center;
                align-content: center;
                min-height: 90vh;
            }

            .submit-div{
                width:100%;
                display: flex;
                flex-direction: column;
            }

            .submit-div button{
                margin: 1rem;
            }

            label{
                font-size: 125%;
            }

            .error-msg{
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <% MyUser login = (MyUser) request.getSession().getAttribute("login"); %>
        <div class="center">

            <h1>Edit profile</h1>
            <form action="EditProfile" method="POST">
                <label for="username" class="form-label">Username:</label>
                <input id="username" name="username" type="text" class="form-control"  value="${login.username}" readonly >
                <label for="password" class="form-label">Password:</label>
                <input id="password" name="password" type="text" class="form-control" value="${login.password}" >
                <label for="name" class="form-label">Full name:</label>
                <input id="name" name="name" type="text" class="form-control" value="${login.name}">
                <label for="email" class="form-label">Email address:</label>
                <input id="email" name="email" type="email" class="form-control" value="${login.email}">
                <label for="gender" class="form-label">Gender:</label>
                <input id="gender" name="gender" type="text" class="form-control" value="${login.gender}">
                <label for="major" class="form-label">Major:</label>
                <input id="major" name="major" type="text" class="form-control" value="${login.major}">
                <label for="yob" class="form-label">Year of Birth:</label>
                <input id="yob" name="yob" type="number" class="form-control" value="${login.yearOfBirth}">  

                <c:if test="${login.role == 'contestant'}">
                    <label for="skill" class="form-label">Skills:</label>
                    <input id="skill" name="skill" type="text" class="form-control" value="${login.skills}" >
                    <label for="manifesto" class="form-label">Manifesto:</label>
                    <textarea id="manifesto" name="manifesto" type="text" class="form-control" rows="3">${login.manifesto}</textarea>
                    
                </c:if>
                               
                    <p class="error-msg">${requestScope.error}</p>
                        
                <div>
                    <a class="btn btn-secondary" href="homepage.jsp">Cancel</a>
                    <button type="submit" class="btn btn-primary" name="id" value="${login.id}">Save</button>
                </div>

            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</body>
</html>
