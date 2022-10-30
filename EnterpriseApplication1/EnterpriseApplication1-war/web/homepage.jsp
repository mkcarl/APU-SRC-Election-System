<%-- 
    Document   : homepage
    Created on : 30-Oct-2022, 20:55:51
    Author     : munky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                padding: 0 10rem;
                height: 90vh;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <div class="main">
            <%
                if (request.getSession().getAttribute("login") == null){
                    // if no user found
            %>
            <%
                } else if (((User) request.getSession().getAttribute("login")).getRole() == "admin") {
                    // if user role is admin
            %>
            <%

        } else if (((User) request.getSession().getAttribute("login")).getRole() == "contestant") {
                    // if user role is constestant
            %>
            <%

        } else if (((User) request.getSession().getAttribute("login")).getRole() == "student") {
                    // if user role is student
            %>
            <%

        }
            %>


        </div>

        <h1>Hello World!</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
