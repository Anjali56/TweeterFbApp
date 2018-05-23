<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

</head>
<body>
<script type="text/javascript">

	function Top-Tweets()
	{	

	}

</script>
<div align="center">
    <h3>Popular Tweets !</h3>     
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
	<div></div>
	<button onclick="Top-Tweets()">Popular Tweets</button>
	<div id="top-tweets"></div>



</div>
</body>
</html>