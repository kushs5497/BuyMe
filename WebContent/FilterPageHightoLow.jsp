<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Sorted Auction List ($$$ -> $)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
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
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 11px;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="text"], input[type="submit"] {
            font-size: 15px;
            height: 30px;
            width: 275px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="h1"><h1><a href="LoginSuccess.jsp">BuyMe</a></h1></div>
        <h1>Sorted Auction List ($$$ -> $)</h1>
        <form action="AuctionList.jsp">
            <input type="submit" value="Reset">
        </form>
        <table>
            <tr>
                <th>Items</th>
            </tr>
            <%
            try {
                ApplicationDB db = new ApplicationDB();   
                Connection con = db.getConnection();
                Statement stmt = con.createStatement();
                long millis=java.time.Instant.now().toEpochMilli();
                java.sql.Timestamp time = new java.sql.Timestamp(millis); 
                String currentTimeStamp = time.toString();
                String update = "UPDATE items SET bought = true WHERE ? >= sell_by_date";
                PreparedStatement ps = con.prepareStatement(update);
                ps.setString(1, currentTimeStamp);
                ps.executeUpdate();
                String query = "select name, item_id from items where bought is not true order by current_price desc";
                ResultSet result = stmt.executeQuery(query);
                int i = 1;
                while(result.next()) {
                    out.println("<tr>");
                    out.println("<td><a href='BuyPage.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
                    request.getSession().setAttribute("selectedItemID"+i, result.getString(2));
                    request.getSession().setAttribute("selectedItemName"+i, result.getString(1));
                    out.println("</tr>");
                    i++;
                }
                con.close();
            } catch (Exception ex) {
                out.print(ex);
                out.print("fail");
            }
            %>
        </table>
        <form action="LoginSuccess.jsp">
            <input type="submit" value="Go back to main page">
        </form>
    </div>
</body>
</html>
