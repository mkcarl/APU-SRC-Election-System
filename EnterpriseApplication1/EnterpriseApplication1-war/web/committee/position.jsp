<%-- 
    Document   : position_page
    Created on : Oct 26, 2022, 9:57:26 AM
    Author     : carl
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.MyUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Position Page</title>
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

            #action-input{
                width: 20rem;
            }
            #actions{
                display: flex;
                flex-direction: row;
                gap:10px;
                justify-content: flex-end;
            }
            .controls{
                display: flex; 
                justify-content: space-between;
            }
            .message{
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
        <!--if parameter exist-->


        <div class="main">
            <div class="title">
                <h1>Position</h1>
            </div>
            <div class="main-table">
                <div class="controls">
                    <form >
                        <div id="actions">
                            <input id="id" name="id" type="text" class="form-control" placeholder="eg: comm1">
                            <a type="button" class="btn btn-success" href="add_position.jsp">Add</a>
                            <button type="submit" class="btn btn-warning" formaction="EditPosition" formmethod="POST">Edit</button>
                            <button type="submit" class="btn btn-danger" formaction="DeletePosition" formmethod="POST">Delete</button>
                        </div>

                        <%                            if (request.getSession().getAttribute("message") != null) {
                        %>
                        <p class="message"><%=request.getSession().getAttribute("message")%></p>

                        <%
                                request.getSession().removeAttribute("message");
                            }
                        %>
                    </form>


                    <form >
                        <div id="actions">
                            <input id="action-input" name="name" type="text" class="form-control" placeholder="eg: comm1">
                            <!--                        <select>
                                                        <option value="id">ID</option>
                                                        <option value="username">Username</option>
                                                        <option value="fullname">Full name</option>
                                                        <option value="gender">Gender</option>
                        
                                                    </select>-->
                            <button type="submit" class="btn btn-primary" formaction="SearchPosition" formmethod="POST">Search</button>
                        </div>
                    </form>


                </div>
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Position Name</td>
                                <td>Description</td>
                                <td>Available seats</td>

                            </tr>
                        </thead>
                        <tbody>
                            <!--display records from database-->
                            <c:if test="<%= request.getSession().getAttribute("search") == null%>">
                                <sql:query var="all_position" dataSource="${myDS}">
                                    SELECT * FROM Position
                                </sql:query>
                                <c:forEach var="position" items="${all_position.rows}">
                                    <tr>
                                        <td><c:out value="${position.id}"></c:out></td>
                                        <td><c:out value="${position.name}"></c:out></td>
                                        <td><c:out value="${position.description}"></c:out></td>
                                        <td><c:out value="${position.numberOfAvailableSeats}"></c:out></td>

                                        </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="<%= request.getSession().getAttribute("search") != null%>">
                                <c:set var="position_list" value="${sessionScope.search}"></c:set>

                                <c:forEach var="position" items="${position_list}">
                                    <tr>
                                        <td><c:out value="${position.getId()}"></c:out></td>
                                        <td><c:out value="${position.getName()}"></c:out></td>
                                        <td><c:out value="${position.getDescription()}"></c:out></td>
                                        <td><c:out value="${position.getNumberOfAvailableSeats()}"></c:out></td>

                                        </tr>
                                </c:forEach>

                            </c:if>  

                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <%request.getSession().removeAttribute("search");%>

    </body>
</html>
