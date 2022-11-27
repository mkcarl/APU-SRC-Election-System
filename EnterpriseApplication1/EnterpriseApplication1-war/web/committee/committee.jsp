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
        <title>Committee Page</title>
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
        <!--if parameter exist-->


        <div class="main">
            <div class="title">
                <h1>Committee</h1>
            </div>
            <div class="main-table">
                <div class="controls">
                    <form >
                        <div id="actions">
                            <input id="id" name="id" type="text" class="form-control" placeholder="Committee ID">
                            <a type="button" class="btn btn-success" href="add_committee.jsp">Add</a>
                            <button type="submit" class="btn btn-warning" formaction="EditCommittee" formmethod="POST">Edit</button>
                            <button type="submit" class="btn btn-danger" formaction="DeleteCommittee" formmethod="POST">Delete</button>
                        </div>

                        <p class="error-msg">${requestScope.error}</p>
                    </form>


                    <form >
                        <div id="actions">
                            <input id="action-input" name="username" type="text" class="form-control" placeholder="Search By Username">
                            <!--                        <select>
                                                        <option value="id">ID</option>
                                                        <option value="username">Username</option>
                                                        <option value="fullname">Full name</option>
                                                        <option value="gender">Gender</option>
                        
                                                    </select>-->
                            <button type="submit" class="btn btn-primary" formaction="SearchCommittee" formmethod="POST">Search</button>
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
                            </tr>
                        </thead>
                        <tbody>
                            <!--display records from database-->
                            <c:if test="<%= request.getSession().getAttribute("search") == null%>">
                                <sql:query var="all_committee" dataSource="${myDS}">
                                    SELECT * FROM myuser WHERE role = 'committee'
                                </sql:query>
                                <c:forEach var="committee" items="${all_committee.rows}">
                                    <tr>
                                        <td><c:out value="${committee.id}"></c:out></td>
                                        <td><c:out value="${committee.username}"></c:out></td>
                                        <td><c:out value="${committee.password}"></c:out></td>
                                        <td><c:out value="${committee.name}"></c:out></td>
                                        <td><c:out value="${committee.email}"></c:out></td>
                                        <td><c:out value="${committee.gender}"></c:out></td>

                                        </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="<%= request.getSession().getAttribute("search") != null%>">
                                <c:set var="committee_list" value="${sessionScope.search}"></c:set>

                                <c:forEach var="committee" items="${committee_list}">
                                    <tr>
                                        <td><c:out value="${committee.getId()}"></c:out></td>
                                        <td><c:out value="${committee.getUsername()}"></c:out></td>
                                        <td><c:out value="${committee.getPassword()}"></c:out></td>
                                        <td><c:out value="${committee.getName()}"></c:out></td>
                                        <td><c:out value="${committee.getEmail()}"></c:out></td>
                                        <td><c:out value="${committee.getGender()}"></c:out></td>

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
