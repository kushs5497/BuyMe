<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Login Success</title>
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
            height: 50px;
            width: 300px;
            margin: 5px;
            font-size: 15px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .logout {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="AdminDashboard.jsp">BuyMe</a></strong></h1>
    <p>Welcome to BuyMe, admin!</p>
    <form action="CreateCusRepAcc.jsp">
        <input type="submit" value="Create Customer Representative Account">
    </form> 
    <form action="SalesReportMain.jsp">
        <input type="submit" value="Sales Report">
    </form> 
    <form action="Home.jsp" class="logout">
        <input type="submit" value="Logout">
    </form>
</div>
</body>
</html>
