<%-- 
    Document   : contestants.jsp
    Created on : 13-Nov-2022, 16:29:13
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All contestants Page</title>
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
        <sql:query var="all_contestants" dataSource="${myDS}">
            SELECT 
                u.id as uid,
                u.name as user_fullname, 
                p.name as position_name
            FROM MyUser u 
            INNER JOIN Seat s 
            ON u.id = s.contested_by_id 
            JOIN Position p
            ON s.SEAT_FOR_ID = p.id
        </sql:query>
        <div class="main">
            <h1>All contestants</h1>
            <form>
                <c:forEach var="i" step="1" begin="0" end="${fn:length(all_contestants.rows) - 1}">

                    <p>${i+1}. ${all_contestants.rows[i].user_fullname} (contesting for ${all_contestants.rows[i].position_name})
                    <button class="btn btn-primary" type="submit" formaction="ContestantDetails" formmethod="POST" name="id" value="${all_contestants.rows[i].uid}">View details</button>
                    </p>
                </c:forEach>
            </form>
            
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
