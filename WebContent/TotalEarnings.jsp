<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Total Earnings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-top: 0;
            font-size: 30px;
        }

        h3 {
            font-size: 24px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            font-size: 18px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class='h1'><h1><a href='AdminDashboard.jsp'>BuyMe</a></h1></div>
        <%
            try {
                // Get the database connection
                ApplicationDB db = new ApplicationDB();	
                Connection con = db.getConnection();

                // Create a SQL statement
                Statement stmt = con.createStatement();

                out.println("<h1>Total Earnings</h1>");

                String query = "SELECT SUM(price) FROM sold_items";
                ResultSet result = stmt.executeQuery(query);
                if (result.next() && result.getString(1) == null) {
                    out.println("<h3>$0</h3>");
                } else {
                    out.println("<h3>$" + result.getString(1) + "</h3>");
                    // ITEM DETAILS
                    // Don't forget to do it, otherwise you're keeping the resources of the server allocated.
                }

                con.close();
            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </div>
</body>
</html>
