<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Question Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2, h3 {
            margin-top: 0;
            font-size: 24px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
            font-size: 18px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        input[type="submit"] {
            height: 35px;
            width: 200px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
            border-radius: 4px;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="LoginSuccess.jsp">BuyMe</a></strong></h1>
    <h1>Question Details</h1>

    <%
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();

        String num = (String) request.getParameter("num");
        request.getSession().setAttribute("questionNum", num);

        String question = (String) request.getSession().getAttribute("selectedQuestion" + num);
        String questionID = (String) request.getSession().getAttribute("selectedQuestionID" + num);
        String username = (String) request.getSession().getAttribute("username");

        String checkIfUserIsCustomerRepQuery = "select * from cust_reps where rep_name = '" + username + "'";
        ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);

        boolean isCustomerRep = checkIfUserIsCustomerRepResults.next();
    %>

    <h2><%= question %></h2>
    <h3>Answers</h3>

    <% if (isCustomerRep) { %>
    <form action="AnswerQuestion.jsp">
        <input type="submit" value="Answer Question">
    </form>
    <% } %>

    <table>
        <%
            String query = "select replys.reply, cust_reps.rep_name from replys, cust_reps where replys.customer_rep_id = cust_reps.rep_id and question_id = " + questionID;
            ResultSet result = stmt.executeQuery(query);

            boolean hasAnswers = result.next();
            if (!hasAnswers) {
        %>
        <tr>
            <td colspan="2"><strong>No Answers Yet!</strong></td>
        </tr>
        <% } else {
            int i = 1;
            result.beforeFirst();
            while (result.next()) { %>
                <tr>
                    <td><strong><%= result.getString(2) %> replied:</strong></td>
                    <td><%= result.getString(1) %></td>
                </tr>
            <% }
        } %>
    </table>

    <% con.close(); %>
</div>
</body>
</html>
