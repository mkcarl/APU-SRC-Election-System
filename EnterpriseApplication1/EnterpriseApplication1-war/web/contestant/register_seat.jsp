<%-- 
    Document   : register_seat
    Created on : 13-Nov-2022, 14:33:15
    Author     : munky
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat Registration Page</title>
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
            .error-msg{
                color: red; 
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
        <sql:query var="all_position" dataSource="${myDS}">
            SELECT * FROM position
        </sql:query>
        <sql:query var="userRegistered" dataSource="${myDS}">
            SELECT COUNT (*) 
            AS count
            FROM MyUser u 
            JOIN Seat s 
            ON u.id = s.contested_by_id 
            JOIN Position p
            ON s.SEAT_FOR_ID = p.id
            WHERE u.id = ${sessionScope.login.getId()}
        </sql:query>
        <div class="main">
            <c:if test="${userRegistered.rows[0].count > 0}">
                
                <sql:query var="seatRegistered" dataSource="${myDS}">
                    SELECT p.name 
                    FROM MyUser u 
                    JOIN Seat s 
                    ON u.id = s.contested_by_id 
                    JOIN Position p
                    ON s.SEAT_FOR_ID = p.id
                    WHERE u.id = ${sessionScope.login.getId()}
                </sql:query>
                
                    <div class="center">
                        <h1>${sessionScope.login.getName()}, you are contesting for the position : </h1>
                        <h2>${seatRegistered.rows[0].name}</h2>
                        
                    </div>
            </c:if>
            <c:if test="${userRegistered.rows[0].count == 0}">
                <h1>Seat registration</h1>
                <p>Please select a seat to contest for.</p>
                <p>Note : You can only choose one position, and you cannot change your choice afterwards!</p>
                <p class="error-msg">${requestScope.error}</p>
                <div class="positions">
                    <form >
                        <c:forEach var="pos" items="${all_position.rows}">
                            <div class="position-frame">
                                <h1>${pos.name}</h1>
                                <h3>ID : ${pos.id}</h3>
                                <p>${pos.description}</p>

                                <button class="btn btn-primary" type="submit" formaction="RegisterPosition" formmethod="POST" name="register" value="${pos.id}" onclick="return confirm('Are you sure you want to run for ${pos.name}? This decision cannot be changed');">Register</button>
                            </div>

                        </c:forEach>
                    </form>
                </div>

            </c:if>

        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
