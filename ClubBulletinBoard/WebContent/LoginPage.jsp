<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login Page</title>
  
  <link rel="stylesheet" type="text/css" href="./semantic/semantic.min.css">
  <script
    src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  <script src="./semantic/semantic.min.js"></script>
  

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
  $(document)
    .ready(function() {
      $('#login-form')
        .form({
          fields: {
            email: {
              identifier  : 'email',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your e-mail'
                },
                {
                  type   : 'email',
                  prompt : 'Please enter a valid e-mail'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[6]',
                  prompt : 'Your password must be at least 6 characters'
                }
              ]
            }
          }
        })
      ;
      
      $("#signUp")
      	.click(function(){
      		$('.ui.modal')
      			.modal('show')
      		;
      })
      ;
      
      $('#sign-up-form')
      .form({
        fields: {
          name: {
            identifier: 'name',
            rules: [
              {
                type   : 'empty',
                prompt : 'Please enter your name'
              }
            ]
          },
          email: {
            identifier  : 'email',
            rules: [
              {
                type   : 'empty',
                prompt : 'Please enter your e-mail'
              },
              {
                type   : 'email',
                prompt : 'Please enter a valid e-mail'
              }
            ]
          },
          username: {
            identifier: 'username',
            rules: [
              {
                type   : 'empty',
                prompt : 'Please enter a username'
              }
            ]
          },
          password: {
            identifier: 'password',
            rules: [
              {
                type   : 'empty',
                prompt : 'Please enter a password'
              },
              {
                type   : 'minLength[6]',
                prompt : 'Your password must be at least {ruleValue} characters'
              }
            ]
          }         
        }
      })
    ;

    })
  ;
  </script>
</head>
<body>

	<div class="ui middle aligned center aligned grid">
	  <div class="column">
	    <h2 class="ui teal image header">
	      <img src="./image/sample_image.png" class="image">
	      <div class="content">
	        Log-in to your account
	      </div>
	    </h2>
	    <form id="login-form" class="ui large form" action="./testLogin.jsp">
	      <div class="ui stacked segment">
	        <div class="field">
	          <div class="ui left icon input">
	            <i class="user icon"></i>
	            <input type="text" name="email" placeholder="E-mail address">
	          </div>
	        </div>
	        <div class="field">
	          <div class="ui left icon input">
	            <i class="lock icon"></i>
	            <input type="password" name="password" placeholder="Password">
	          </div>
	        </div>
	        <div class="ui fluid large teal submit button">Login</div>
	      </div>
	
	      <div class="ui error message"></div>
	
	    </form>
	    
	    <div class="ui horizontal divider">
	    	Or
	  	</div>
	
	    <div class="ui message">
	      <button id="signUp" class="ui teal button">Sign Up</button>
	    </div>
	  </div>
	</div>
	
	<!-- sign up modal -->
	<div class="ui modal">
		<form id="sign-up-form" class="ui form segment" action="./SignUp.jsp">
		  <p>Tell Us About Yourself</p>
		  <div class="two fields">
		    <div class="field">
		      <label>Name</label>
		      <input placeholder="First Name" name="name" type="text">
		    </div>
		    <div class="field">
		      <label>E-mail</label>
		      <input placeholder="E-mail address" name="email" type="text">
		    </div>
		  </div>
		  <div class="two fields">
		    <div class="field">
		      <label>Username</label>
		      <input placeholder="Username" name="userName" type="text">
		    </div>
		    <div class="field">
		      <label>Password</label>
		      <input type="password" name="password">
		    </div>
		  </div>
		  <div class="ui primary submit button">Submit</div>
		  <div class="ui error message"></div>
		</form>
	</div>

</body>
</html>