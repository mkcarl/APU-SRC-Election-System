<%-- 
    Document   : index
    Created on : Oct 25, 2022, 2:39:39 AM
    Author     : carl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APU SRC</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .center {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                padding: 0 10rem;
                height: 90vh; 
                text-align: center;
            }
            
        </style>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <div class="center">
            <h1>APU SRC is holding their annual election. Come cast your vote!</h1>
            <div>
                <a type="button" class="btn btn-primary">Register</a>
                <a type="button" class="btn btn-primary" href="login.jsp">Login</a>
            </div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
