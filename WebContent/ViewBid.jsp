<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Bid History</title>
</head>
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
            font-size: 24px;
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
    <div class='container'>
	<%
		try {
			

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String username = (String)request.getSession().getAttribute("username");
			String checkIfUserIsCustomerRepQuery = "select * from cust_reps where rep_name = '" + username + "'";
			ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);
			if (checkIfUserIsCustomerRepResults.next()) {
				out.println("<div class='h1'><h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1></div>");
			}
			else {
				out.println("<div class='h1'><h1><a href='LoginSuccess.jsp'> BuyMe </a></h1></div>");
			}
			out.println("<center><body>");
			String num = request.getParameter("num");
			String bidder = (String)request.getSession().getAttribute("selectedBidder" + num);
			request.getSession().setAttribute("bidder", bidder);
			String bid = (String)request.getSession().getAttribute("selectedBidAmount"+num);
			request.getSession().setAttribute("bid", bid);
			String itemID = (String)request.getSession().getAttribute("itemid");
			request.getSession().setAttribute("itemid", itemID);
			//out.println("hello");
			
			out.println("<h1 style='font-size:30px'><strong> Bid </strong></h1>");
			
			checkIfUserIsCustomerRepResults.beforeFirst();
			if (checkIfUserIsCustomerRepResults.next()) {
				out.println("<form style='text:align=center' action='RemoveBidJava.jsp'>");
				out.println("<input type='submit' style='font-size: 15px;height: 30px; width: 200px;background-color: #4CAF50;color: white;border: none;border-radius: 4px;cursor: pointer;' value='Remove Bid'>");
				out.println("</form>");
			}
			
			out.println("<br>");
			// ITEM DETAILS
			out.println("<table>");
			out.println("<tr>");
	        out.println("<td><strong> Bidder </strong></td><td><strong> Bid </strong></td>");
	        out.println("</tr>");
	        out.println("<tr>");
       		out.println("<td><p> " + bidder + "</p></td><td><p>" + bid +"</p></td>");
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