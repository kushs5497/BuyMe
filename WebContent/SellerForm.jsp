<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Sell</title>
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
        input[type="text"],
        textarea,
        select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="datetime-local"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
        <h2>Sell an Item</h2>
        <form action="SellerFormSuccess.jsp">
            <select name="category">
                <option value="" disabled selected>Select a category</option>
                <option value="phone">Phone</option>
                <option value="tablet">Tablet</option>
                <option value="laptop">Laptop</option>
            </select>
            <br>
            <input type="text" name="item_name" placeholder="Item Name">
            <br>
            <textarea name="item_desc" style="height: 100px;" placeholder="Item Description (max. 300 characters)"></textarea>
            <br>
            <input type="text" name="init_bid" placeholder="Starting Bid Price (without $ sign)">
            <br>
            <input type="text" name="bid_inc" placeholder="Bid Increment Amount (without $ sign)">
            <br>
            <input type="text" name="res_price" placeholder="Reserve Price (without $ sign)">
            <br>
            <label for="dur_auction">Auction End Date & Time:</label>
            <input type="datetime-local" name="dur_auction">
            <br>
            <input type="submit" value="Place Item on Auction">
        </form>
    </div>
</body>
</html>
