<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe: Register</title>
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
            width: calc(100% - 10px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            height: 40px;
            width: 200px;
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
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
    <%
    try {
        ApplicationDB db = new ApplicationDB();    
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();
        String user = request.getParameter("cus_rep_username");
        String pass = request.getParameter("cus_rep_password");
        String confirmPass = request.getParameter("confirm_cus_rep_password");
        if (!pass.equals(confirmPass)) {
            out.println("Passwords don't match");
        } else {
            String query = "SELECT * FROM cust_reps WHERE rep_name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user);
            ResultSet result = ps.executeQuery();
            boolean inDb = result.next();
            if (inDb) {
                out.print("Username is already taken. Please try a different username.");
            } else {
                if (user.trim().equals("") || pass.trim().equals("")) {
                    out.print("Cannot have a blank username or password");
                } else {
                    String insert = "INSERT INTO cust_reps(rep_name, rep_password) VALUES (?, ?)";
                    ps = con.prepareStatement(insert);
                    ps.setString(1, user);
                    ps.setString(2, pass);
                    ps.executeUpdate();
                    out.print("You successfully created a customer representative account!");
                }
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
        out.print("insert failed");
    }
    %>
    <br><br>
    <form action="AdminDashboard.jsp">
        <input type="submit" value="Go back to main page">
    </form>
</div>
</body>
</html>
