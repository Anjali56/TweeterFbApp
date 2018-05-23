
package com.tweeter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.KeyFactory;

@WebServlet(
		name = "TopTweets",
		urlPatterns = {"/Top-Tweets"}
		)

public class TopTweets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TopTweets() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String tweet_text = request.getParameter("tweet_text");
		Date date=new Date();
		String picture= request.getParameter("picture");
		String msg = request.getParameter("msg");
		
	    response.getWriter().print("Top-Tweets\r\n");
	    
	    
	    //String key = KeyFactory.keyToString(T.getKey());
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
