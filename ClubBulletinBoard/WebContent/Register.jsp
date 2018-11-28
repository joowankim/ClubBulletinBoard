<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>

  
  <title>Insert title here</title>
  
  <script>
  $(document)
  .ready(function() {
	  $('.ui.dropdown').dropdown();
	  
	  (function($){
		  $('#register')
		  .form({
		      clubName: {
		        identifier: 'clubName',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '동아리 이름을 입력해 주세요'
		       		
		          }
		        ]
		      },
		      clubCategory: {
		        identifier: 'clubCategory',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '카테고리를 선택해 주세요'
		          }
		        ]
		      },
		      numOfRecruiting: {
		        identifier: 'numOfRecruiting',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '모집인원을 설정해 주세요'
		          },
		          {
		          	type   : 'number',
		          	prompt : '숫자를 입력해 주세요'
		          }
		        ]
		      },
		      homepageLink: {
		        identifier: 'homepageLink',
		        rules: [
		         	{
		          	type   : 'url',
		          	prompt : '홈페이지 주소를 형식에 맞게 입력해 주세요'
		         	}
		        ]
		      },
		      preferCondition: {
		        identifier: 'preferCondition',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '우대 조건을 입력해 주세요'
		          },
		          
		        ]
		      },
		      activityField: {
		        identifier: 'activityField',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '활동 분야를 입력해 주세요'
		          }
		        ]
		      },
		      intro:{
		      	identifier:'intro',
		      	rules: [
		      		{
		      			type   : 'empty',
		      			prompt : '상세 소개 내용을 입력해 주세요'
		      		}
		      	]
		      },
		      posterImg:{
		      	identifier:'posterImg',
		      	rules: [
		      	   {
		      		   type : 'empty',
		      		   prompt : '포스터 이미지를 등록해 주세요'
		      	   }
		      	]
		      }
		      
		    },{
		  	on:'blur',
		  	inline:'true'
		  });
		  }(jQuery));
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
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=sports" class="item">sports</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=art" class="item">art</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=study" class="item">study</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=contest" class="item">contest</a>
				<div class="divider"></div>
				<div class="header">Register</div>
				<a class="item" href="./Register.jsp">new</a>
				<a class="item" href="./myPage.jsp">myPage</a>
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
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=sports" class="item">sports</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=art" class="item">art</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=study" class="item">study</a>
				<a href="./PosterPage.jsp?pageNumber=1&clubCategory=contest" class="item">contest</a>
				<div class="divider"></div>
				<div class="header">Register</div>
				<a class="item" href="./Register.jsp">new</a>
				<a class="item" href="./myPage.jsp">myPage</a>
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
	
	
	<div class="ui very padded segment">
		<h2>동아리 정보를 입력해 주세요 </h2>
		<form id="register" class="ui form" action="./posterAction" method="post" enctype="multipart/form-data">
	  		<div class="field">
	    		<label>동아리명 </label>
	    		<input type="text" name="clubName" placeholder="동아리 이름 ">
	  		</div>
	  		<div class="field">
	    		<label>카테고리 </label>
	   		 	<select name="clubCategory">
	   		 		<option value="">카테고리</option>
	   		 		<option value="sports">스포츠</option>
	   		 		<option value="art">예술</option>
	   		 		<option value="study">학술</option>
	   		 		<option value="contest">공모전</option>
	   		 	</select>
	  		</div>
	  		
	  		<div class="field">
	    		<label>모집 인원 </label>
	   		 	<input type="text" name="numOfRecruiting" placeholder="모집 인원">
	  		</div>
	  		
	  		<div class="field">
	    		<label>홈페이지 링크 </label>
	   		 	<input type="text" name="homepageLink" placeholder="홈페이지 주소">
	  		</div>
	  		
	  		<div class="field">
	    		<label>우대 조건 </label>
	   		 	<input type="text" name="preferCondition" placeholder="우대 조건">
	  		</div>
	  		
	  		<div class="field">
	    		<label>활동 분야 </label>
	   		 	<input type="text" name="activityField" placeholder="활동 분야">
	  		</div>
	  		
	  		<div class="ui form">
	  			<div class="field">
	    			<label>상세 소개 </label>
	    			<textarea name="intro"></textarea>
	  			</div>
	  		</div>
	  		<br>
	  		
	  		<!-- Image insert code  -->
			<div class="ui placeholder segment">
	  			<div class="ui icon header">
	    			<i class="pdf file outline icon"></i>
	    				포스터 사진을 첨부해 주세요 
	 		 	</div>
	  			<input type="file" name="posterImg" class="ui primary button"></input>
			</div>
			
			<br>
			
	  		<input class="ui blue button" type="submit"></input>
		</form>
	</div>
	

	
</body>
</html>