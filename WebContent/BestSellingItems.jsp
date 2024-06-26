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
    <title>BuyMe: Best Selling Items (Top 10)</title>
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

                String query = "SELECT items.name, sold_items.price FROM items, sold_items WHERE items.item_id = sold_items.item_id ORDER BY price DESC LIMIT 10";
                ResultSet result = stmt.executeQuery(query);

                out.println("<h1>Best Selling Items (Top 10)</h1>");
                out.println("<br>");

                if (!result.next()) {
                    out.println("<h2>No items have been sold!</h2>");
                } else {
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<td><strong>Item</strong></td><td><strong>Price</strong></td>");
                    out.println("</tr>");

                    int i = 1;
                    result.beforeFirst();

                    while (result.next()) {
                        String itemName = result.getString(1);
                        String price = result.getString(2);

                        String rowStyle = (i % 2 != 0) ? "background-color: #f2f2f2;" : "";

                        out.println("<tr style='" + rowStyle + "'>");
                        out.println("<td>" + itemName + "</td><td>" + price + "</td>");
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
