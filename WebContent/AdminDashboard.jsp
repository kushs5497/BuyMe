<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Login Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
            text-align: center;
        }
        a:link,
        a:visited {
            color: black;
            text-decoration: none;
        }
        a:hover {
            color: black;
            text-decoration: underline;
        }
        .h1 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"] {
            font-size: 15px;
            height: 50px;
            width: 300px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="h1">
        <h1><a href="AdminDashboard.jsp"> BuyMe </a></h1>
    </div>
    <br>
    <% out.print("Welcome to BuyMe, admin!"); %>
    <br><br><br>
    <form action="CreateCusRepAcc.jsp">
        <input type="submit" value="Create Customer Representative Account">
    </form> 
    <br><br>
    <form action="SalesReportMain.jsp">
        <input type="submit" value="Sales Report">
    </form> 
    <br><br><br><br>
    <form action="Home.jsp">
        <input type="submit" value="Logout">
    </form>
</body>
</html>
