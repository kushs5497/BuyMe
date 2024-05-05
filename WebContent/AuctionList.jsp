<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Auction List</title>
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
            font-size: 30px;
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
    <div class="container">
        <%
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String username = (String)request.getSession().getAttribute("username");
            String checkIfUserIsCustomerRepQuery = "select * from customer_reps where customer_rep_name = '" + username + "'";
            ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);
            if (checkIfUserIsCustomerRepResults.next()) {
                out.println("<h1><a href='CustomerRepHomePage.jsp'>BuyMe</a></h1>");
            } else {
                out.println("<h1><a href='LoginSuccess.jsp'>BuyMe</a></h1>");
            }
        %>
        <h1>Auction List</h1>
        <div class="button-container">
            <form action="FilterPage.jsp">
                <input type="submit" value="Filter">
            </form>
            <form action="FilterPageHightoLow.jsp">
                <input type="submit" value="Sort Price: High to Low">
            </form>
            <form action="FilterPageLowtoHigh.jsp">
                <input type="submit" value="Sort Price: Low to High">
            </form>
            <form action="SearchUsers.jsp">
                <input type="submit" value="Search Users">
            </form>
        </div>
        <%
            long millis = java.time.Instant.now().toEpochMilli();
            java.sql.Timestamp time = new java.sql.Timestamp(millis);
            String currentTimeStamp = time.toString();
            String update = "UPDATE items SET bought = true WHERE ? >= sell_by_date";
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(1, currentTimeStamp);
            ps.executeUpdate();

            String soldItemQuery = "SELECT item_id, name FROM items WHERE bought = TRUE AND username = '" + username + "'";
            ResultSet soldItemResults = stmt.executeQuery(soldItemQuery);
            while (soldItemResults.next()) {
                String getReservePrice = "SELECT reserve_price FROM items WHERE item_id = " + soldItemResults.getString(1);
                Statement stmt3 = con.createStatement();
                ResultSet getReservePriceResult = stmt3.executeQuery(getReservePrice);
                if (getReservePriceResult.next() && getReservePriceResult.getString(1) != null) {
                    float price = Float.parseFloat(getReservePriceResult.getString(1));
                    String lastBidPriceQuery = "SELECT current_bid FROM bid_history WHERE item_id = " + soldItemResults.getString(1) + " order by current_bid desc limit 1";
                    ResultSet lastBidPriceResult = stmt3.executeQuery(lastBidPriceQuery);
                    if (lastBidPriceResult.next()) {
                        float lastBid = Float.parseFloat(lastBidPriceResult.getString(1));
                        if (lastBid < price) {
                            continue;
                        }
                    }
                }
                String itemSoldToSomeoneQuery = "SELECT bidder FROM bid_history WHERE item_id = " + soldItemResults.getString(1) + " order by current_bid desc limit 1";
                ResultSet itemSoldResult = stmt3.executeQuery(itemSoldToSomeoneQuery);
                if (itemSoldResult.next() && itemSoldResult.getString(1) != null) {
                    String alertString = "Your item named " + soldItemResults.getString(2) + " was sold.";
                    String alertInsertForSoldItem = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
                    PreparedStatement soldItemAlert = con.prepareStatement(alertInsertForSoldItem);
                    soldItemAlert.setString(1, soldItemResults.getString(1));
                    soldItemAlert.setString(2, alertString);
                    soldItemAlert.setString(3, username);
                    soldItemAlert.executeUpdate();
                }
            }

            String allBoughtItems = "SELECT item_id, name, type FROM items WHERE bought = TRUE";
            ResultSet allBoughtItemsResult = stmt.executeQuery(allBoughtItems);
            Statement stmt2 = con.createStatement();
            String soldPrice = "5.00";
            while (allBoughtItemsResult.next()) {
                String boughtString = "You successfully bought " + allBoughtItemsResult.getString(2) + ".";
                String findTheBuyer = "select bidder, current_bid from bid_history where item_id = " + allBoughtItemsResult.getString(1) + " order by current_bid desc limit 1";
                ResultSet buyerOfItem = stmt2.executeQuery(findTheBuyer);

                Statement stmt4 = con.createStatement();
                String getReservePrice2 = "SELECT reserve_price FROM items WHERE item_id = " + allBoughtItemsResult.getString(1);
                ResultSet getReservePriceResult2 = stmt4.executeQuery(getReservePrice2);
                if (getReservePriceResult2.next() && getReservePriceResult2.getString(1) != null) {
                    float price = Float.parseFloat(getReservePriceResult2.getString(1));
                    String lastBidPriceQuery = "SELECT current_bid FROM bid_history WHERE item_id = " + allBoughtItemsResult.getString(1) + " order by current_bid desc limit 1";
                    ResultSet lastBidPriceResult = stmt4.executeQuery(lastBidPriceQuery);
                    if (lastBidPriceResult.next()) {
                        float lastBid = Float.parseFloat(lastBidPriceResult.getString(1));
                        //out.println(lastBid);
                        if (lastBid < price) {
                            continue;
                        } else {
                        }
                    }
                }

                if (buyerOfItem.next()) {
                    String boughtItemAlert = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
                    PreparedStatement boughtItemAlertStatement = con.prepareStatement(boughtItemAlert);

                    boughtItemAlertStatement.setString(1, allBoughtItemsResult.getString(1));
                    boughtItemAlertStatement.setString(2, boughtString);
                    boughtItemAlertStatement.setString(3, buyerOfItem.getString(1));

                    boughtItemAlertStatement.executeUpdate();

                    String insertIntoBoughtItems = "INSERT IGNORE INTO bought_items(item_id, category, price, buyer) VALUES (?, ?, ?, ?)";
                    PreparedStatement boughtItemsStatement = con.prepareStatement(insertIntoBoughtItems);
                    boughtItemsStatement.setString(1, allBoughtItemsResult.getString(1));
                    boughtItemsStatement.setString(2, allBoughtItemsResult.getString(3));
                    boughtItemsStatement.setString(3, buyerOfItem.getString(2));
                    boughtItemsStatement.setString(4, buyerOfItem.getString(1));
                    boughtItemsStatement.executeUpdate();

                }

            }

            String allUnboughtItems = "SELECT item_id, name FROM items WHERE bought is not TRUE";
            ResultSet allUnboughtItemsResult = stmt.executeQuery(allUnboughtItems);
            while (allUnboughtItemsResult.next()) {
                String getUsersLastBid = "SELECT current_bid FROM bid_history WHERE bidder = '" + username + "' AND item_id = " + allUnboughtItemsResult.getString(1) + " order by current_bid desc limit 1";
                ResultSet getMyLastBid = stmt2.executeQuery(getUsersLastBid);
                if (getMyLastBid.next()) {
                    float myLastBidFloat = Float.parseFloat(getMyLastBid.getString(1));
                    String getHigherBid = "SELECT current_bid FROM bid_history WHERE bidder != '" + username + "' AND current_bid > " + myLastBidFloat + " AND item_id = " + allUnboughtItemsResult.getString(1) + " order by current_bid desc limit 1";
                    ResultSet checkForHigherBids = stmt2.executeQuery(getHigherBid);
                    if (checkForHigherBids.next()) {
                        String higherBidAlertMessage = "A user bid higher than you on " + allUnboughtItemsResult.getString(2);
                        String higherBidAlert = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
                        PreparedStatement higherBidAlertStatement = con.prepareStatement(higherBidAlert);

                        higherBidAlertStatement.setString(1, allUnboughtItemsResult.getString(1));
                        higherBidAlertStatement.setString(2, higherBidAlertMessage);
                        higherBidAlertStatement.setString(3, username);

                        higherBidAlertStatement.executeUpdate();

                    }

                }
            }

            String query = "SELECT name, item_id FROM items WHERE bought IS NOT TRUE";
            ResultSet result = stmt.executeQuery(query);
            out.println("<form action='BuyPage.jsp'>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th><u>Items</u></th>");
            out.println("</tr>");
            int i = 1;
            while (result.next()) {
                out.println("<tr>");
                out.println("<td><a href='BuyPage.jsp?num=" + i + "'>" + result.getString(1) + "</a></td>");
                request.getSession().setAttribute("selectedItemID" + i, result.getString(2));
                request.getSession().setAttribute("selectedItemName" + i, result.getString(1));
                out.println("</tr>");
                i++;
            }
            out.println("</table>");
            out.println("</form>");
            con.close();
        %>
    </div>
</body>
</html>
