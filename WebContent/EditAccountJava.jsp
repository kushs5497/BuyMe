<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Edit Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            text-align: center;
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
            font-size: 24px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1), 0 3px 10px 0 rgba(0,0,0,0.1);
        }
        input[type="text"],
        input[type="password"] {
            width: 250px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
<div class="container">
    <h1><strong><a href="CustomerRepHomeJava.jsp">BuyMe</a></strong></h1>
    <h2>Edit Account</h2>
    <%
    try {
        //Get the database connection
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        //Create a SQL statement
        Statement stmt = con.createStatement();

        //Get parameters from the HTML form
        String oldUser = (String) request.getSession().getAttribute("user");
        String oldPass = (String) request.getSession().getAttribute("pass");

        String newUser = request.getParameter("edit_username");
        String newPass = request.getParameter("edit_password");
        String newConfirmPass = request.getParameter("edit_confirm_password");

        if (oldUser.equals(newUser)) {
            String insert = "update user set password = ? where username = ?";
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, newPass);
            ps.setString(2, newUser);
            ps.executeUpdate();
            out.print("Account Edited!");
        } else {
            if (!newPass.equals(newConfirmPass)) {
                out.println("Passwords don't match");
            } else {
                String query = "select * from user where username = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, newUser);
                ResultSet result = ps.executeQuery();
                boolean inDb = result.next();
                if (inDb) {
                    out.print("Username is already taken. Please try a different username.");
                } else {
                    if (newUser.trim().equals("") || newPass.trim().equals("")) {
                        out.print("Cannot have a blank username or password");
                    } else {
                        String insert = "update user set username = ?, password = ? where username = ?";
                        ps = con.prepareStatement(insert);
                        ps.setString(1, newUser);
                        ps.setString(2, newPass);
                        ps.setString(3, oldUser);
                        ps.executeUpdate();
                        out.print("Account Edited!");
                    }
                }
            }
        }

        //Close the connection
        con.close();
    } catch (Exception ex) {
        out.print(ex);
        out.print("insert failed");
    }
    %>
    <br><br>
    <form action="AccountList.jsp">
        <input type="submit" value="View Accounts">
    </form>
</div>
</body>
</html>
