<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.text.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Answer Question</title>
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
    <h1><strong><a href="CustomerRepHomePage.jsp">BuyMe</a></strong></h1>
    <%
    String question = (String)request.getSession().getAttribute("question");
    out.println("<h1 style='font-size:25px'><strong>Answer " + question + "</strong></h1>");
    %>
    <form action="AnswerQuestionJava.jsp" method="post">
        <textarea name="answer_question" id="answer_question" placeholder="Answer (max. 600 characters)" maxlength="600"></textarea><br>
        <input type="submit" value="Submit Answer">
    </form>
</div>
</body>
</html>
