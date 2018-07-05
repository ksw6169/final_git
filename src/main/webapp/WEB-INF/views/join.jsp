<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    
   	 	<title>bootstrap</title>

    	<!-- Bootstrap -->
    	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/kfonts2.css" rel="stylesheet">
    	<link href="./resources/css/custom.css" rel="stylesheet">
    	
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		

		<style>
			 body { padding-top: 70px; text-align: center;}
			 .container {
			 
	            padding-top: 70px;
	            padding-bottom: 25px;
        	}
        	.content{font-family: "bareun";
            	text-align: center;
            	margin-bottom: 50px;}
        	/* 버튼 */
        	.join_btn{width:500px; height: 100px; margin: 5px; background-color: #FF8000; color: white; font-family: "bareun"; border: 0; font-size: 25px;}

		</style>
	</head>
	<body>
		<jsp:include page="menubar.jsp"/>
	
		<div>
	        <div class="container col-md-4 col-md-offset-4">
	        	<h1 class="content">회원가입</h1>
	        	<div class="btn_set">
	        		<button class="join_btn" onclick="">인턴(비직장인 회원) 회원가입</button>
	            	<button class="join_btn" onclick="">대리(직장인 회원) 회원가입</button>
	        	</div>
	        </div>
    	</div>
	</body>
	<script>
		$(".join_btn").hover(function(){
			$(this).css("background-color", "#121F27");
		}, function(){
			$(this).css("background-color", "#FF8000");
		});
	</script>
</html>