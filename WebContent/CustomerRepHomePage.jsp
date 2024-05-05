<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Customer Representative Dashboard</title>
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
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
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
            margin-bottom: 10px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="CustomerRepHomePage.jsp">BuyMe</a></strong></h1>
    <%
    String customerRepName = (String) request.getSession().getAttribute("username");
    out.print("Welcome to BuyMe, " + customerRepName);
    %>
    <br><br><br>
    <form action="QuestionsPage.jsp">
        <input type="submit" value="Questions">
    </form>
    <form action="AuctionList.jsp">
        <input type="submit" value="Auctions">
    </form>
    <form action="AccountList.jsp">
        <input type="submit" value="Users">
    </form>
    <br><br><br>
    <form action="Home.jsp">
        <input type="submit" value="Logout">
    </form>
</div>
</body>
</html>
