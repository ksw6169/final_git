<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
 	<!-- 반응형 웹 수정 완료(0715) -->
    <style>
        body { padding-top: 70px; }
        
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
        
        .loginBackground {
            padding-top: 25px;
            margin-top: 50px;
            background: #E4EEF0;
        }
        
        input[type='text'], input[type='password'] {
            font-size:13px;
            padding:10px;
            width: 100%;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            text-align: ce	nter;
        }
        
        .login_btn {
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 100%;
          height: 50px;
          font-size: 16px;
          margin: 5px 0 0 0px;
          border: 0px;
        }
        
        .join_btn {
            width: 100%;
            height: 50px;
            font-size: 16px;
            margin: 5px 0 0 0px;
            border: 0px;
            background-color: #FF8000;
            color: white;
            font-family: "bareun";
        }
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp"/>
	
		<div class="container">
			<div class="row">
				<div class="loginBackground col-md-10 col-md-push-1 center-block">
					<form action="" method="POST">
						<div class="row">
							<div class="col-md-4 col-md-push-4 center-block"><h1 class="content">로그인</h1></div>
						</div>
						<div class="row">
							<div class="col-md-6 col-md-push-3 center-block">
								<input name="id" type="text" placeholder="아이디를 입력해주세요."/>
							</div>
						</div>
						<div class="row">	
							<div class="col-md-6 col-md-push-3 center-block">
								<input name="pw" type="password" placeholder="비밀번호를 입력해주세요."/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-md-push-3 center-block"><button class="login_btn" onclick="login()">로그인</button></div>
						</div>
		            </form>
	            	<div class="row">
	            		<div class="col-md-6 col-md-push-3 center-block"><button class="join_btn" onclick="joinMove('iJoinForm')">인턴(비직장인 회원) 회원가입</button></div>
					</div>
					<div class="row" style="margin-bottom: 50px;">
	            		<div class="col-md-6 col-md-push-3 center-block"><button class="join_btn" onclick="joinMove('dJoinForm')">대리(직장인 회원) 회원가입</button></div>
					</div>
				</div>
			</div>
				
    	</div>
	</body>
	<script>
		var msg = "${msg}";	
		
		if(msg != "") {
			alert(msg);
		}
		
		function login() {
			var id = $("input[name='id']").val();
			var pw = $("input[name='pw']").val();

			if(id == "" || pw == "") {
				alert("ID와 비밀번호를 다시 입력해주세요.");	
			} else {
				$("form").attr("action", "./login");	
			}
		}
		
		// 회원가입 페이지 이동
		function joinMove(page) {
			location.href = "./"+page;
		}
	</script>
</html>