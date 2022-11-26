<%-- 
    Document   : results
    Created on : 26-Nov-2022, 22:46:14
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
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
            .winner{
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <sql:setDataSource 
            var="myDS"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/sample"
            user="app"
            password="app"
            />

        <sql:query var="positions" dataSource="${myDS}">
            SELECT * FROM POSITION
        </sql:query>
        <c:forEach var="pos" items="${positions.rows}">
            <sql:query var="winnings" dataSource="${myDS}">
                SELECT u."NAME", COUNT(v.VOTED_FOR_ID) AS nvotes
                FROM VOTE v
                RIGHT JOIN SEAT s ON v.VOTED_FOR_ID = s.ID
                JOIN MYUSER u ON s.CONTESTED_BY_ID = u.ID
                JOIN "POSITION" p ON s.SEAT_FOR_ID = p.ID
                WHERE p."NAME" = '${pos.name}'
                GROUP BY 
                    v.VOTED_FOR_ID, 
                    u."NAME"
                ORDER BY nvotes DESC
            </sql:query>
            <h1>${pos.name}</h1>
            <c:if test="${winnings.rows[0].name != null}"> 
                <div class="alert-success alert winner">
                    <p>${winnings.rows[0].name} (${winnings.rows[0].nvotes} votes)</p>
                </div>
            </c:if>
            <c:if test="${winnings.rows[0].name == null}"> 
                <p><em>No registered candidates</em></p>
            </c:if>
            <c:forEach var="candidate" begin="1" items="${winnings.rows}">
                <p>${candidate.name} (${candidate.nvotes} votes)</p>
            </c:forEach>
                <hr width="100%"/>
        </c:forEach>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </body>
</html>
