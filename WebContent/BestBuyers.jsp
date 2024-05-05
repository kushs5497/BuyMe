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
    <title>BuyMe: Best Buyers (Top 10)</title>
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

        h2 {
            font-size: 25px;
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

                String query = "SELECT buyer, SUM(price) AS total_money_spent FROM sold_items GROUP BY buyer ORDER BY total_money_spent DESC LIMIT 10";
                ResultSet result = stmt.executeQuery(query);

                out.println("<h1>Best Buyers (Top 10)</h1>");
                out.println("<br>");

                if (!result.next()) {
                    out.println("<h2>No users bought anything!</h2>");
                } else {
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<td><strong>Buyer</strong></td><td><strong>Total Money Spent</strong></td>");
                    out.println("</tr>");

                    int i = 1;
                    result.beforeFirst();

                    while (result.next()) {
                        String buyer = result.getString("buyer");
                        String totalMoneySpent = result.getString("total_money_spent");

                        String rowStyle = (i % 2 != 0) ? "background-color: #f2f2f2;" : "";

                        out.println("<tr style='" + rowStyle + "'>");
                        out.println("<td>" + buyer + "</td><td>" + totalMoneySpent + "</td>");
                        out.println("</tr>");

                        i++;
                    }

                    out.println("</table>");
                }

                con.close();
            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </div>
</body>
</html>
