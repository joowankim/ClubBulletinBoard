<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>
<title>DE</title>
  <title>Homepage-Semantic</title>
 
</head>
<body>
	<div class="ui large top fixed hidden menu">
	  <div class="ui container">
	  	<a href="IndexPage.jsp" class="active item">Home</a>
	   	<a href="IndexPage.jsp#Work" class="item">Work</a>
	    <a href="IndexPage.jsp#Company" class="item">Company</a>
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
	
	<h1 class="ui blue block header">
  		동아리명 
	</h1>
	
		<div class="ui horizontal segments" style="padding:10px;width:1010px;margin:auto">
			<div class="ui compact segments">
    			<div class="ui segment">
     			 	<img class="ui large image" src="sample_image.png">
    			</div>
    		</div>
    		
<table class="ui unstackable table"style="width:500px">
  <thead>
    <tr>
      <th>동아리 명</th>
      <td>컴퓨터 동아리</td>
     
    </tr>
    <tr>
      <th>분류</th> 
     <td>학술</td>
    </tr>
    <tr>
     <th>모집인원</th> 
        <td>10명</td>
    </tr>
    <tr>
    <th>우대 조건</th>
        <td>컴퓨터 관련 자격증 소지자</td>
    </tr>
       <tr>
    <th>게시자</th>
        <td>홍길동</td>
    </tr>
  </thead>
</table>
</div>
  	
  		
  		<div class="ui segment" style="height:200px;width:1010px; margin:auto">
  			<h3>소개 </h3>
  			<p>컴퓨터를 배우는 동아리 입니다.</p>
		</div>

<div class="ui very padded segment" style="height:auto;width:1010px; margin:auto">
  <div class="ui comments" style="width:1010px;">
 
  <div class="comment">
    <div class="content">
      <a class="author">Name</a>
      <div class="metadata">
        <span class="date">00:00</span>
      </div>
      <div class="text">
        text message
      </div>
      <div class="actions">
        <a class="reply">Reply</a>
      </div>
    </div>
  </div>
  </div>
  </div>

<div class="ui very padded segment" style="height:auto;width:1010px; margin:auto">
  <form class="ui reply form">
    <div class="field">
      <textarea></textarea>
    </div>
    <div class="ui blue labeled submit icon button">
      <i class="icon edit"></i> 댓글 달기
    </div>
  </form>
  </div>


</body>
</html>
