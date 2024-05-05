<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Filter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
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
            text-align: center;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        select, input[type="text"], input[type="submit"] {
            font-size: 15px;
            height: 30px;
            width: 275px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="h1"><h1><a href="LoginSuccess.jsp">BuyMe</a></h1></div>
        <form action="FilterAuctionList.jsp">
            <select name="category">
                <option value="" disabled="disabled" selected="selected">Select a category</option>
                <option value="allItems" name="allItems">All Items</option>
                <option value="headphone" name="headphone">Headphone</option>
                <option value="smartwatch" name="smartwatch">Smart Watch</option>
                <option value="charger" name="chager">Charger</option>
            </select>
            <br><br>
            <input type="text" id="filter_min_price" name="filter_min_price" placeholder="Minimum Price (without $ sign) - optional">
            <br>
            <input type="text" id="filter_max_price" name="filter_max_price" placeholder="Maximum Price (without $ sign) - optional">
            <br><br>
            <input type="submit" value="Filter">
        </form>
    </div>
</body>
</html>
