<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Interest Alert Confirm</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link, a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:28px"><strong> <a href="Home.jsp"> BuyMe </a> </strong></h1></div>
<center><body>
	<br></br>
	You have successfully set an alert! We'll let you know when an item of your interest is put up for auction!
	<br></br>
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String typeOfDeviceSelected[] = request.getParameterValues("typeOfDevice"); 
		for (String t: typeOfDeviceSelected){
			String query = "INSERT INTO user_interests(type, username) VALUES (?,?)"; 
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, t); 
			ps.setString(2, request.getSession().getAttribute("username").toString()); 
			ps.executeUpdate(); 
		}
        
		//Close the connection. Don't forget to do it, otherwise you're keeping thes resources of the server allocated.
		
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
<br></br>
<form action="AlertsList.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:180px" value="Go back to Alerts">
</form>

</body></center>
</html>