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
        .btn-lg.btn-default,.content{font-family:bareun;}
        .content{text-align:center;margin-bottom:50px;}
        .btn-lg.btn-default{color:#fff;background:#121F27;border:0;height:100px;}
        .loginBackground{padding-top:25px;margin-top:50px;background:#E4EEF0;}
        input[type=text],input[type=password]{font-size:13px;padding:10px;width:100%;height:50px;line-height:40px;outline:0;margin:5px 0;text-align:center;}
        .join_btn,.login_btn{width:100%;height:50px;font-size:16px;margin:5px 0 0;border:0;color:#fff;font-family:bareun;}
        .login_btn{background-color:#121F27;}
        .join_btn{background-color:#FF8000;}
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp"/>
	
		<div class="container">
			<div class="row">
				<div class="loginBackground col-md-10 col-md-push-1 center-block">
					<form action="./login" method="POST">
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
	            		<div class="col-md-6 col-md-push-3 center-block"><button class="join_btn" style="background: #C7402D; font-weight: 100;" data-toggle="modal" data-target="#myModal">새 비밀번호 설정</button></div>
					</div>
	            	<div class="row">
	            		<div class="col-md-6 col-md-push-3 center-block"><button class="join_btn" onclick="joinMove('iJoinForm')">인턴(비직장인 회원) 회원가입</button></div>
					</div>
					<div class="row" style="margin-bottom: 50px;">
	            		<div class="col-md-6 col-md-push-3 center-block"><button class="join_btn" onclick="joinMove('dJoinForm')">대리(직장인 회원) 회원가입</button></div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					        <h4 class="modal-title" id="myModalLabel" style="font-family: bareun; padding-left: 10px;">새 비밀번호 설정</h4>
					      </div>
					      <div class="modal-body">
					      	<div style="width: 100%; height: 80px;">
						      	<input class="form-control" id="find_id" placeholder="아이디를 입력해주세요." tabindex="-1" style="display:inline-block; width:100%; height: 50%; margin-bottom: 10px;"/>
						      	<input class="form-control" id="find_email" placeholder="회원가입 시 입력한 이메일을 입력해주세요." style="display:inline-block; width:100%; height: 50%; "/>
						        <!-- inputdefault -->
					      	</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: bareun;">닫기</button>
					        <button type="button" class="btn btn-primary" style="background: #C7402D; border: 0px; font-family: bareun;" onclick="findPw()">새 비밀번호 전송</button>
					      </div>
					    </div> <!-- 모달 콘텐츠 -->
					  </div> <!-- 모달 다이얼로그 -->
					</div> <!-- 모달 전체 윈도우 -->
				</div>
			</div>
    	</div>
	</body>
	<script>
		var msg = "${msg}";	
		var idReg = /^[A-Za-z0-9+]{5,20}$/;
		var emailChk = false;
		
		if(msg != "") {
			alert(msg);
		}
		
		$(document).ready(function(){
			$("input[name='id']").focus();	
		}); 
		
		// 로그인
		function login() {
			var id = $("input[name='id']").val();
			var pw = $("input[name='pw']").val();
			
			/* if(id == "" || pw == "") {
				alert("ID와 비밀번호를 입력해주세요.");	
			} else {
				$("form").attr("action", "./login");	
			} */
		}
		
		// 회원가입 페이지 이동
		function joinMove(page) {
			location.href = "./"+page;
		}
		
		// 비밀번호 찾기
		function findPw() {
			var find_id = $("#find_id").val();
			var find_email = $("#find_email").val();
			
			console.log("비밀번호 찾기 : "+find_id+"/"+find_email);
			console.log("아이디 길이 : "+find_id.length);
			
			emailCheck(find_email);
			
			/* 유효성 검사 */
			if(find_id == "") {		// ID와 이메일 입력 필드가 비어있을 경우,
				alert("ID를 입력해주세요.");
				$("#find_id").focus();
			} else if(!idReg.test(find_id)) {
				alert("ID를 5~20자리 영문과 숫자로 입력해주세요.");
				$("#find_id").focus();
			} else if(find_email == "") {
				alert("이메일을 입력해주세요.");
				$("#find_email").focus();
			} else if(emailChk == false) {
				alert("올바른 이메일 형식이 아닙니다. 다시 입력해주세요.");
				$("#find_email").focus();
			} else {
				$.ajax({
					type : "post",
					url : "./findPw",
					data : {
						find_id : find_id,
						find_email : find_email
					},
					dataType : "json",
					success : function(data) {
						alert(data.msg);
						if(data.msg == "입력한 이메일로 새로운 비밀번호를 전송하였습니다.") {
							$('#myModal').modal('hide');	// 모달 숨기기
						} else {
							$("#find_email").focus();
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			}
		}
		
		// 이메일 유효성 검사
		function emailCheck(find_email) {
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우		
			if(!exptext.test(find_email)) {	
				emailChk = false;
			} else {
				emailChk = true;
			}
		}
	</script>
</html>