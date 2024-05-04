<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Search Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
        }
        h3 {
            font-size: 25px;
        }
        a:link, a:visited {
            color: black;
            text-decoration: none;
        }
        a:hover {
            color: black;
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
        input[type="text"], select {
            height: 30px;
            width: 200px;
            font-size: 16px;
        }
        input[type="submit"] {
            height: 35px;
            width: 100px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
</div>
<div style="text-align: center;">
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
