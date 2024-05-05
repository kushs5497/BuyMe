<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Register</title>
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
        h1, h3 {
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
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        td {
            padding: 8px;
            font-size: 18px;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            height: 35px;
            width: 100%;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
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
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
    <h3>Register</h3>
    <form method="get" action="RegisterJava.jsp">
        <table>
            <tr>
                <td>New Username:</td>
                <td><input type="text" name="new_username"></td>
            </tr>
            <tr>
                <td>New Password:</td>
                <td><input type="password" name="new_password"></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input type="password" name="confirm_new_password"></td>
            </tr>
        </table>
        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
