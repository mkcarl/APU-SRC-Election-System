<%-- 
    Document   : change_election_date
    Created on : 23-Nov-2022, 13:36:33
    Author     : munky
--%>

<%@page import="model.Config"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose Election Date</title>
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
            .center{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>

        <div class="main center" >
            <h1>Currently selected date is :</h1>
            <h2><u><%= new Date(Config.getStartTimestamp() * 1000L)%></u></h2>
            
            <br><br> 
            <h4>Please select new date</h4>
            <form action="ChangeElectionDate" method="POST">
                <div style="display: flex; align-content: center; flex-direction: column; gap: 10px; align-items: center">
                    <input name="newdate" type="date">
                    <button type="submit" class="btn btn-primary">Confirm</button>
                    <a class="btn btn-secondary" href="../election_date.jsp">Cancel</a>
                    
                </div> 
            </form>

        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </body>
    
</html>
