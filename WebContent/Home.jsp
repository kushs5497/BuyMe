<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
            <h1>BuyMe</h1>
            		<form action="Login.jsp">
                		<input type="submit" value="Login">
            		</form>
            		<br>
            		<form action="Register.jsp">
                		<input type="submit" value="Register">
            		</form>
    </div>
</body>
</html>
