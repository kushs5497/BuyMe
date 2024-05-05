<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: View Account</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
        margin: 0;
        padding: 0;
        text-align: center;
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
        font-size: 24px;
    }

    a {
        color: black;
        text-decoration: none;
    }

    a:hover {
        color: black;
        text-decoration: underline;
    }

    table {
        border-collapse: collapse;
        width: 40%;
        margin: 20px auto;
    }

    td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        font-size: 18px;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .button-container {
        margin-top: 20px;
    }

    .button-container form,
    .button-container form div {
        display: inline;
    }

    .button-container input[type="submit"] {
        font-size: 15px;
        height: 30px;
        width: 150px;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .button-container input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

<div class='container'><h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1>
<center><body>
	<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String num = request.getParameter("num");
			String user = (String)request.getSession().getAttribute("selectedUsername" + num);
			request.getSession().setAttribute("user", user);
			String pass = (String)request.getSession().getAttribute("selectedPassword"+num);
			request.getSession().setAttribute("pass", pass);

			//out.println("hello");
			
			out.println("<h1 style='font-size:30px'><strong> User </strong></h1>");
			out.println("<br>");
			out.println("<div class='button-container'>");
    		out.println("<form style='text:align=center' action='EditAccount.jsp'>");
            out.println("<input type='submit' style='font-size:15px;height:30px;width:150px' value='Edit Account'>");
            out.println("</form>");
            out.println("</div>");
            out.println("<br>");
			// ITEM DETAILS
			out.println("<table>");
			out.println("<tr>");
	        out.println("<td><strong> Username </strong></td><td><strong> Password </strong></td>");
	        out.println("</tr>");
	        out.println("<tr>");
       		out.println("<td><p> " + user + "</p></td><td><p>" + pass +"</p></td>");
       		out.println("</tr>");
   	   
   	        out.println("</table>");
   	        out.println("</form>");
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>
</div>
</body></center>
</html>