<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BuyMe: Auction List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
            text-align: center;
        }
        a:link,
        a:visited {
            color: black;
            text-decoration: none;
        }
        a:hover {
            color: black;
            text-decoration: underline;
        }
        table {
            border-collapse: collapse;
            width: 60%;
            margin: 0 auto;
        }
        td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 11px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"] {
            font-size: 15px;
            height: 30px;
            width: 200px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class='h1'>
        <h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1>
    </div>

    <%
        try {
            ApplicationDB db = new ApplicationDB();    
            Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String username = (String)request.getSession().getAttribute("username");
            
            String query = "select username, password from user";
            ResultSet result = stmt.executeQuery(query);
            out.println("<h1>BuyMe Users</h1>");
            out.println("<form action='BuyPage.jsp'>");
            out.println("<table>");
            
            int size = 0;  
            if (!result.next()) {  
                out.println("<h3>No Users Yet!</h3>");
            } else {
                out.println("<tr>");
                out.println("<td><strong><u><big>Users</big></u></strong></td>");
                out.println("</tr>");
                int i = 1;
                result.beforeFirst();
                while(result.next()) {
                    if (result.getString(1).equals("admin")) {
                        continue;
                    }
                    out.println("<tr>");
                    out.println("<td><a href='ViewAccount.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
                    request.getSession().setAttribute("selectedUsername"+i, result.getString(1));
                    request.getSession().setAttribute("selectedPassword"+i, result.getString(2));
                    out.println("</tr>");
                    i++;
                }
                out.println("<table>");
                out.println("</form>");
            }
            con.close();
        } catch (Exception ex) {
            out.print(ex);
            out.print("insert failed");
        }
    %>

    <form action="LoginSuccess.jsp">
        <input type=hidden value="Go back to main page">
    </form>
    <br><br>
    <form action="CustomerRepHomePage.jsp">
        <input type="submit" value="Go back to main page">
    </form>

    <br><br>
    <br></br>
</body>
</html>
