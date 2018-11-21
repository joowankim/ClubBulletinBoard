<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poster.PosterDAO" %>
<%@ page import="poster.Poster" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="likey.LikeyDAO" %>
<%@ page import="likey.Likey" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>

  </script>

  <style type="text/css">

    .hidden.menu {
      display: none;
    }

    .masthead.segment {
      min-height: 700px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
    .masthead h1.ui.header {
      margin-top: 3em;
      margin-bottom: 0em;
      font-size: 4em;
      font-weight: normal;
    }
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 8em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 700px) {
      .ui.fixed.menu {
        display: none !important;
      }
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
      .masthead h1.ui.header {
        font-size: 2em;
        margin-top: 1.5em;
      }
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }


  </style>

  <script>
 
  $(document)
    .ready(function() {

    $('.ui.dropdown')
    	.dropdown()
    	;
    
    $("a[target='likeSpan']").on("click",function(){
    	var ids = $(this).attr("id");
    	$.ajax({
    		url:"./likeController?ids="+ids,
    		type:"GET",
    		dataType:"json",
    		error:function(request, status, error){
    			alert("�α��� �Ŀ� �̿����ּ���");
    		},
    		success:function(data) {
    				
    			if ($("i[target='like']").attr("class") == "heart outline icon"){
    				$("i[target='like']").attr("class", "heart icon");
				} else {
					$("i[target='like']").attr("class", "heart outline icon");
				}
    			
    			$("span.like").text(data["likeCount"] + " likes");
    		}
    	});
    })
    ;
    
  })
  ;
  </script>

</head>
<body>

	<!-- Page Contents -->
	<div class="pusher">
	  <%
		  String sessionID = null;
		  if (session.getAttribute("sessionID") != null) {
			  sessionID = (String) session.getAttribute("sessionID");		
		  }
		  int pageNumber = 1;	// �⺻ �������� �ǹ�
		  if (request.getParameter("pageNumber") != null) {
			  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		  }
	  %>	
	  <!-- Code for top menu bar -->
	  <%
		  if (sessionID == null) {			
	  %>
	  <div class="ui large top menu">
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
	
	  <div class="ui large top menu">
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
	  <div class="ui container">
	  
	  	  <div class="ui fluid container">
		  	  <h1 class="ui header">
				<img class="ui image" src="./image/sample_image.png">
				<div class="content">
				  	Study
				</div>
			  </h1>
	  	  </div>
	  	  
	  	  <div class="ui divider"></div>
	  	  
	  	  <div class="ui four column doubling stackable grid container">
	  	  	
	  	  	<%
	  	  		PosterDAO posterDAO = new PosterDAO();
	  	  		UserDAO userDAO = new UserDAO();
	  	  		LikeyDAO likeyDAO = new LikeyDAO();
	  	  		
	  	  		ArrayList<Poster> list = posterDAO.getList(pageNumber);
	  	  		for(int i=0; i<list.size(); i++) {
	  	  	
	  	  	%>
	  	    <div class="column">	  	    	

			  <div class="ui link card">
				<a class="image" href="./DetailPage.jsp?posterID=<%=list.get(i).getPosterID() %>">
		      	  <img src="./image/sample_image.png">
				</a>
				<div class="content">
				  <a class="header" href="./DetailPage.jsp?posterID=<%=list.get(i).getPosterID() %>"><%=list.get(i).getClubName() %></a>
				  <div class="meta">
				    <a href="./DetailPage.jsp?posterID=<%=list.get(i).getPosterID() %>"><%=list.get(i).getActivityField() %></a>
				  </div>		
				</div>
				<div class="extra content">
				  <a id="<%=list.get(i).getPosterID() %>" class="right floated" target="likeSpan">		  
				    <%	
				    	if (sessionID != null) {
				    		if (likeyDAO.checkLike(list.get(i).getPosterID(), Integer.parseInt(sessionID)) == 1) {
				    %>			    
						    <i class="heart icon" target="like"></i>
						 <% } else { %>
						    <i class="heart outline icon" target="like"></i>
						 <% } 
						} else { %>

				    	<i class="heart outline icon"></i>
				    <% } %>
				    
				       <span class="like"><%=list.get(i).getLikeCount() %> likes</span>
				  </a>
				  
				  <span>
				    <i class="comment outline icon"></i>
				       <span class="comment"><%=list.get(i).getCommentCount() %> comments</span>
				  </span>
				</div>
			  </div>		   
			  
			</div>
			<% } %>
			
		  </div>
	  </div>
	</div>
</body>

</html>