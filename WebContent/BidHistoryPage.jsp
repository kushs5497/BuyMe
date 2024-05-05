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
        h1 {
            margin-top: 0;
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
        a:hover {
            text-decoration: underline;
        }
    </style>
    <div class = 'container'>
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
			String num = (String)request.getSession().getAttribute("itemNum");
			String itemID = (String)request.getSession().getAttribute("selectedItemID" + num);
			request.getSession().setAttribute("itemid", itemID);
			String itemName = (String)request.getSession().getAttribute("selectedItemName"+num);
			//out.println("hello");
			String query = "select bidder, current_bid from bid_history where item_id = " + itemID;
			ResultSet result = stmt.executeQuery(query);
			
			out.println("<h1 style='font-size:30px'><strong>" + itemName + " Bid History</strong></h1>");
			out.println("<br><br>");
			if (!result.next()) {
				out.println("<h2 style='font-size:25px'><strong>No Bids Have Been Placed!</strong></h1>");
			}
			else {
				out.println("<br>");
				// ITEM DETAILS
				out.println("<table>");
				out.println("<tr>");
		        out.println("<td><strong> Bidder </strong></td><td><strong> Bid </strong></td>");
		        out.println("</tr>");
	       		int i = 1;
	       		result.beforeFirst();
	   	        while(result.next()) {
	   	        	if (i % 2 != 0) {
	   	        		out.println("<tr>");
	   	        		out.println("<td><p> " + result.getString(1) + "</p></td><td><p><a style='font-size:18px' href='ViewBid.jsp?num="+ i + "'>" + result.getString(2)+"</a></p></td>");
	   	        		request.getSession().setAttribute("selectedBidder"+i, result.getString(1));
				        request.getSession().setAttribute("selectedBidAmount"+i, result.getString(2));
	   	        		out.println("</tr>");
	   	        	}
	   	        	else {
	   	        		out.println("<tr>");
	   	        		out.println("<td><p>" + result.getString(1) + "</p></td><td><p><a style='font-size:18px' href='ViewBid.jsp?num="+ i + "'>" + result.getString(2)+"</a></p></td>");
	   	        		request.getSession().setAttribute("selectedBidder"+i, result.getString(1));
				        request.getSession().setAttribute("selectedBidAmount"+i, result.getString(2));
	   	        		out.println("</tr>");
	   	        	}
	   	        	i++;
	   	        }
	   	        out.println("</table>");
	   	        out.println("</form>");
			}
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>
</div>
</body></center>
</html>