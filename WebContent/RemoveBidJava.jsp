<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!-- Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Remove Bid</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
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
            text-align: center;
            font-size: 24px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 10px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: black;
            text-decoration: none;
            font-size: 18px;
        }
        .button-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .button-container form {
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .button-container form input[type="submit"] {
            font-size: 15px;
            height: 30px;
            width: 200px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-container form input[type="submit"]:hover {
            background-color: #45a049;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="h1">
        <h1><strong><a href="CustomerRepHomePage.jsp">BuyMe</a></strong></h1>
    </div>
    <center>
        <%
        try {
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            
            Statement stmt = con.createStatement();
            
            String itemid = (String) request.getSession().getAttribute("itemid");
            String bidder = (String) request.getSession().getAttribute("bidder");
            String bid = (String) request.getSession().getAttribute("bid");
            
            String delete1 = "delete from bid_history where item_id = ? and bidder = ? and current_bid = ?";
            PreparedStatement ps1 = con.prepareStatement(delete1);
            ps1.setString(1, itemid);
            ps1.setString(2, bidder);
            ps1.setString(3, bid);
            ps1.executeUpdate();
            
            out.println("<strong>Removed Bid</strong>");
            
            con.close();
        } catch (Exception ex) {
            out.print(ex);
            out.print("Deletion failed");
        }
        %>
        <br><br>
        <form action="AuctionList.jsp">
            <input type="submit" value="View Items">
        </form>
    </center>
</body>
</html>
