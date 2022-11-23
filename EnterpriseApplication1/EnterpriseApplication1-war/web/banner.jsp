<%-- 
    Document   : banner
    Created on : Oct 25, 2022, 9:45:09 AM
    Author     : carl
--%>

<%@page import="model.MyUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/EnterpriseApplication1-war/">
                    <img src="/EnterpriseApplication1-war/assets/apu_logo.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                    APU SRC Election 2022
                </a>
                <div class="navbar-nav">
                    <form>
                        <c:if test="<%= session.getAttribute("login") != null %>">
                            <%-- edit profile button --%>
                            <c:if test="<%= ((MyUser)session.getAttribute("login")).getRole().equals("student") || ((MyUser)session.getAttribute("login")).getRole().equals("contestant") %>">
                                <a class="btn btn-outline-primary" href="edit_profile.jsp">Edit profile</a>
                            </c:if>
                            <%-- logout button --%>                                
                            <button type="submit" class="btn btn-outline-primary" formaction="/EnterpriseApplication1-war/Logout" formmethod="POST">Logout</button>
                        </c:if>
                        
                    </form>
                </div>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
