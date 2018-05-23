<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
window.fbAsyncInit = function() 
{
    FB.init({
      appId      : '432813150496589',
      cookie     : true,
      xfbml      : true,
      version    : 'v3.0'
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

	function friendlist()
	{
	FB.api('/me','GET',{fields:'friends'},function(response) {
		/*if (response && response.data){
	        alert(response.data);
	        alert('data is fetched');
	        document.getElementById('friends')=response.data;
	      } 
		else 
		{
	        alert('Something goes wrong');
	      }*/
		if(response.friends.data.id=='10152670352037900')
			{
			document.getElementById('friends')=response.friends.data.name;
			
			}
		else
			{
			
			alert('cant fetch data');
			}
		});
	}
	
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
		FB.api('/me', 'GET', {fields: 'name,id,picture.width(100).height(100)'}, function(response)
		{
			var name = response.name;
			document.getElementById('pic').innerHTML = "<img src='"+ response.picture.data.url+"'>";
			
			document.getElementById('userid').value =  response.id;
			document.getElementById('username').value =  response.name;
			document.getElementById('picture').value = 'http://graph.facebook.com/' + response.id + '/picture';
			
			document.cookie = "userid=" + response.id;
			document.cookie = "username=" + response.name;
			document.cookie = "picture=" + "http://graph.facebook.com/" + response.id + "/picture?type=large";
			
		});
		
	}

</script>


<div align=center> 
    <h3>Your Connections !</h3>     
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
	<div>
	<div id="pic"></div>
	<div id="status"></div>
	<button id="login" onclick="login()">Login</button>
	</div>
  	<br>
  	<br>
	<div>List of Friends</div>
	<button onclick="friendlist()">Friends</button>
	<div id="friends"></div>
	<br><br>
	
	
	
	
</div>
</body>
</html>