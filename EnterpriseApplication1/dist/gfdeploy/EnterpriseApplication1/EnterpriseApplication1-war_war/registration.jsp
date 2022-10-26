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
        <title>Registration page</title>
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
                flex-direction: column;
            }
            
            .submit-div button{
                margin: 1rem;
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
        <jsp:include page="banner.jsp"/>
        <div class="center">
            
            <h1>Registration page</h1>
            <form>
                <label for="username" class="form-label">Username:</label>
                <input id="username" type="text" class="form-control">
                <label for="password" class="form-label">Password:</label>
                <input id="password" type="password" class="form-control">
                <label for="name" class="form-label">Full name:</label>
                <input id="name" type="text" class="form-control">
                <label for="email" class="form-label">Email address:</label>
                <input id="email" type="email" class="form-control">
                <label for="major" class="form-label">Majoring in:</label>
                <input id="major" type="text" class="form-control">
                <label for="yob" class="form-label">Year of birth:</label>
                <input id="yob" type="number" class="form-control">
                
                <%request.getSession().setAttribute("message","message here");%>
                
                <%
                if(request.getSession().getAttribute("message") != null){
                %>
                <p class="message"><%=request.getSession().getAttribute("message")%></p>

                <%
                request.getSession().removeAttribute("message");
                }
                %>
                    
                <div class="submit-div">
                    <button type="submit" name="submit" value="student" class="btn btn-primary">Register as student</button>
                    <button type="submit" name="submit" value="contestor" class="btn btn-primary">Register as contestor</button>
                </div>

            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
