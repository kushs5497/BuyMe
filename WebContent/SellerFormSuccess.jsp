<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Successfully Placed on Auction</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-top: 0;
            text-align: center;
        }
        form {
            text-align: center;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 50%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><a href="LoginSuccess.jsp">BuyMe</a></h1>
        <%
            try {
                ApplicationDB db = new ApplicationDB();
                Connection con = db.getConnection();
                Statement stmt = con.createStatement();
                String username = (String)request.getSession().getAttribute("username");
                String category = (String)request.getParameter("category");
                String itemName = request.getParameter("item_name");
                String itemDesc = request.getParameter("item_desc");
                String initBid = request.getParameter("init_bid");
                String bidInc = request.getParameter("bid_inc");
                String durAuction = request.getParameter("dur_auction");
                String reservePrice = request.getParameter("res_price");
                String insert = "INSERT INTO items(name, type, description, username, starting_bid, bid_increment, current_price, sell_by_date, reserve_price)"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
                PreparedStatement ps = con.prepareStatement(insert);
                ps.setString(1, itemName);
                ps.setString(2, category);
                ps.setString(3, itemDesc);
                ps.setString(4, username);
                ps.setString(5, initBid);
                ps.setString(6, bidInc);
                ps.setString(7, initBid);
                ps.setString(8, durAuction);
                ps.setString(9, reservePrice);
                ps.executeUpdate();
                out.print("Item set for auction!");
                String findItemIdQuery = "SELECT item_id FROM items WHERE name = '"+itemName+"' AND sell_by_date ='" + durAuction+"'"; 
                ResultSet findItemIdSet = stmt.executeQuery(findItemIdQuery); 
                findItemIdSet.next(); 
                String recentlyPostedItemId = (findItemIdSet.getString(1));
                String listOfUsersInterested = "SELECT username FROM user_interests WHERE type = '"+category+"'"; 
                ResultSet usersInterestedSet = stmt.executeQuery(listOfUsersInterested);
                while(usersInterestedSet.next()){
                    String currentUsername = usersInterestedSet.getString(1); 
                    String alertMessage = "A " + category+" you're interested in named " + itemName+" was just posted!"; 
                    String alertTableInsertion = "INSERT INTO alerts(item_id, message, username) VALUES (?, ?, ?)"; 
                    PreparedStatement alertPreparedStatement = con.prepareStatement(alertTableInsertion); 
                    alertPreparedStatement.setString(1, recentlyPostedItemId); 
                    alertPreparedStatement.setString(2, alertMessage); 
                    alertPreparedStatement.setString(3, currentUsername); 
                    out.println(alertPreparedStatement.toString()); 
                    alertPreparedStatement.execute(); 
                }
                con.close();
            } catch (Exception ex) {
                out.print(ex);
                out.print("insert failed");
            }
        %>
        <form action="AuctionList.jsp">
            <input type="submit" value="Go to Auction List">
        </form>
    </div>
</body>
</html>
