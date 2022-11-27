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
        <title>Add position</title>
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
            
            <h1>Add position</h1>
            <form action="AddPosition" method="POST">
                <label for="name" class="form-label">Position Name:</label>
                <input id="name" name="name" type="text" class="form-control">
                <label for="description" class="form-label">Description:</label>
                <textarea class="form-control" name="description"></textarea>
                <label for="seats" class="form-label">Number of available seats:</label>
                <input id="seats" name="seats" type="number" class="form-control">
                
                
                <p class="error-msg">${requestScope.error}</p>
                    
                <div class="submit-div">
                    <button type="submit" class="btn btn-primary">Add</button>
                    <a type="submit" class="btn btn-secondary" href="position.jsp">Cancel</a>
                </div>

            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
