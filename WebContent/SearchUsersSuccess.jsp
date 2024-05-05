<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: User's Auction List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
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
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        input[type="submit"], select, input[type="submit"] {
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
            width: 200px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="LoginSuccess.jsp">BuyMe</a></strong></h1>
    <%
    try {
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();

        String boughtOrSold = request.getParameter("type_of_user");
        String user = request.getParameter("searched_user");

        out.println("<h2>" + user + "'s Items</h2>");
        out.println("<form method='get' action='AuctionList.jsp'>");
        out.println("<input type='submit' value='Reset'>");
        out.println("</form>");

        String verify = "select * from user where username = '" + user + "'";
        ResultSet verifyResult = stmt.executeQuery(verify);
        boolean inDb = verifyResult.first();

        if (inDb) {
            long millis = java.time.Instant.now().toEpochMilli();
            java.sql.Timestamp time = new java.sql.Timestamp(millis);
            String currentTimeStamp = time.toString();
            String update = "UPDATE items SET bought = true WHERE ? >= sell_by_date";
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(1, currentTimeStamp);
            ps.executeUpdate();

            String query = "";
            if (boughtOrSold.equals("bid")) {
                query = "select items.name, bid_history.item_id, bid_history.bidder from bid_history, items where items.item_id = bid_history.item_id and bid_history.bidder = '" + user + "' group by bid_history.item_id";
            } else {
                query = "select name, item_id from items where username = '" + user + "'";
            }

            ResultSet result = stmt.executeQuery(query);

            if (!result.next()) {
                out.println("<p>No Items!</p>");
            } else {
                out.println("<table>");
                out.println("<tr><th>Items</th></tr>");
                int i = 1;
                result.beforeFirst();
                while (result.next()) {
                    out.println("<tr><td><a href='BuyPage.jsp?num=" + i + "'>" + result.getString(1) + "</a></td></tr>");
                    request.getSession().setAttribute("selectedItemID" + i, result.getString(2));
                    request.getSession().setAttribute("selectedItemName" + i, result.getString(1));
                    i++;
                }
                out.println("</table>");
            }
        } else {
            out.println("<p>The user you tried to search for does not exist.</p>");
        }

        con.close();

    } catch (Exception ex) {
        out.print(ex);
        out.print("fail");
    }
    %>
    <form action="LoginSuccess.jsp">
        <input type="hidden" value="Go back to main page">
        <input type="submit" value="Go back to main page">
    </form>
</div>
</body>
</html>
