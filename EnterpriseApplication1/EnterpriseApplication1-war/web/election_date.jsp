<%-- 
    Document   : election_date
    Created on : 13-Nov-2022, 23:50:24
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.Date"%>
<%@page import="controller.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election date</title>
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                min-height: 90vh;
                width: 100%;
            }
            .center {
                text-align: center;
            }
            .message{
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>

        <div class="main center">
            <h1>Election is starting at : </h1>
            <h2><u><%= new Date(Config.getStartTimestamp() * 1000L)%></u></h2>
            
            <c:if test="${sessionScope.login.role == 'committee'}">
                <form>
                    <a class="btn btn-primary" href="/EnterpriseApplication1-war/committee/change_election_date.jsp">Change</a>
                </form>
            
            </c:if>
            <%
                if(request.getSession().getAttribute("message") != null){
                %>
                <p class="message"><%=request.getSession().getAttribute("message")%></p>

                <%
                request.getSession().removeAttribute("message");
                }
                %>
        </div>
    </body>
</html>
