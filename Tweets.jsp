<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tweeter.Tweets,java.io.*" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
	  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
	}

	li {
    float: left;
	}

	li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
	}

	/* Change the link color to #111 (black) on hover */
	li a:hover {
    background-color: #111;
	}
</style>
<title>Project 1- Tweeter Application</title>
</head>

 <body>
 
<script>
	//store app data 
	window.fbAsyncInit = function() 
	{
	    FB.init({
	      appId      : '432813150496589',
	      cookie     : true,
	      xfbml      : true,
	      version    : 'v3.0',
	      oauth		 : true
	    });
	      
	    //FB.AppEvents.logPageView(); 
	    //get the status of login 
	    FB.getLoginStatus(function(response) {
	        if(response.status=='connected')
	        {	testAPI();
	        	document.getElementById('status').innerHTML='Hi ' +name+ ', we are connected';
	        	document.getElementById('login').style.visibility = 'hidden';
	        }else if(response.status=='not_authorized')
	        {
	        	document.getElementById('status').innerHTML='we are not logged in';
	        }
	        else
	        {
	        	document.getElementById('status').innerHTML='we are not connected';
	        }
	    });

	  };
	  
		//facebook javascript sdk code 
	  	(function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "https://connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	  	 }(document, 'script', 'facebook-jssdk'));
	  
	  	//Login function
	  	function login()
	  	{
		 FB.login(function(response){
			 if(response.status=='connected'){
				 	testAPI();
		        	document.getElementById('status').innerHTML='Hi ' + name + ', we are connected';
		        	document.getElementById('login').style.visibility='hidden';
		        }
			 else if(response.status=='not_authorized')
		        {
		        	document.getElementById('status').innerHTML='we are not logged in';
		        }
		        else
		        {
		        	document.getElementById('status').innerHTML='You are not Logged into Facebook';
		        } 
		 }); 
	  	}

	  	//store values in cookies for later use in java file
	function testAPI() {
		FB.api('/me', 'GET', {fields: 'name,id,picture.width(100).height(100),friends'}, function(response)
		{
			var name = response.name;
			document.getElementById('pic').innerHTML = "<img src='"+ response.picture.data.url+"'>";
			
			document.getElementById('userid').value =  response.id;
			document.getElementById('username').value =  response.name;
			document.getElementById('picture').value = 'http://graph.facebook.com/' + response.id + '/picture';
			document.getElementById('friends').value = response.friends.data;
			
			document.cookie = "userid=" + response.id;
			document.cookie = "username=" + response.name;
			document.cookie = "picture=" + "http://graph.facebook.com/" + response.id + "/picture?type=large";
			
			
		},{scope: 'user_friends'});
		
	}
	 //post function on click of create and post button
	  function post() {
		  	var msg = "false";
		  	//document.getElementById('text').value = document.getElementById('tweet_text');
		 	//var tweet_text = document.getElementById('tweet_text').value;
			//var userid = document.getElementById('userid').value;
			//var username = document.getElementById('username').value;
			//var picture = document.getElementById('picture').value;
			//document.cookie = "tweet_text=" + text;
			//document.getElementById('msg').value = msg;
			//document.getElementById('name').innerHTML = username;
			//document.getElementById('t').innerHTML = tweet_text;
		  	//var userid = document.getElementById("userid").value;
			//String href = "'display_tweet.jsp?id=" + userid + "'";
		}
	
	//share tweet on facebook timeline -- have to work on it at last
	function share(){
		//post();
		//var href1 = "'display_tweet.jsp?id=" + userid + "'";
		FB.ui({method: 'share', href: 'https://tweetertrailapp.appspot.com/Tweets', display: 'popup',}, function(response)
		{
			if (!response || response.error) {
			    alert('Cancelled your post');
			  } 
			else 
			{
			    alert('The Post was posted');
				
			  }
		});
	}
	

	//send tweet link in private -- have to work on it at last
	function sendmessage(){
		
		FB.ui({method: 'send', display: 'popup', link: 'https://tweetertrailapp.appspot.com/Tweets',},function(response)
		{
			if (!response || response.error) {
				
			    alert('Cancelled to send Message');
			  } 
			else 
				{
			    alert('Your message is sent');
				
			  }
		});	
	}
	

	</script>
  
  <div align=center> 
    <h3>Welcome to My Tweeter Application !</h3>     
    <!--   <h4>  <a href='/hello'>Application</a></h4> -->

	
	<br>
	<br>
		
	<!-- Navigation bar for three pages -->
	 <div> 
  		<ul>
  		<li><a href="Tweets.jsp">Tweets</a></li>
  		<li><a href="Friends.jsp">Friends</a></li>
  		<li><a href="TopTweets.jsp">Top-Tweets</a></li>
  		</ul>
  	</div>
	<br>
	<br>
	
	<!-- Login button -->	
	<div>
	<div id="pic"></div>
	<div id="status"></div>
	<button id="login" onclick="login()">Login</button>
	</div>
	
	<!-- stored cookie in variables to be used in java file with entity properties -->
	
		<% Cookie[] cookies = request.getCookies();
		
		String userid="", username="", picture="";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("userid")) {
					userid = cookie.getValue();
				}
				if (cookie.getName().equals("username")) {
					username = cookie.getValue();
				}
				if (cookie.getName().equals("picture")) {
					picture = cookie.getValue();
				}
				
			}
		}
		
		%>
	
	<br><br>
	
	<!-- form for posting and storing the values in datastore -->
	<form action="Tweets" method="post">
	Create New Tweet
	<br><br>
	 <input type="hidden" name="userid" id="userid" value=""/>
     <input type="hidden" name="username" id="username" value=""/>
     <input type="hidden" name="picture" id="picture" value=""/>     
	 <input type="hidden" name="msg" id="msg" value=""/>
	 <textarea rows="5" cols="15" id="tweet_text" name="tweet_text"></textarea>
		<br><br>
	 <input type="submit" value="Create and Post" onclick="post()"/>
	</form>
	
	<br>
	<br>
	
	<!-- Provided Two options for sharing on timeline and sending in message -->
	<div>
	<button onclick ="share()">Share on Facebook</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick = "sendmessage()">Send In Message</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	<!-- 
	<button onclick="location.href='/Tweets'">check java file</button>	
	 -->
	<br>
	<br>
	<div id="friends"></div>

	 
	
	
	
	
	
	<div class="container">
	<div class="row">
	<div class="span4 well" style="overflow-y:scroll; height:101%;">
		<%
		//declaration of datastore to get service from app engine
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		//Filter propertyFilter = new FilterPredicate("id", FilterOperator.EQUAL, userid);
		//Query for sorting the Tweets by date= created_at in descending order
		
		Query query = new Query("Tweets").addSort("date", Query.SortDirection.DESCENDING);
		 
		//PreparedQuery q = datastore.prepare(query);
		//Fetch list of Entities in tweets variable
		List<Entity> tweet = datastore.prepare(query).asList(FetchOptions.Builder.withChunkSize(10));
		
		
    	if (tweet.isEmpty()) 
    	{
		%>
			<div class="alert alert-danger"> <p> No tweets to be shown yet</p> </div>
		<%
		}
		else 
		{  
		for (Entity T : tweet) { 
		String text =  (String) T.getProperty("Tweet_content");
		String date = (String) T.getProperty("Created_at");
		String name = (String) T.getProperty("Name");

		
		%>
		<div>
           <div id="name"><%=name%></div>
           <div id="text"><%=text%></div>
            <div id="time">At<%=date%></div>
              	</div>      
 		<hr />
		<% 
  		} }
		%>
	</div>
	</div>
	</div>
	</div>
 </body>
 </html>