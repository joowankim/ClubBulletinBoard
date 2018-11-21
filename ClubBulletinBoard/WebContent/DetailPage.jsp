<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>
	
  <script>
  $(document)
  .ready(function() {
	  $('.ui.dropdown').dropdown();
  });
  </script>
 
</head>
<body>
	<%

		String sessionID = null;
		if (session.getAttribute("sessionID") != null) {
			sessionID = (String) session.getAttribute("sessionID");		
		}
	%>	
	<!-- Code for top menu bar -->
	<%
		if (sessionID == null) {			
	%>
	<div class="ui large top fixed hidden menu">
	  <div class="ui container">
	    <a href="" class="item">Home</a>
	    <a href="#Work" class="item">Work</a>
	    <a href="#Company" class="item">Company</a>
		<div class="ui pointing dropdown link item">
			<span class="text">Clubs</span>
			<i class="dropdown icon"></i>
			<div class="menu">
				<div class="header">Categories</div>
				<a href="" class="item">sports</a>
				<a class="item">art</a>
				<a class="item">study</a>
				<a class="item">contest</a>
				<div class="divider"></div>
				<div class="header">Register</div>
				<a class="item" href="./Register.jsp">new</a>
				<a class="item">edit</a>
			</div>
		</div>
		
	    <div class="right menu">
	      <div class="item">
	        <a href="./LoginPage.jsp" class="ui button">Log in</a>
	      </div>
	      <div class="item">
	        <button id="signUp" class="ui primary button">Sign Up</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%
		} else {	
	%>
	
	<div class="ui large top fixed hidden menu">
	  <div class="ui container">
	    <a href="" class="item">Home</a>
	    <a href="#Work" class="item">Work</a>
	    <a href="#Company" class="item">Company</a>
		<div class="ui pointing dropdown link item">
			<span class="text">Clubs</span>
			<i class="dropdown icon"></i>
			<div class="menu">
				<div class="header">Categories</div>
				<a href="" class="item">sports</a>
				<a class="item">art</a>
				<a class="item">study</a>
				<a class="item">contest</a>
				<div class="divider"></div>
				<div class="header">Register</div>
				<a class="item" href="./Register.jsp">new</a>
				<a class="item">edit</a>
			</div>
		</div>
	    <div class="right menu">
	      <div class="item">
	      	<form method="post" action="./LogOut.jsp">
	        	<input type="submit" class="ui fluid large teal submit button" value="Log out"></input>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<% } %>	
	
	<br>
	<br>
	
	<h1 class="ui blue block header">
  		동아리명 
	</h1>
	
		<div class="ui horizontal segments">
			<div class="ui compact segments">
    			<div class="ui segment">
     			 	<img class="ui large image" src="sample_image.png">
    			</div>
    		</div>
    
    		<div class="ui segment">
      			<h3>동아리명: 컴퓨터 동아리 </h3>
      			<h3>분류: 학술 </h3>
      			<h3>모집인원: 10명 </h3>
      			<h3>우대 조건: 컴퓨터 관련 자격증 소지자 </h3>
   			 </div>
  		</div>
  		
  		<div class="ui very padded segment">
  			<h3>소개 </h3>
  			<p>컴퓨터를 배우는 동아리 입니다.</p>
		</div>
 
</body>
</html>