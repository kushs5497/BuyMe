<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Submit Answer</title>
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
            font-size: 24px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        input[type="submit"] {
            height: 40px;
            width: 200px;
            font-size: 15px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        textarea {
            height: 100px;
            width: 250px;
            font-size: 14px;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            resize: vertical;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
    <%
    try {
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();
        String username = (String) request.getSession().getAttribute("username");
        String num = (String) request.getSession().getAttribute("questionNum");
        String reply = request.getParameter("answer_question");
        String query = "select rep_id from cust_reps where rep_name = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        ResultSet customerRepIDResult = ps.executeQuery();
        customerRepIDResult.next();
        String customerRepID = customerRepIDResult.getString(1);
        String questionID = (String) request.getSession().getAttribute("selectedQuestionID" + num);

        String insert = "INSERT INTO replys(reply, customer_rep_id, question_id) VALUES (?, ?, ?)";
        ps = con.prepareStatement(insert);
        ps.setString(1, reply);
        ps.setString(2, customerRepID);
        ps.setString(3, questionID);
        ps.executeUpdate();
        out.print("Answer Submitted!");
        con.close();
    } catch (Exception ex) {
        out.print(ex);
        out.print("Insert failed");
    }
    %>
    <br>
    <form action="QuestionsPage.jsp">
        <input type="submit" value="Go back to Questions">
    </form>
</div>
</body>
</html>
