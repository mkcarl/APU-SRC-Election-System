<%-- 
    Document   : committee_page
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
        <title>Contestant Page</title>
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
                <h1>Contestant</h1>
            </div>
            <div class="main-table">
                <div class="controls">
                    <form >
                        <div id="actions">
                            <input id="id" name="id" type="text" class="form-control" placeholder="eg: comm1">
                            <a type="button" class="btn btn-success" href="add_contestant.jsp">Add</a>
                            <button type="submit" class="btn btn-warning" formaction="EditContestant" formmethod="POST">Edit</button>
                            <button type="submit" class="btn btn-danger" formaction="DeleteContestant" formmethod="POST">Delete</button>
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
                            <input id="action-input" name="username" type="text" class="form-control" placeholder="eg: comm1">
                            <!--                        <select>
                                                        <option value="id">ID</option>
                                                        <option value="username">Username</option>
                                                        <option value="fullname">Full name</option>
                                                        <option value="gender">Gender</option>
                        
                                                    </select>-->
                            <button type="submit" class="btn btn-primary" formaction="SearchContestant" formmethod="POST">Search</button>
                        </div>
                    </form>


                </div>
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Username</td>
                                <td>Password</td>
                                <td>Full name</td>
                                <td>Email</td>
                                <td>Gender</td> 
                                <td>Major</td> 
                                <td>Year of Birth</td> 
                                <td>Manifesto</td> 
                                <td>Skills</td> 
                                
                            </tr>
                        </thead>
                        <tbody>
                            <!--display records from database-->
                            <c:if test="<%= request.getSession().getAttribute("search") == null%>">
                                <sql:query var="all_contestant" dataSource="${myDS}">
                                    SELECT * FROM myuser WHERE role = 'contestant'
                                </sql:query>
                                <c:forEach var="contestant" items="${all_contestant.rows}">
                                    <tr>
                                        <td><c:out value="${contestant.id}"></c:out></td>
                                        <td><c:out value="${contestant.username}"></c:out></td>
                                        <td><c:out value="${contestant.password}"></c:out></td>
                                        <td><c:out value="${contestant.name}"></c:out></td>
                                        <td><c:out value="${contestant.email}"></c:out></td>
                                        <td><c:out value="${contestant.gender}"></c:out></td>
                                        <td><c:out value="${contestant.major}"></c:out></td>
                                        <td><c:out value="${contestant.yearOfBirth}"></c:out></td>
                                        <td><c:out value="${contestant.manifesto}"></c:out></td>
                                        <td><c:out value="${contestant.skills}"></c:out></td>

                                        </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="<%= request.getSession().getAttribute("search") != null%>">
                                <c:set var="contestant_list" value="${sessionScope.search}"></c:set>

                                <c:forEach var="contestant" items="${contestant_list}">
                                    <tr>
                                        <td><c:out value="${contestant.getId()}"></c:out></td>
                                        <td><c:out value="${contestant.getUsername()}"></c:out></td>
                                        <td><c:out value="${contestant.getPassword()}"></c:out></td>
                                        <td><c:out value="${contestant.getName()}"></c:out></td>
                                        <td><c:out value="${contestant.getEmail()}"></c:out></td>
                                        <td><c:out value="${contestant.getGender()}"></c:out></td>
                                        <td><c:out value="${contestant.getMajor()}"></c:out></td>
                                        <td><c:out value="${contestant.getYearOfBirth()}"></c:out></td>
                                        <td><c:out value="${contestant.getManifesto()}"></c:out></td>
                                        <td><c:out value="${contestant.getSkills()}"></c:out></td>

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
