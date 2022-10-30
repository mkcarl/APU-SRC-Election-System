<%-- 
    Document   : committee_page
    Created on : Oct 26, 2022, 9:57:26 AM
    Author     : carl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Committee Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                align-content: center;
                padding: 0 10rem;
                height: 90vh;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>
        <div class="main">
            <div class="title">
                <h1>Committee</h1>
            </div>
            <div class="main-table">
                <button class="btn btn-success">Add</button>
                <button class="btn btn-warning">Edit</button>
                <button class="btn btn-danger">Delete</button>
                <table class="table">
                    <thead>
                    <tr>
                        <td>ID</td>
                        <td>Password</td>
                        <td>Full name</td>
                        <td>Email</td>
                        <td>Gender</td> 
                   </tr>
                    </thead>
                    <tbody>
                        <!--display records from database-->
                    </tbody>
                </table>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </body>
</html>
