<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!-- Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Remove Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        h1 {
            margin-top: 0;
            font-size: 24px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        input[type="submit"] {
            height: 30px;
            width: 150px;
            font-size: 15px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1><a href="CustomerRepHomePage.jsp">BuyMe</a></h1>
    <%
    try {
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        
        Statement stmt = con.createStatement();
        
        String itemid = (String) request.getSession().getAttribute("itemid");
        String itemName = (String) request.getSession().getAttribute("itemName");
        
        String deleteAlerts = "delete from alerts where item_id = ?";
        PreparedStatement ps1 = con.prepareStatement(deleteAlerts);
        ps1.setString(1, itemid);
        ps1.executeUpdate();
        
        String deleteBidHistory = "delete from bid_history where item_id = ?";
        PreparedStatement ps3 = con.prepareStatement(deleteBidHistory);
        ps3.setString(1, itemid);
        ps3.executeUpdate();
        
        String deleteAutoBid = "delete from auto_bid where item_id = ?";
        PreparedStatement ps4 = con.prepareStatement(deleteAutoBid);
        ps4.setString(1, itemid);
        ps4.executeUpdate();
        
        String deleteItem = "delete from items where item_id = ?";
        PreparedStatement ps2 = con.prepareStatement(deleteItem);
        ps2.setString(1, itemid);
        ps2.executeUpdate();
        
        out.println("Removed " + itemName);
        con.close();
    } catch (Exception ex) {
        out.print(ex);
        out.print("Insert failed");
    }
    %>
    <br><br>
    <form action="AuctionList.jsp">
        <input type="submit" value="View Items">
    </form>
</body>
</html>
