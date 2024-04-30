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
            height: 30px;
            width: 200px;
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
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="h1">
            <h1><a href="LoginSuccess.jsp"> BuyMe </a></h1>
        </div>
        <%
            try {
                // Get the database connection
                ApplicationDB db = new ApplicationDB();    
                Connection con = db.getConnection();

                // Create a SQL statement
                Statement stmt = con.createStatement();

                // Get parameters from the HTML form at the index.jsp
                String username = (String)request.getSession().getAttribute("username");
                out.print("<p>Welcome to BuyMe, " + username + "!</p>");

                // Close the connection
                con.close();
            } catch (Exception ex) {
                out.print(ex);
                out.print("insert failed");
            }
        %>
        <br><br><br>
        <form action="AuctionList.jsp">
            <input type="submit" value="Buy">
        </form> 
        <br>
        <p>or</p>
        <br><br>
        <form action="SellerForm.jsp">
            <input type="submit" value="Sell">
        </form>
        <br><br><br><br>
        <form action="AlertsList.jsp">
            <input type="submit" value="Alerts">
        </form>
        <br><br>
        <form action="QuestionsPage.jsp">
            <input type="submit" value="Questions">
        </form>
        <br><br><br><br><br><br>
        <form action="Home.jsp">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
