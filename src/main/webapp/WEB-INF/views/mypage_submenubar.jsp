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
        /* Custom navigation bar */
        .navbar-fix { background-color: #E4EEF0; min-height: 70px; }
        .navbar.navbar-fix { min-height: 50px; }
        button { width: 120px; height: 40px; background-color: #121F27; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block;              font-size: 12px; margin-right: 5px; }    
        button:hover { background-color: #FF8000; }
        #page_name { width: 120px; height: 40px; line-height: 40px; display: inline-block; vertical-align: middle; color:#121f27; font-family: "fallB"; text-align: center; font-size: 20px; 
                    margin-right: 15px; }
        .button_group { display: inline-block; }
    </style>
	</head>
	<body>
	    <div class="container"> 
	        <nav class="navbar navbar-fix navbar-fixed-top" role="navigation" id="navbar-scroll">
	            <div class="container">
	                <div class="submenubar_contents">
	                    <div id="page_name">마이페이지</div>
	                    <div class="button_group">
	                        <button class="navbar-btn">개인정보 수정</button>
	                        <button class="navbar-btn">회사정보 수정</button>
	                        <button class="navbar-btn">내가 쓴 글 보기</button>
	                        <button class="navbar-btn">내가 쓴 댓글 보기</button>
	                        <button class="navbar-btn">회원 탈퇴</button>
	                    </div>
	                </div>
	            </div>
	        </nav>
    	</div>	
	</body>
	<script>
	</script>
</html>