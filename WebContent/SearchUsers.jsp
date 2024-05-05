<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Search Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
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
        h3 {
            font-size: 25px;
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
            margin-top: 20px;
            text-align: center;
        }
        table {
            margin: 0 auto;
        }
        td {
            padding: 5px;
        }
        input[type="text"], select, input[type="submit"] {
            height: 30px;
            width: 200px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            height: 35px;
            width: 100px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
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
    <h3><strong>Search User Activity</strong></h3>
    <form method="get" action="SearchUsersSuccess.jsp">
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="searched_user"></td>
            </tr>
        </table>
        <br>
        <select name="type_of_user">
            <option value="" disabled="disabled" selected="selected">See what items they</option>
            <option value="bid" name="bid">bid</option>
            <option value="sold" name="sold">sold</option>
        </select>
        <br><br>
        <input type="submit" value="Search">
    </form>
</div>
</body>
</html>
