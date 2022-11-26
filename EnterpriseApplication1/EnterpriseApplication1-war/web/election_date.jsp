<%-- 
    Document   : election_date
    Created on : 13-Nov-2022, 23:50:24
    Author     : munky
--%>

<%@page import="model.Config"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.Date"%>
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
                align-items: center;
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
            
            <c:if test="${sessionScope.login.role == 'committee'}">
                <c:if test="<%= !Config.electionEnded()%>">
                <h1>Election start date is set at: </h1>
                <h2><u><%= new Date(Config.getStartTimestamp() * 1000L)%></u></h2>   
                    <c:if test="<%= Config.electionStarted()%>">
                        <a class="btn btn-primary disabled" href="/EnterpriseApplication1-war/committee/change_election_date.jsp">Change</a>
                    </c:if>
                </c:if>
                <c:if test="<%= Config.electionEnded()%>">
                    <h1>Election has ended</h1>        
                    <a class="btn btn-primary" href="/EnterpriseApplication1-war/view_results.jsp" >Results</a>
                </c:if>
                <form>
                    <c:if test="<%= !Config.electionStarted()%>">
                        <a class="btn btn-primary" href="/EnterpriseApplication1-war/committee/change_election_date.jsp">Change</a>
                    </c:if>
                    
                        
                    <br><br><br>
                    
                    <c:if test="<%= Config.electionStarted() && !Config.electionEnded() %>">  
                        <button type="submit" class="btn btn-danger" formaction="/EnterpriseApplication1-war/committee/EndElection" formmethod="POST" onclick="return confirm('Are you sure you want to end the election?');">End election</button>
                    </c:if>
                    
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
