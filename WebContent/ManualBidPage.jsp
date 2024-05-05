<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Bid</title>
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
        input[type="man_bid"] {
            height: 20px;
            width: 230px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            height: 30px;
            width: 150px;
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
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="LoginSuccess.jsp">BuyMe</a></strong></h1>
    <p style="font-size:20px">
        <strong>Manual Bid on <%= request.getSession().getAttribute("selectedItemName") %>
            with current bid being $<%= request.getSession().getAttribute("currBid") %>
        </strong>
    </p>

    <form action="ManualBidPageJava.jsp">
        <input type="man_bid" id="man_bid" name="man_bid" placeholder="Place a Bid (without $ sign)">
        <br><br>
        <input type="submit" value="Place Manual Bid">
    </form>
</div>
</body>
</html>
