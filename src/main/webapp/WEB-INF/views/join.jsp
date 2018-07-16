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
		

		<!-- 반응형 완료(0715) -->
		<style>
			 body { padding-top: 70px; text-align: center;}
			 
			 .joinBackground {
           	 	padding-top: 25px;
           	 	padding-bottom: 50px;
           	 	margin-top: 50px;
            	background: #E4EEF0;
            	
			 }
			 
        	.content{
        		font-family: "bareun";
            	text-align: center;
            	width: 100%;
            	margin-bottom: 50px;
            }
        	
        	/* 버튼 */
        	.join_btn{width:100%; height: 100px; margin: 5px; background-color: #FF8000; color: white; font-family: "bareun"; border: 0; font-size: 25px;}
		</style>
	</head>
	<body>
		<jsp:include page="menubar.jsp"/>
	
		<div>
	        <div class="container">
	        	<div class="row">
	        		<div class="col-md-8 col-md-push-2 joinBackground">
	        			<div class="row">
	        				<div class="col-md-4 col-md-push-4 center-block"><h1 class="content">회원가입</h1></div>
	        			</div>
	        			<div class="row">
	        				<div class="col-md-8 col-md-push-2"><button class="join_btn" onclick="joinMove('iJoinForm')">인턴(비직장인 회원) 회원가입</button></div>
	        			</div>
	        			<div class="row">
	        				<div class="col-md-8 col-md-push-2"><button class="join_btn" onclick="joinMove('dJoinForm')">대리(직장인 회원) 회원가입</button></div>
	        			</div>
	        		</div>
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
		
		// 회원가입 페이지 이동
		function joinMove(page) {
			location.href = "./"+page;
		}
		
		
		
	</script>
</html>