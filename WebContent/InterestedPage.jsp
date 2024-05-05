<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Interested</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
        }
        h3 {
            font-size: 18px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            margin: 20px auto;
        }
        td {
            padding: 5px;
        }
        input[type="checkbox"] {
            transform: scale(1.5);
        }
        input[type="submit"] {
            height: 35px;
            width: 120px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Set an Alert</h1>
    <h3>What items are you interested in?</h3>
    <form action="InterestedPageJava.jsp">
        <table>
            <tr>
                <td><input type="checkbox" id="headphone" name="typeOfDevice" value="headphone"></td>
                <td><label for="headphone">Headphones</label></td>
            </tr>
            <tr>
                <td><input type="checkbox" id="charger" name="typeOfDevice" value="charger"></td>
                <td><label for="charger">Chargers</label></td>
            </tr>
            <tr>
                <td><input type="checkbox" id="smartwatch" name="typeOfDevice" value="smartwatch"></td>
                <td><label for="smartwatch">Smart Watches</label></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Set Alert">
    </form>
</div>
</body>
</html>
