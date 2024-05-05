<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Questions</title>
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
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        input[type="submit"] {
            height: 35px;
            width: 180px;
            margin: 10px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="<%= request.getSession().getAttribute("username") != null ? "CustomerRepHomePage.jsp" : "LoginSuccess.jsp" %>">BuyMe</a></strong></h1>
    <h1 style="font-size: 25px;"><strong>Questions</strong></h1>

    <% 
    try {
        ApplicationDB db = new ApplicationDB();	
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();
        String username = (String) request.getSession().getAttribute("username");
        ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery("select * from customer_reps where customer_rep_name = '" + username + "'");
        
        if (checkIfUserIsCustomerRepResults.next()) {
            out.println("<form action='CustomerRepHomePage.jsp'>");
        } else {
            out.println("<form action='LoginSuccess.jsp'>");
        }
    %>
        <input type="submit" value="Back to BuyMe">
    </form>

    <form action="AskQuestion.jsp">
        <input type="submit" value="Ask a Question">
    </form>
    
    <form action="SearchQuestionsPage.jsp">
        <input type="submit" value="Search Questions">
    </form>

    <br>

    <% 
        String submittedQuestion = request.getParameter("ask_question");
        request.getSession().setAttribute("submittedQuestion", submittedQuestion);

        String q = "select * from questions where question = '" + submittedQuestion + "'";
        ResultSet checkQuestionDup = stmt.executeQuery(q);

        if (submittedQuestion != null && !checkQuestionDup.next()) {
            String insert = "INSERT INTO questions(username, question) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, username);
            ps.setString(2, submittedQuestion);
            ps.executeUpdate();
        }

        String query = "select question, question_id from questions";
        ResultSet result = stmt.executeQuery(query);

        if (!result.next()) {  
            out.println("<h3>No Questions Yet!</h3>");
        } else {
            out.println("<table>");
            out.println("<tr><th>Questions</th></tr>");

            int i = 1;
            result.beforeFirst();
            while (result.next()) {
                String question = result.getString(1);
                String questionID = result.getString(2);

                out.println("<tr>");
                out.println("<td><a href='QuestionAnswersPage.jsp?num=" + i + "'>" + question + "</a></td>");
                request.getSession().setAttribute("selectedQuestionID" + i, questionID);
                request.getSession().setAttribute("selectedQuestion" + i, question);
                out.println("</tr>");

                i++;
            }
            out.println("</table>");
        }

        con.close();
    } catch (Exception ex) {
        out.print(ex);
        out.print("insert failed");
    }
    %>
</div>
</body>
</html>
