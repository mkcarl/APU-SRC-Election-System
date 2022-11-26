<%-- 
    Document   : election_progress
    Created on : 26-Nov-2022, 17:00:08
    Author     : munky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Progress</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .main{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
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
            .report{
                display: flex; 
                flex-direction: column;
                border: 1px solid black;
                padding: 1rem;
            }
            .report-value{
                text-align: end;
                font-weight: bold;
            }
            </style>
    </head>
    <body>
        <jsp:include page="../banner.jsp"/>

        <div class="main">
            <h1>Election progress report</h1>
            <div class="report">
                <h1><u>Details</u></h1>
                <table>
                    <tbody>
                        <tr> 
                            <td><h3>Election start date</h3></td> 
                            <td class="report-value">${requestScope.eStart}</td> 
                        </tr>
                        <tr> 
                            <td><h3>Election end date</h3></td> 
                            <td class="report-value">${requestScope.eEnd}</td> 
                        </tr>
                        <tr> 
                            <td><h3>Election duration</h3></td> 
                            <td class="report-value">${requestScope.eDuration}</td> 
                        </tr>
                        <tr> 
                            <td><h3>Total registered students</h3></td> 
                            <td class="report-value">${requestScope.registeredStudents}</td> 
                        </tr>
                        <tr> 
                            <td><h3>Total registered contestants</h3></td> 
                            <td class="report-value">${requestScope.registeredContestants}</td> 
                        </tr>
                        <tr> 
                            <td><h3>Number of available positions</h3></td> 
                            <td class="report-value">${requestScope.nPosition}</td> 
                        </tr>
                        
                    </tbody>
                </table>
                <h1><u>Statistics</u></h1>
                <table>
                    <tbody>
                        <tr> 
                            <td><h3>Percentage of students voted</h3></td> 
                            <td class="report-value">${requestScope.percentageVoted}</td> 
                        </tr>
                    </tbody>
                </table>
                <h3>Votes trend graph</h3>
                <div>shows a graph of number of votes against time</div>
                <h1><u>Results</u></h1>
                        <jsp:include page="../results.jsp" />
                

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </body>
</html>
