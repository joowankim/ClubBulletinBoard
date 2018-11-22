<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="poster.Poster" %>
<%@ page import="poster.PosterDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
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
  
  function registerComment(){
	  var form = document.getElementById("commentForm");
	  var pID = document.createElement('input');
	  var posterID = <%=request.getParameter("posterID")%>
	  pID.setAttribute("name", "posterID");
	  pID.setAttribute("value", posterID);
	  form.appendChild(pID);
	  
	  
	  form.submit();
	  
  }
  </script>
 
</head>
<body>
	<%

		String sessionID = null;

		if (session.getAttribute("sessionID") != null) {
			sessionID = (String) session.getAttribute("sessionID");
		}
		int posterID = 0;
		if (request.getParameter("posterID") != null) {
			posterID = Integer.parseInt(request.getParameter("posterID"));
		}
		if (posterID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 포스터입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		Poster poster = new PosterDAO().getPoster(posterID);
		
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
  		<%=poster.getClubName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %> 
	</h1>
	
		<div class="ui horizontal segments">
			<div class="ui compact segments">
    			<div class="ui segment">
     			 	<img class="ui large image" src="<%=request.getContextPath()%>/image/poster/<%=poster.getPosterFileName()%>">
    			</div>
    		</div>
    
    		<div class="ui segment">
      			<h3>동아리명: <%=poster.getClubName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %> </h3>
      			<h3>분류: <%=poster.getClubCategory().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %> </h3>
      			<h3>모집인원: <%=poster.getNumOfRecruiting() %>명 </h3>
      			<h3>우대 조건: <%=poster.getPreferCondition().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %> </h3>
   			 </div>
  		</div>
  		
  		<div class="ui very padded segment">
  			<h3>소개 </h3>
  			<p><%=poster.getIntro().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %></p>
		</div>
		
		<a class="ui button" href="./PosterPage.jsp">목록</a>
		<%
			if(sessionID != null && sessionID.equals(String.valueOf(poster.getUserID()))){
		%>
				<a href="update.jsp?posterID=<%=posterID%>" class="ui button">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?posterID=<%=posterID%>" class="ui button">삭제</a>
		<%
			}
		%>

		<div class="ui small comments">
  			<h3 class="ui dividing header">Comments</h3>
  			
  				<!-- text area -->
				<form id="commentForm" class="ui reply form" action="./commentAction.jsp">
			        <div class="field">
			          <textarea name="contents"></textarea>
			        </div>
			        <div class="ui primary submit labeled icon button" onclick="registerComment();">
			          <i class="icon edit"></i> Add Reply
			        </div>
		      	</form>
		      
		      	<%
		      		CommentDAO commentDAO = new CommentDAO();
		      		UserDAO userDAO = new UserDAO();
		      		
		      		ArrayList<Comment> list = commentDAO.getComments(posterID);
		  	  		for(int i=0; i<list.size(); i++) {
		      	%>
		      	<!-- comment -->
		      	<div class="ui comments">
				  <div class="comment">
				    <a class="avatar">
				      <img src="/images/avatar/small/stevie.jpg">
				    </a>
				    <div class="content">
				      <a class="author"><%=userDAO.getUserName(list.get(i).getUserID()).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %></a>
				      <div class="metadata">
				        <div class="date"><%=list.get(i).getDate() %></div>
				      </div>
				      <div class="text">
				        <%=list.get(i).getContents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>") %>
				      </div>
				      <%
						  if(sessionID != null && sessionID.equals(String.valueOf(poster.getUserID()))){
					  %>
				      <div class="actions">
				        <a class="delete" onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteComment.jsp?posterID=<%=posterID%>&commentID=<%=list.get(i).getCommentID()%>">delete</a>				   
				      </div>
				      <%
						  }
					  %>
				    </div>
				  </div>
				</div>
		      	<% } %>
		</div>
 
</body>
</html>