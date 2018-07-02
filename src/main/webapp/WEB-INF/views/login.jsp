<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    
   	 	<title>bootstrap</title>

    	<!-- Bootstrap -->
    	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/kfonts2.css" rel="stylesheet">
    	<link href="./resources/css/custom.css" rel="stylesheet">
      
    <style>
        body { padding-top: 70px; }
        
        .container {
            padding-top: 25px;
            background: #E4EEF0;
        }
        
        .content {
            font-family: "bareun";
            text-align: center;
            margin-bottom: 50px;
        }
        
        .btn-lg.btn-default {
            font-family: "bareun";
            color: white;
            background: #121F27;
            border: 0px;
            height: 100px;
        }
        
        .clear {
            clear: both;
        }
        
        input[type='text'], input[type='password'] {
            font-size:13px;
            padding:10px;
            width: 350px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            display: inline;
            float: left;
            text-align: center;
        }
        
        .login_btn {
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 75px;
          height: 110px;
          font-size: 14px;
          margin: 5px 0 0 5px;
          border: 0px;
        }
        
        .login_group {
            width: 450px;
        }
        
        .join_btn {
            width: 430px;
            height: 50px;
            font-size: 16px;
            margin: 10px 0 0 0px;
            border: 0px;
            background-color: #FF8000;
            color: white;
            font-family: "bareun";
        }
        
    </style>
	</head>
	<body>
		<div class="col-md-4 col-md-offset-4">
	        <form>
	            <div class="login_group">    
	                <h1 class="content">로그인</h1>
	                <input type="text" placeholder="아이디를 입력해주세요.">
	                <input type="password" placeholder="비밀번호를 입력해주세요.">
	                <button class="login_btn">로그인</button>
	            </div>
	            <div class="btn_group">
	                <button class="join_btn">인턴(비직장인 회원) 회원가입</button>
	                <button class="join_btn">대리(직장인 회원) 회원가입</button>
	            </div>
	        </form>
    	</div>
	</body>
	<script>
	</script>
</html>