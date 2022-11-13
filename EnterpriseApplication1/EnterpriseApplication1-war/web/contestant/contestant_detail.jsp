<%-- 
    Document   : contestant_detail
    Created on : 13-Nov-2022, 17:11:19  
    Author     : munky
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                padding: 0 10rem;
                min-height: 90vh;
                width: 100%;
            }
            .position-frame{
                border: 1px solid black;
                margin: 20px;
                padding: 2rem;
            }
            .center{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>
        <sql:setDataSource 
            var="myDS"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/sample"
            user="app"
            password="app"
            />
        <sql:query var="myuser" dataSource="${myDS}">
            SELECT * FROM MyUser WHERE id = ${requestScope.detail}
        </sql:query>
            <!--TODO : add stylings-->
            <div class="main">        
                <h1>Details of ${myuser.rows[0].name}</h1>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>${myuser.rows[0].name}</td>
                    </tr>
                    <tr>
                        <td>Age</td>
                        <td>${2022 - myuser.rows[0].yearOfBirth}</td>
                    </tr>
                    <tr>
                        <td>Major</td>
                        <td>${myuser.rows[0].major}</td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>${myuser.rows[0].gender}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>${myuser.rows[0].email}</td>
                    </tr>
                    <tr>
                        <td>Skill</td>
                        <td>${myuser.rows[0].skills}</td>
                    </tr>
                    <tr>
                        <td>Manifesto</td>
                        <td>${myuser.rows[0].manifesto}</td>
                    </tr>

                </table>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
