<%-- 
    Document   : vote_homepage
    Created on : 24-Nov-2022, 23:29:08
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vote homepage</title>
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
                align-items: center;
            }
            .col-item{
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 1rem;
            }
            .description{
                color:gray;
                text-align: center;
                max-width: 70%;
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
        <sql:query var="positions" dataSource="${myDS}">
            SELECT * FROM Position 
        </sql:query>
        <div class="main">
            <h1>Cast your vote to make a change!</h1>
            <p>Note: you can vote for <u><b>one</b></u> candidate per position. </p>
            <div class="container">
                <div class="row">
                    <c:forEach var="pos" items="${positions.rows}" >
                        <div class="col-4 col-item">
                            <form action="VotePosition" method="POST">
                                <button type="submit" class="btn btn-primary" name="position" value="${pos.id}">${pos.name}</button>
                            </form>
                            <p class="description">${pos.description}</p>
                        </div>

                    </c:forEach>


                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
