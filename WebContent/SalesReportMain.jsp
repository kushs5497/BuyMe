<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Sales Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-top: 0;
            font-size: 30px;
        }

        h3 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 15px;
        }

        input[type="submit"] {
            font-size: 16px;
            height: 40px;
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><a href="AdminDashboard.jsp">BuyMe</a></h1>
        <h3>Generate Sales Reports for:</h3>
        <form action="TotalEarnings.jsp">
            <input type="submit" value="Total Earnings">
        </form>
        <form action="EarningsPerItem.jsp">
            <input type="submit" value="Earnings per Item">
        </form>
        <form action="EarningsPerItemType.jsp">
            <input type="submit" value="Earnings per Item Type">
        </form>
        <form action="EarningsPerEndUser.jsp">
            <input type="submit" value="Earnings per End-User">
        </form>
        <form action="BestSellingItems.jsp">
            <input type="submit" value="Best-Selling Items">
        </form>
        <form action="BestBuyers.jsp">
            <input type="submit" value="Best Buyers">
        </form>
    </div>
</body>
</html>
