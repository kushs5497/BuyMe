<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!-- Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Bid Status</title>
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
        input[type="button"] {
            height: 30px;
            width: 150px;
            font-size: 15px;
            border: none;
            background-color: #f44336;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="button"]:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <h1><a href="LoginSuccess.jsp">BuyMe</a></h1>
    <%
    try {
        String autoBid = request.getParameter("auto_bid");
        String autoBidInc = request.getParameter("auto_bid_inc");
        String currBid = request.getSession().getAttribute("currBid").toString();
        String bidInc = request.getSession().getAttribute("bidInc").toString();
        String itemNum = (String)request.getSession().getAttribute("itemNum");
        String itemName = request.getSession().getAttribute("selectedItemName" + itemNum).toString();
        String itemID = request.getSession().getAttribute("selectedItemID" + itemNum).toString();
        String bidder = request.getSession().getAttribute("username").toString();

        if (Float.parseFloat(autoBidInc) < Float.parseFloat(bidInc)) {
            out.println("Cannot make your bid increment lower than the set bid increment amount.");
            %>
            <a href='AutomaticBidPage.jsp'>
                <br><br><input type='button' value='Back'/>
            </a>
            <%
        } else {
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            String bidHistoryUpdate = "INSERT INTO auto_bid (item_id, bidder, maximum_bid, bid_increment) VALUES (?, ?, ?, ?)";
            PreparedStatement updatePs = con.prepareStatement(bidHistoryUpdate);
            updatePs.setString(1, itemID); 
            updatePs.setString(2, bidder); 
            updatePs.setString(3, autoBid);
            updatePs.setString(4, autoBidInc);
            updatePs.executeUpdate();
            out.println("Your automatic bid has been saved. Return to item listing");
            %>
            <a href='BuyPage.jsp?num=<%= request.getSession().getAttribute("itemNum").toString() %>'>
                <br><br><input type='button' value='Back to Item'/>
            </a>
            <%
            con.close(); 
        }
    } catch (Exception ex) {
        out.print(ex);
        out.print("Exception thrown");
    }
    %>
</body>
</html>
