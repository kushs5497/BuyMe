<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Interest Alert Confirm</title>
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
            font-size: 28px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            height: 35px;
            width: 180px;
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
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
    <p>You have successfully set an alert! We'll let you know when an item of your interest is put up for auction!</p>
    <form action="AlertsList.jsp">
        <input type="submit" value="Go back to Alerts">
    </form>
</div>
</body>
</html>
