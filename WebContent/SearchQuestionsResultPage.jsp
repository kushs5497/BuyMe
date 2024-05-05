<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Search Results</title>
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
        h1 {
            margin-top: 0;
            font-size: 30px;
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
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        input[type="submit"] {
            height: 35px;
            width: 125px;
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
    <h1 style="font-size: 25px;"><strong>Search Results</strong></h1>

    <form action="QuestionsPage.jsp" method="post">
        <input type="submit" value="Reset">
    </form>

    <% try {
           ApplicationDB db = new ApplicationDB();	
           Connection con = db.getConnection();
           Statement stmt = con.createStatement();
           String keyword = request.getParameter("keyword");
           String query = "select question, question_id from questions where question like '%" + keyword + "%'";
           ResultSet result = stmt.executeQuery(query);
    %>
    <form action="QuestionsAnswersPage.jsp">
        <table>
            <tr>
                <th><strong><u>Questions</u></strong></th>
            </tr>
            <% int i = 1;
               while(result.next()) { %>
            <tr>
                <td><a href="QuestionAnswersPage.jsp?num=<%= i %>"><%= result.getString(1) %></a></td>
                <% request.getSession().setAttribute("selectedQuestionID" + i, result.getString(2));
                   request.getSession().setAttribute("selectedQuestion" + i, result.getString(1));
                   i++; %>
            </tr>
            <% } %>
        </table>
    </form>
    <% con.close();
       } catch (Exception ex) {
          out.print(ex);
          out.print("insert failed");
       }
    %>
    <form action="LoginSuccess.jsp">
        <input type="submit" value="Go back to main page">
    </form>
</div>
</body>
</html>
