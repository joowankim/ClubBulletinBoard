<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  <script src="./semantic/semantic.min.js">

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

      // fix menu when passed
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        })
      ;

      // create sidebar and attach to menu open
      $('.ui.sidebar')
        .sidebar('attach events', '.toc.item')
      ;
      
      $('.ui.dropdown').dropdown();

    })
  ;
  
  $('.ui.search')
  .search({
    source: content
  })
;
  </script>

</head>
<body>

	<!-- Following Menu -->
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
	   <div class="ui search">
 	 <div class="ui icon input">
   	 <input class="prompt" type="text" placeholder="Search Clubs..." value="">
    	<i class="search icon"></i>
  	</div>
 	 <div class="results"></div>
	</div>
	    </div>
	  </div>
	</div>
	
	<!-- Sidebar Menu -->
	<div class="ui vertical inverted sidebar menu">
	  <a class="active item">Home</a>
	  <a class="item">Work</a>
	  <a class="item">Company</a>
	  <a class="item">Search</a>
	</div>
	
	
	<!-- Page Contents -->
	<div class="pusher">
	  <div class="ui inverted vertical masthead center aligned segment">
	
	    <div class="ui container">
	      <div class="ui large secondary inverted pointing menu">
	        <a class="toc item">
	          <i class="sidebar icon"></i>
	        </a>
	        <a href="" class="active item">Home</a>

	        <div class="ui pointing dropdown link item">
				<span class="text">Clubs</span>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="header">Categories</div>
					<a class="item">sports</a>
					<a class="item">art</a>
					<a class="item">study</a>
					<a class="item">contest</a>
					<div class="divider"></div>
					<div class="header">Register</div>
					<a class="item">new</a>
					<a class="item">edit</a>
				</div>
			</div>
	        <div class="right item">
	        <div class="ui search">
  <div class="ui icon input">
    <input class="prompt" type="text" placeholder="Search Clubs..." value="">
    <i class="search icon"></i>
  </div>
  <div class="results"></div>
</div>
	        </div>
	      </div>
	    </div>
	    
	    <br><br><br>
	  
	  <div class="ui link cards">
  <div class="card">
    <div class="image">
      <img src="./image/sample_image.png">
    </div>
    <div class="content">
      <div class="header">하눌신폭</div>
      <div class="meta">
        <a>Coding</a>
      </div>
      <div class="description">
       	동아리 설명 ....
      </div>
    </div>
    <div class="extra content">
        <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
      <span>
        <i class="user icon"></i>
        	50 people join
      </span>
    </div>
  </div>
  <div class="card">
    <div class="image">
      <img src="./image/sample_image.png">
    </div>
    <div class="content">
      <div class="header">힐링멘토링</div>
      <div class="meta">
        <span class="date">Mentor</span>
      </div>
      <div class="description">
    	동아리 설명...
      </div>
    </div>
    <div class="extra content">
        <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
      <span>
        <i class="user icon"></i>
        49 people join
      </span>
    </div>
  </div>
  <div class="card">
    <div class="image">
      <img src="./image/sample_image.png">
    </div>
    <div class="content">
      <div class="header">Soccer Club</div>
      <div class="meta">
        <a>Soccer</a>
      </div>
      <div class="description">
     	동아리 설명...
      </div>
    </div>
    <div class="extra content">
       <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
      <span>
        <i class="user icon"></i>
        151 people join
      </span>
    </div>
  </div>
</div>

</body>
</html>