<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Questions</title>
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
        text-decoration: underline;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }

    .button-container {
        margin-bottom: 20px;
    }

    .button-container form {
        display: inline-block;
        margin-right: 10px;
    }

    input[type="submit"] {
        height: 30px;
        width: 150px;
        font-size: 14px;
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
<body>
<div class = 'container'>

		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			String username = (String)request.getSession().getAttribute("username");
			String checkIfUserIsCustomerRepQuery = "select * from customer_reps where customer_rep_name = '" + username + "'";
			ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);
			if (checkIfUserIsCustomerRepResults.next()) {
				out.println("<div class='h1'><h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1></div>");
			}
			else {
				out.println("<div class='h1'><h1><a href='LoginSuccess.jsp'> BuyMe </a></h1></div>");
			}
			
			out.println("<center><body>");
			out.println("<h1 style='font-size:25px'><strong> Questions </strong></h1>");
			
						
			String submittedQuestion = request.getParameter("ask_question");
			request.getSession().setAttribute("submittedQuestion", submittedQuestion);
			
			String q = "select * from questions where question = '" + submittedQuestion + "'";
			ResultSet checkQuestionDup = stmt2.executeQuery(q);


			if(submittedQuestion != null && !checkQuestionDup.next()){
				String insert = "INSERT INTO questions(username, question)"
						+ "VALUES (?, ?)";

				PreparedStatement ps = con.prepareStatement(insert);
				
				ps.setString(1, username);
				ps.setString(2, submittedQuestion);
				ps.executeUpdate();
			}
			checkIfUserIsCustomerRepResults.beforeFirst();
			if (!checkIfUserIsCustomerRepResults.next()) {
				out.println("<form style='text:align=center' action='AskQuestion.jsp'>");
				out.println("<input type='submit' style='font-size:15px;height:30px;width:180px' value='Ask a Question'>");
				out.println("</form>");
				
				out.println("<br>");
				out.println("<form style='text:align=center' action='SearchQuestionsPage.jsp'>");
				out.println("<input type='submit' style='font-size:15px;height:30px;width:180px' value='Search Questions'>");
				out.println("</form>");
				
				
			}
			
			out.println("<br>");
			String query = "select question, question_id from questions";
	        ResultSet result = stmt.executeQuery(query);
    
	        out.println("<form action='QuestionsAnswersPage.jsp'>");
	        out.println("<table>");
	        
    		int size= 0;  
    		if (!result.next()) {  
    		  out.println("<h3 style='font-size:25px'><strong> No Questions Yet!</strong></h3>");
    		}
    		else {
    			out.println("<tr>");
    	        out.println("<td><strong><u><big>Questions</big></u></strong></td>");
        		out.println("</tr>");
        		int i = 1;
        		result.beforeFirst();
    	        while(result.next()) {
    	        	if (i % 2 != 0) {
    	        		out.println("<tr>");
    	        		out.println("<td><a style='font-size:18px' href='QuestionAnswersPage.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
    		        	request.getSession().setAttribute("selectedQuestionID"+i, result.getString(2));
    			        request.getSession().setAttribute("selectedQuestion"+i, result.getString(1));
    	        		out.println("</tr>");
    	        	}
    	        	else {
    	        		out.println("<tr>");
    	        		out.println("<td><a style='font-size:18px' href='QuestionAnswersPage.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
    		        	request.getSession().setAttribute("selectedQuestionID"+i, result.getString(2));
    			        request.getSession().setAttribute("selectedQuestion"+i, result.getString(1));
    	        		out.println("</tr>");
    	        	}
    	        	i++;
    	        }
    	        out.println("<table>");
    	        out.println("</form>");
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
    		}
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	</div>
</body></center>
</html>