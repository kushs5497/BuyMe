<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Filter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
        }
        a:link, a:visited {
            color: black;
            text-decoration: none;
        }
        a:hover {
            color: black;
            text-decoration: underline;
        }
        table {
            border-collapse: collapse;
            width: 60%;
        }
        td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 11px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        .h1 {
            text-align: center;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        select, input[type="submit"] {
            font-size: 15px;
            height: 30px;
            width: 275px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="h1"><h1><a href="LoginSuccess.jsp">BuyMe</a></h1></div>
<form action="FilterAuctionList.jsp">
    <select name="category">
        <option value="" disabled="disabled" selected="selected">Select a category</option>
        <option value="allItems" name="allItems">All Items</option>
        <option value="phone" name="phone">Phone</option>
        <option value="tablet" name="tablet">Tablet</option>
        <option value="laptop" name="laptop">Laptop</option>
    </select>
    <br><br>
    <input type="text" id="filter_min_price" name="filter_min_price" placeholder="Minimum Price (without $ sign) - optional">
    <br>
    <input type="text" id="filter_max_price" name="filter_max_price" placeholder="Maximum Price (without $ sign) - optional">
    <br><br>
    <input type="submit" value="Filter">
</form>
</body>
</html>
