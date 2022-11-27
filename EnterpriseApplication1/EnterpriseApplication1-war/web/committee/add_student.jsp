<%-- 
    Document   : registration
    Created on : Oct 25, 2022, 8:59:06 AM
    Author     : carl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add student page</title>
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
            
            .error-msg{
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>
        <div class="center">
            
            <h1>Add student</h1>
            <form action="AddStudent" method="POST">
                <label for="username" class="form-label">Username:</label>
                <input id="username" name="username" type="text" class="form-control">
                <label for="password" class="form-label">Password:</label>
                <input id="password" name="password" type="password" class="form-control">
                <label for="name" class="form-label">Full name:</label>
                <input id="name" name="name" type="text" class="form-control">
                <label for="email" class="form-label">Email address:</label>
                <input id="email" name="email" type="email" class="form-control">
                <label for="gender" class="form-label">Gender:</label>
                <input id="gender" name="gender" type="text" class="form-control">
                <label for="major" class="form-label">Major:</label>
                <input id="major" name="major" type="text" class="form-control">
                <label for="yob" class="form-label">Year of Birth:</label>
                <input id="yob" name="yob" type="text" class="form-control">
                
                
                <p class="error-msg">${requestScope.error}</p>
                    
                <div class="submit-div">
                    <button type="submit" class="btn btn-primary">Register</button>
                    <a type="submit" class="btn btn-secondary" href="student.jsp">Cancel</a>
                </div>

            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
