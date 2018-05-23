package com.tweeter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.KeyFactory;

import java.io.PrintWriter;

import java.util.Date;

@WebServlet(
		name = "Tweets",
		urlPatterns = {"/Tweets"}
		)

public class Tweets extends HttpServlet

{
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String tweet_text = request.getParameter("tweet_text");
		Date date=new Date();
		String picture= request.getParameter("picture");
		String msg = request.getParameter("msg");
		int count=0;
		//String link = "<a href=\"Tweets.jsp\">";
		//String link="Go back";
		DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
		
		Entity T = new Entity("Tweets");
		T.setProperty("id",userid);
		T.setProperty("Name",username);
		T.setProperty("Tweet_content",tweet_text);
		T.setProperty("Created_at",date);
		T.setProperty("Profile-pic",picture);
		T.setProperty("count",count);
		
		ds.put(T);
		
		String key = KeyFactory.keyToString(T.getKey());
		 if (msg != null || msg == "true") {
			 		count++;
			 	 	out.print("<HTML>");
			 	 	out.print("<HEAD><TITLE><u>Tweet Posted</u></TITLE></HEAD>");
			 	 	out.print("<style>\r\n" + 
			 	 			"	  ul {\r\n" + 
			 	 			"    list-style-type: none;\r\n" + 
			 	 			"    margin: 0;\r\n" + 
			 	 			"    padding: 0;\r\n" + 
			 	 			"    overflow: hidden;\r\n" + 
			 	 			"    background-color: #333;\r\n" + 
			 	 			"	}\r\n" + 
			 	 			"\r\n" + 
			 	 			"	li {\r\n" + 
			 	 			"    float: left;\r\n" + 
			 	 			"	}\r\n" + 
			 	 			"\r\n" + 
			 	 			"	li a {\r\n" + 
			 	 			"    display: block;\r\n" + 
			 	 			"    color: white;\r\n" + 
			 	 			"    text-align: center;\r\n" + 
			 	 			"    padding: 14px 16px;\r\n" + 
			 	 			"    text-decoration: none;\r\n" + 
			 	 			"	}\r\n" + 
			 	 			"\r\n" + 
			 	 			"	/* Change the link color to #111 (black) on hover */\r\n" + 
			 	 			"	li a:hover {\r\n" + 
			 	 			"    background-color: #111;\r\n" + 
			 	 			"	}\r\n" + 
			 	 			"</style>");
			 	 	out.print("<BODY>");
			 	 	out.print("<div align=center> \r\n" + 
			 	 			"    <h3>Welcome to My Tweeter Application !</h3>     \r\n" + 
			 	 			"    <!--   <h4>  <a href='/hello'>Application</a></h4> -->\r\n" + 
			 	 			"\r\n" + 
			 	 			"	\r\n" + 
			 	 			"	<br>\r\n" + 
			 	 			"	<br>");
			 	 	out.print("<div> \r\n" + 
			 	 			"  		<ul>\r\n" + 
			 	 			"  		<li><a href=\"Tweets.jsp\">Tweets</a></li>\r\n" + 
			 	 			"  		<li><a href=\"Friends.jsp\">Friends</a></li>\r\n" + 
			 	 			"  		<li><a href=\"TopTweets.jsp\">Top-Tweets</a></li>\r\n" + 
			 	 			"  		</ul>\r\n" + 
			 	 			"  	</div>");
			 	 	out.print("<h4> Tweet Posted </h4>");
			 	 	out.print("<h4>" + username + "</h4>");
			 	 	out.println("<br>");
			 	 	out.print("<img src='"+picture+"'/>");
			 	 	out.println("<br>");
			 	 	out.print("<h4>" + tweet_text + "</h4>");
			 	 	out.println("<br>");
			 	 	//out.print("<h4>" + key + "</h4>");
			 	 	//out.println("<br>");
			 	 	out.println("<a href=\"Tweets.jsp\">Go back</a>");
			 	 	out.print("</div>");;
			 	 	out.print("</BODY>");
			 	 	out.print("</HTML>");
	        }
	        else {
	        response.sendRedirect("/");
	        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
