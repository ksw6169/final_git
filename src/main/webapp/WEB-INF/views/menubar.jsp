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
	        body { padding-top: 70px; }
	        img { margin-left: 0px; width: 70px; height: 40px; }
	        .navbar-fix { background-color: #121F27; border-color: white; min-height: 70px; }
	        .navbar-brand { margin-right: 25px; }
	        .menu a { font-family: "bareun"; text-align: center; color: white; margin-right: 25px; color: white; }
	        .sub_menu { margin-right: 30px; margin-top: 10px; }
	        .sub_menu_item a { font-family: "fallM"; margin-right: 5px; font-size: 12px; }
	        .nav.navbar-nav li a { color: white; }
	        .nav.navbar-nav li a:hover { color: #FF8000; background-color: #121F27; }
	        #logout_btn, #req_btn, #mlist_btn, #mypage_btn { display: none; }
	    	
	    	/* 쪽지 알림용 툴팁*/    
	    	#tooltip{display:none; }
			[data-tooltip-text]{position:relative; text-align:center; }
			[data-tooltip-text]:after{text-align:center; -webkit-transition:bottom .3s ease-in-out,opacity .3s ease-in-out; -moz-transition:bottom .3s ease-in-out,opacity .3s ease-in-out; transition:bottom .3s ease-in-out,opacity .3s ease-in-out; background-color:#FF8000; -webkit-box-shadow:0 0 3px 1px rgba(50,50,50,.4); -moz-box-shadow:0 0 3px 1px rgba(50,50,50,.4); box-shadow:0 0 3px 1px rgba(50,50,50,.4); -webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; color:#FFF; font-family:bareun; font-size:12px; margin-bottom:10px; padding:7px 12px; position:absolute; width:auto; min-width:50px; max-width:300px; word-wrap:break-word; z-index:9999; content:attr(data-tooltip-text); top:100%; left:5px; opacity:1; }
		</style>
	</head>
	<body>
    	<div class="container-fluid"> 
	        <header>
	            <!-- navigation bar -->
	            <!-- <nav class="navbar navbar-default navbar-fixed-top" role="navigation"> -->
	            <nav class="navbar navbar-fix navbar-fixed-top" role="navigation" id="navbar-scroll">
	                <!-- navbar-header: mobile size에서 메뉴1 ~ 4 부분을 icon으로 바꿈 -->
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
	                      <span class="sr-only">Toggle navigation</span>
	                      <span class="icon-bar"></span>
	                      <span class="icon-bar"></span>
	                      <span class="icon-bar"></span>
	                    </button>
	                    <a class="navbar-brand" href="./"><img src="./resources/image/logo.png"/></a>
	                </div>
	                <div class="collapse navbar-collapse navbar-left navbar-ex1-collapse">
	                    <ul class="nav navbar-nav">
	                      <li class="menu"><a href="./pageMove?page=kimSayList">김대리의<br>한마디</a></li>
	                      <li class="menu"><a href="./pageMove?page=qnaList">모르면<br>물어봐</a></li>
	                      <li class="menu"><a href="./pageMove?page=howComList">너의<br>직장은?</a></li>
	                      <li class="menu"><a href="./pageMove?page=noticeList">공지<br>합니다</a></li>
	                    </ul>
	                </div>
	                <div class="navbar-right sub_menu">
	                    <ul class="nav navbar-nav">
	                      <li id="login_btn" class="sub_menu_item"><a href="./loginForm">로그인</a></li>
	                      <li id="join_btn" class="sub_menu_item"><a href="./joinForm">회원가입</a></li>
	                      <li id="logout_btn" class="sub_menu_item"><a href="./logout">로그아웃</a></li>
	                      <li id="req_btn" class="sub_menu_item"><a href="./pageMove?page=reqList">인증신청관리</a></li>
	                      <li id="mypage_btn" class="sub_menu_item"><a href="./pageMove?page=checkPW">마이페이지</a></li>
	                      <li id="mlist_btn" class="sub_menu_item"><a href="./pageMove?page=getMlist">쪽지함</a></li>
	                    </ul>
	                </div>
	            </nav>
        	</header>
    	</div>
	</body>
	<script>
		var loginId = "${sessionScope.loginId}";
		var member_div = "${sessionScope.member_div}";
		var msgCnt;
		
		$(document).ready(function() {
	    	// 로그인 여부, 권한에 따라 메뉴바에서 보여주는 내용을 다르게 만듦
	    	if(loginId == "") {
	    		$("#login_btn").css("display", "inline-block");
	        	$("#join_btn").css("display", "inline-block");
	        	$("#logout_btn").css("display", "none");
	        	$("#req_btn").css("display", "none");
	        	$("#mypage_btn").css("display", "none");
	        	$("#mlist_btn").css("display", "none");
	    	} else if(member_div == "인턴" || member_div == "대리"){
	    		messageCount();
	        	$("#logout_btn").css("display", "inline-block");
	        	$("#mypage_btn").css("display", "inline-block");
	        	$("#mlist_btn").css("display", "inline-block");
	    		$("#login_btn").css("display", "none");
	        	$("#join_btn").css("display", "none");
	        	$("#req_btn").css("display", "none");
	    	} else if(member_div == "관리자") {
	    		messageCount();
	        	$("#logout_btn").css("display", "inline-block");
	        	$("#req_btn").css("display", "inline-block");
	        	$("#mlist_btn").css("display", "inline-block");
	    		$("#login_btn").css("display", "none");
	        	$("#join_btn").css("display", "none");
	        	$("#mypage_btn").css("display", "none");
	    	}
		});

		/* 쪽지 개수 받아서 tooltip 출력(toggle X) */ 
		function messageCount() {
			$.ajax({
				dataType : "json",
				type : "post",
				url : "./messageCount",
				data : {
					id : loginId
				},
				success : function(data) {
					msgCnt = data.msgCnt;
					
					if(msgCnt > 0) {
						$("#mlist_btn").attr("data-tooltip-text", "쪽지 "+msgCnt);
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>
</html>