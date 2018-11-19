<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- Code for top menu bar -->
	<div class="ui large top fixed hidden menu">
	  <div class="ui container">
	  	<a href="" class="active item">Home</a>
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
						<a class="item">new</a>
						<a class="item">edit</a>
					</div>
				</div>
		
	    <div class="right menu">
	      <div class="item">
	        <a class="ui button">Log in</a>
	      </div>
	      <div class="item">
	        <a class="ui primary button">Sign Up</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<br>
	<br>
	
	<h2>동아리 정보를 입력해 주세요 </h2>
	
	<div class="ui very padded segment">
	<form class="ui form">
  		<div class="field">
    		<label>동아리명 </label>
    		<input type="text" name="first-name" placeholder="동아리 이름을 입력 해주세요 ">
  		</div>
  		<div class="field">
    		<label>카테고리 </label>
   		 	<select name="category">
   		 		<option value="sports">스포츠</option>
   		 		<option value="art">예술</option>
   		 		<option value="fun">친목</option>
   		 		<option value="study">학술</option>
   		 	</select>
  		</div>
  		
  		<div class="field">
    		<label>모집 인원 </label>
   		 	<input type="text" name="last-name" placeholder="Last Name">
  		</div>
  		
  		<div class="field">
    		<label>홈페이지 링크 </label>
   		 	<input type="text" name="last-name" placeholder="Last Name">
  		</div>
  		
  		<div class="field">
    		<label>우대 조건 </label>
   		 	<input type="text" name="last-name" placeholder="Last Name">
  		</div>
  		
  		<div class="field">
    		<label>활동 분야 </label>
   		 	<input type="text" name="last-name" placeholder="Last Name">
  		</div>
  		
  		<div class="ui form">
  			<div class="field">
    			<label>상세 소개 </label>
    			<textarea></textarea>
  			</div>
  		</div>
  		<br>
  		
  		<!-- Image insert code  -->
		<div class="ui placeholder segment">
  			<div class="ui icon header">
    			<i class="pdf file outline icon"></i>
    				포스터 사진을 첨부해 주세요 
 		 	</div>
  			<div class="ui primary button">Add Picture</div>
		</div>
		
		<br>
		
  		<button class="ui button" type="submit">Submit</button>
	</form>
	</div>
	

	
</body>
</html>