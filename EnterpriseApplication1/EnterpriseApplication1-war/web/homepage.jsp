<%-- 
    Document   : homepage
    Created on : 30-Oct-2022, 20:55:51
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>
<%@page import="model.Config"%>
<%@page import="model.MyUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                padding: 0 10rem;
                height: 90vh;
                width: 100%;
                align-items: center;
            }

            .content{
                display: inherit;
                flex-direction: column; 
                gap: 10px;

            }
        </style>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <div class="main">

            <c:if test="!${sessionScope.login.role}">
                <h1>no user found</h1>
            </c:if>
            
            <c:if test="${sessionScope.login.role == 'committee'}">
                <div class="content">
                    <h1>Welcome back <%= ((MyUser) request.getSession().getAttribute("login")).getName()%></h1>
                    <a class="btn btn-primary" href="committee/committee.jsp">Manage committee</a>
                    <a class="btn btn-primary" href="committee/student.jsp">Manage students</a>
                    <a class="btn btn-primary" href="committee/contestant.jsp">Manage contestants</a>
                    <a class="btn btn-primary" href="committee/position.jsp">Manage positions</a>                   
                    <a class="btn btn-primary" href="election_date.jsp">Choose election date</a>                

                    <button class="btn btn-primary">Generate report</button>

                </div>
            </c:if>

            <c:if test="${sessionScope.login.role == 'contestant'}">
                <div class="content">
                    <h1>Welcome back contestant <%= ((MyUser) request.getSession().getAttribute("login")).getName()%></h1>
                    <h2>Election is starting at <%= new Date(Config.getStartTimestamp() * 1000L)%></h2>

                    <a class="btn btn-primary" href="contestant/register_seat.jsp">Register seat</a>
                    <a class="btn btn-primary" href="contestant/contestants.jsp">View all contestant</a>


                </div>
            </c:if>   

            <c:if test="${sessionScope.login.role == 'student'}">
                <h1>Welcome back student <%= ((MyUser) request.getSession().getAttribute("login")).getName()%></h1>
                
                <c:if test="<%= Config.electionStarted() && !Config.electionEnded()%>">  
                    <h2>Election has started. Start voting! (<%= Config.electionHoursLeft() %> hours left to vote)</h2>
                    <a class="btn btn-primary" href="student/vote_homepage.jsp" >Vote now</a>
                </c:if>
                <c:if test="<%= !Config.electionStarted() %>">  
                    <h2>Election will be starting at <%= new Date(Config.getStartTimestamp() * 1000L)%></h2>
                    <a class="btn btn-primary disabled" href="student/vote_homepage.jsp" >Vote now</a>
                </c:if>
                <c:if test="<%= Config.electionEnded()%>">  
                    <h2>Election has ended. Thank you.</h2>
                    <a class="btn btn-primary" href="view_results.jsp" >Results</a>
                </c:if>

            </c:if>



        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
