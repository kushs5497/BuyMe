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
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            height: 35px;
            width: 100%;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><strong><a href="Home.jsp">BuyMe</a></strong></h1>
    <h2>Register</h2>
    <%
        try {
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            Statement stmt = con.createStatement();

            String user = request.getParameter("new_username");
            String pass = request.getParameter("new_password");
            String confirmPass = request.getParameter("confirm_new_password");
            if (!pass.equals(confirmPass)) {
                out.println("<p class='message'>Passwords don't match</p>");
            } else {
                String query = "select * from user where username = '" + user + "'";
                ResultSet result = stmt.executeQuery(query);
                boolean inDb = result.first();
                if (inDb) {
                    out.println("<p class='message'>Username is already taken. Please try a different username.</p>");
                } else if (user.trim().equals("") || pass.trim().equals("")) {
                    out.println("<p class='message'>Cannot have a blank username or password</p>");
                } else {
                    String insert = "INSERT INTO user(username, password) VALUES (?, ?)";
                    PreparedStatement ps = con.prepareStatement(insert);
                    ps.setString(1, user);
                    ps.setString(2, pass);
                    ps.executeUpdate();
                    out.println("<p>Sign up succeeded!</p>");
                }
            }
            con.close();
        } catch (Exception ex) {
            out.println("<p class='message'>" + ex + "<br>Insert failed</p>");
        }
    %>
    <form action="Home.jsp">
        <input type="submit" value="Go back to main page">
    </form>
</div>
</body>
</html>
