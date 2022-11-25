<%-- 
    Document   : vote_candidates.jsp
    Created on : 25-Nov-2022, 15:20:12
    Author     : munky
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
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
                display: flex;
                width: 100%;
                justify-content: center;
            }
            .candidate-frame{
                display: flex; 
                flex-direction: column;
                align-items: center;
            }
            .candidate-frame-content{
                border: 1px solid black;
                width: 100%;
                margin: 2rem; 
                padding: 2rem;
            }
            .candidate-frame-content > *{
                margin-bottom: 20px;
            }
            
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>

        <div class="main">
            <h1>${requestScope.position.name} candidates</h1>
            <div class="container">
                <div class="row">
                    <c:forEach var="individual" items="${requestScope.candidates}">
                        <div class="col-4 candidate-frame">
                            <div class="candidate-frame-content">
                                <h1>${individual.contested_by.name} (ID: ${individual.contested_by.id})</h1>                             
                                <h3><i class="bi bi-balloon"></i> ${individual.contested_by.yearOfBirth} <i class="bi bi-person"></i> ${individual.contested_by.gender}</h3>
                                <h3><i class="bi bi-envelope"></i> ${individual.contested_by.email}</h3>
                                <h3><i class="bi bi-mortarboard"></i> ${individual.contested_by.major}</h3>
                                <h3><i class="bi bi-pen"></i> ${individual.contested_by.skills}</h3>
                                <h3><i class="bi bi-body-text"></i> ${individual.contested_by.manifesto}</h3>
                                <div class="center">
                                    <form action="CastVote" method="POST">
                                        <button type="submit" name="candidate_id" value="${individual.id}" class="btn btn-primary">Vote</button>
                                    </form>
                                </div>
                                
                                
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
                
            </div>
        </div>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
