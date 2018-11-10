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
  <script src="./semantic/semantic.min.js"></script>

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
	      <div class="item">
	        <a class="ui button">Log in</a>
	      </div>
	      <div class="item">
	        <a class="ui primary button">Sign Up</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Sidebar Menu -->
	<div class="ui vertical inverted sidebar menu">
	  <a class="active item">Home</a>
	  <a class="item">Work</a>
	  <a class="item">Company</a>
	  <a class="item">Login</a>
	  <a class="item">Sign Up</a>
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
	        <a href="#Work" class="item">Work</a>
	        <a href="#Company" class="item">Company</a>
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
	          <a class="ui inverted button">Log in</a>
	          <a class="ui inverted button">Sign Up</a>
	        </div>
	      </div>
	    </div>
	
	    <div class="ui text container">
	      <h1 class="ui inverted header">
	        Gachon<br>Club Bulletin Board
	      </h1>
	      <h2>Find Your Clubs You Want</h2>
	      <div class="ui huge primary button">�ٷ� �����ϼ��� <i class="right arrow icon"></i></div>
	    </div>
	
	  </div>
	
	  <div id="Work" class="ui vertical stripe segment">
	    <div class="ui middle aligned stackable grid container">
	      <div class="row">
	        <div class="eight wide column">
	          <h3 class="ui header">��õ�� ���Ƹ��� �л����� ����</h3>
	          <p>��õ�� ���Ƹ����� ���� ���⼭ ����� ��ٸ��� �ֽ��ϴ�.<br>����, ��õ�� �л��� ���� ���Ƹ� ������ ���ϰ� �ֽ��ϴ�.<br>�ٷ� ���� ���⼭ ����� ���ϴ� �ٸ� �̷缼��.</p>
	          <h3 class="ui header">������ ���Ƹ��� �Ѵ���</h3>
	          <p>�����Ⱓ�� ����� ���Ƹ� ������, ���Ƹ� �̿ܿ� ����� �������� ����� �б� �Խ��ǿ��� ��� ������.<br>���� Gachon Club Bulletin Board������ �ֽ��� ���Ƹ� �������� �Ѵ��� �˾ƺ� �� �ֽ��ϴ�.</p>
	        </div>
	        <div class="six wide right floated column">
	          <img src="./image/sample_image.png" class="ui large bordered rounded image">
	        </div>
	      </div>
	      <div class="row">
	        <div class="center aligned column">
	          <a class="ui huge button">Find Your Clubs</a>
	        </div>
	      </div>
	    </div>
	  </div>
	
	
	  <div id="Company" class="ui vertical stripe quote segment">
	    <div class="ui equal width stackable internally celled grid">
	      <div class="center aligned row">
	        <div class="column">
	          <h3>"E.A.S.Y"</h3>
	          <p>���� �Խ����� ���� ���Ƹ��� ����� ã�� �̵��� ���ϴ�����</p>
	        </div>
	        <div class="column">
	          <h3>"��, ���� �������ݾ�! �� �б� �л����� ���� �η���"</h3>
	          <p>
	            <img src="./image/sample_image.png" class="ui avatar image"> <b>��ƹ���</b> �������� �������
	          </p>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- club categories -->
	  <div class="ui vertical stripe segment">
	    <div class="ui middle aligned stackable four column grid container">
	    	<div class="column">    	
	    		<a href="">
	    			<img class="ui circular medium image" src="./image/sample_image.png">
	    			<h3 class="ui center aligned header">sports</h3>
	    		</a>
    		</div>
	    	<div class="column">
	    		<a href="">
	    			<img class="ui circular medium image" src="./image/sample_image.png">
	    			<h3 class="ui center aligned header">art</h3>
	    		</a>	    		
	    	</div>
	    	<div class="column">	    		
	    		<a href="">
	    			<img class="ui circular medium image" src="./image/sample_image.png">
	    			<h3 class="ui center aligned header">study</h3>
	    		</a>	    		
	    	</div>
	    	<div class="column">	    		
	    		<a href="">
	    			<img class="ui circular medium image" src="./image/sample_image.png">
	    			<h3 class="ui center aligned header">contest</h3>
	    		</a>	    		
	    	</div>
	    </div>
	  </div>
	
	
	  <div class="ui inverted vertical footer segment">
	    <div class="ui container">
	      <div class="ui stackable inverted divided equal height stackable grid">
	        <div class="three wide column">
	          <h4 class="ui inverted header">About</h4>
	          <div class="ui inverted link list">
	            <a href="#" class="item">Contact Us</a>
	          </div>
	        </div>
	        <div class="three wide column">
	          <h4 class="ui inverted header">Services</h4>
	          <div class="ui inverted link list">
	            <a href="#" class="item">FAQ</a>
	            <a href="#" class="item">How To Access</a>
	          </div>
	        </div>	     
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>