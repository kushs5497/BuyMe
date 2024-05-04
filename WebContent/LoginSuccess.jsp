<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Login Success</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<div class="container">
		<h1>
			<a href="LoginSuccess.jsp"> BuyMe </a>
		</h1>
		<%
            try {
                // Get the database connection
                ApplicationDB db = new ApplicationDB();    
                Connection con = db.getConnection();

                // Create a SQL statement
                Statement stmt = con.createStatement();

                // Get parameters from the HTML form at the index.jsp
                String username = (String)request.getSession().getAttribute("username");
                out.print("<p>Welcome to BuyMe, " + username + "!</p>");

                // Close the connection
                con.close();
            } catch (Exception ex) {
                out.print(ex);
                out.print("insert failed");
            }
        %>

		<div class="button-container">
			<form action="AuctionList.jsp">
				<input type="submit" value="Buy">
			</form>
			<form action="SellerForm.jsp">
				<input type="submit" value="Sell">
			</form>
		</div>

		<div class="button-container">
			<form action="AlertsList.jsp">
				<input type="submit" value="Alerts">
			</form>
			<form action="QuestionsPage.jsp">
				<input type="submit" value="Questions">
			</form>
		</div>

		<form action="Home.jsp">
			<input type="submit" value="Logout">
		</form>

	</div>
</body>
</html>
