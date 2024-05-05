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
    <title>BuyMe: Alert List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
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
            font-size: 30px;
            text-align: center;
        }
        a {
            color: black;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            margin-top: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        input[type="submit"] {
            height: 35px;
            width: 180px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            border: none;
            padding: 5px;
            box-sizing: border-box;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><a href="LoginSuccess.jsp"> BuyMe </a></h1>
    <h1><strong>Alert List</strong></h1>
    <br>
    <form action="InterestedPage.jsp">
        <input type="submit" value="Interested in an Item?">
    </form>
    <br><br>
    <%
        try {
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();
            
            Statement stmt = con.createStatement();
            
            String user = request.getSession().getAttribute("username").toString();
            String query = "select * from alerts where username = '" + user + "'";
            ResultSet result = stmt.executeQuery(query);
            
            out.println("<form action='Alert.jsp'>");
            out.println("<table>");
            
            if (!result.next()) {  
                out.println("<h3>No Alerts yet!</h3>");
            } else {
                out.println("<tr>");
                out.println("<td><strong><u><big>Alerts</big></u></strong></td>");
                out.println("</tr>");
                int i = 1;
                result.beforeFirst();
                while(result.next()) {
                    String message = result.getString(2);
                    out.println("<tr>");
                    out.println("<td>" + message + "</td>");
                    request.getSession().setAttribute("selectedAlertItemID"+i, result.getString(2));
                    request.getSession().setAttribute("selectedAlertMessage"+i, message);
                    out.println("</tr>");
                    i++;
                }
                out.println("</table>");
                out.println("</form>");
            }
            con.close();
        } catch (Exception ex) {
            out.print(ex);
            out.print("insert failed");
        }
    %>
    <br><br>
    <form action="LoginSuccess.jsp">
        <input type=hidden value="Go back to main page">
    </form>
    <form action="LoginSuccess.jsp">
        <input type="submit" value="Go back to main page">
    </form>
</div>
</body>
</html>
