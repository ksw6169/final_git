<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
      
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
            width: 435px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            display: inline;
            float: right;
            padding-left: 20px;
            font-family: "bareun";
        
        }
        .comment{
        	font-family: "bareun";
        	margin-left: 115px;
            font-size: 11px;
        }
        
        .joinForm {
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 100px;
          height: 50px;
          font-size: 14px;
          margin: 5px 0;
          float:left;
          border: 0px;
          text-align: center;
          padding-top: 15px;
        }
        
        .login_group {
            width: 550px;
        }
        
        .join_btn {
            width: 300px;
            height: 50px;
            font-size: 16px;
			margin: 30px 0 0 125px;
            border: 0px;
            background-color: #FF8000;
            color: white;
            font-family: "bareun";
        }
        .warn{
        	color : red;
        	font-family: "bareun";
        	margin-left: 115px;
        }

		div.col-md-4.col-md-offset-4 {
			margin-top: 50px;
		}

		</style>
	</head>
	<body>
	    <jsp:include page="menubar.jsp" flush="false"/>

		<div class="col-md-4 col-md-offset-4">
            <div class="login_group">    
                <h1 class="content">[인턴(비직장인 회원) 회원가입]</h1>
                <!-- 아이디 입력 -->
                <div>
                <div class="joinForm">아이디 </div>
                <input id="userId" name="id" type="text" placeholder="아이디 (10자 이상,영소문자+숫자로 구성) 입력" onkeyup="overlay()" />
                <span id="userIdMsg" class="warn">　</span></div>
                
				<!-- 비밀번호 -->
				<div>
                <div class="joinForm">비밀번호</div>  
                <input id="userPw" name="pw" type="password" placeholder="비밀번호 8자 이상 입력" onkeyup="lengthChk()" />
                <span id="userPwMsg" class="warn">　</span></div>
                <!-- 비밀번호 확인 -->
                <div>
                <div class="joinForm">비밀번호 확인</div>
                <input id="userPw_re" type="password" placeholder="비밀번호 확인 입력" onkeyup="pwOverlay()"/>
                <span id="userPwReMsg" class="warn">　</span></div>
                <!-- 이메일 -->
                <div>
                <div class="joinForm">이메일</div>
                <input id="userEmail" name="email" type="text" placeholder="이메일 입력" onkeyup="emailCheck()" />
                <span id="userEmailMsg" class="warn">　</span></div>
                <!-- 성 -->
                <div>
	                <div class="joinForm">성씨 입력</div>
	                <input id="userFamily" name="family" type="text" placeholder="성씨입력" >
	           		<div><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
	                <div><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
               </div>
			</div>
			
            <input id="member_div" name="member_div" type="hidden" value="인턴"/>
			
            <div class="btn_group">
                <button id="joinBtn" class="join_btn">인턴(비직장인 회원) 회원가입</button>
            </div>
    	</div>
	</body>
	<script>
		var chk = false;			// 아이디 중복값 체크
		var emailChk = false;	// 이메일 체크 변수
		
		// ID 중복 확인(onkeyup 이벤트)
		function overlay() {
			var userId = $("#userId").val();	// ID 입력값
			var msg = $("#userIdMsg");		// ID 중복 체크 결과를 담을 span 태그
			
			var idReg = /^[A-Za-z0-9+]{5,20}$/;
			$.ajax({
				type : "post",
				url : "./overlay",
				data : { id : userId },
				dataType : "json",
				success : function(data) {
					if(userId==""){
						msg.html("아이디 입력을 해주세요.");
						msg.css("color", "red");
					}else if(!idReg.test(userId)){
						msg.html("5~20자리 영문과 숫자만 가능합니다.");	// 이 부분 수정
						msg.css("color", "red");
					}else if(data.msg == "중복된 ID 입니다."){
						msg.html(data.msg);
						msg.css("color", "red");
					}else{
						msg.html("사용 가능한 아이디입니다.");
						msg.css("color", "green");
						chk = true;
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
		
		// 비밀번호 길이 체크
		function lengthChk(){
			var userPw = $("#userPw");
			var msg = $("#userPwMsg");
			
			if(userPw.val()==""){
				msg.html("비밀번호 8~12자리 입력");
				msg.css("color", "red");
			}else if(userPw.val().length < 8 || userPw.val().length >12){
				msg.html("비밀번호 8~12자리 입력");
				msg.css("color", "red");
			}else if(userPw.val().length >= 8 || userPw.val().length <=12){
				msg.html("사용 가능한 비밀번호입니다.");
				msg.css("color", "green");
			}
		}
		
		// 비밀번호 확인 체크
		function pwOverlay(){
				var userPw1 = $("#userPw");
			var userPw2 = $("#userPw_re");
			var msg = $("#userPwReMsg");
			if(userPw1.val() != userPw2.val()){
				msg.html("비밀번호가 맞지 않습니다.");
				msg.css("color", "red");
			}else if(userPw1.val() == userPw2.val()){
				msg.html("비밀번호가 맞습니다.");
				msg.css("color", "green");
			} 
		} 
		
		// 이메일 체크
		function emailCheck() {
			var email = $("#userEmail").val();
			var msg = $("#userEmailMsg");
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
			// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우		
			if(!exptext.test(email)) {	
				msg.html("이메일 형식이 올바르지 않습니다.");
				msg.css("color", "red");
			} else {
				msg.html("올바른 이메일 형식입니다.");
				msg.css("color", "green");
				emailChk = true;
			}
		}
		
		// 회원가입 버튼 클릭 시 포커스 처리
		$("#joinBtn").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			var userPw_re = $("#userPw_re").val();
			
			var idReg = /^[A-Za-z0-9+]{5,16}$/;
			
			if($("#userId").val()==""){
				$("#userIdMsg").html("아이디를 입력하세요.");
				$("#userId").focus();
			}else if(chk==false){
				$("#userIdMsg").html("아이디가 중복되었습니다.");
				$("#userId").focus();
			}else if(!idReg.test(userId)){
				$("#userIdMsg").html("5~20자리 영문과 숫자만 가능");
				$("#userId").focus();
			}else if(userPw==""){
				$("#userPwMsg").html("비밀번호를 입력하세요.");
				$("#userPw").focus();
			}else if($("#userPw").val().length < 8 || $("#userPw").val().length >12){
				$("#userPwMsg").html("비밀번호 8~12자리 입력");
				$("#userPw").focus();
			}else if(userPw_re==""){		
				$("#userPwReMsg").html("비밀번호를 입력하세요.");
				$("#userPw_re").focus();
			}else if(userPw != userPw_re){
				$("#userPwReMsg").html("비밀번호가 일치하지 않습니다.");
				$("#userPw_re").focus();
			}else if($("#userEmail").val()==""){
				$("#userEmailMsg").html("이메일을 입력하세요.");
				$("#userEmail").focus();
			}else if(emailChk==false){
				$("#userEmailMsg").html("올바른 이메일 형식이 아닙니다.");
				$("#userEmail").focus();
			} else if($("#userFamily").val()=="") {
				alert("성을 입력하세요.");
				$("#userFamily").focus();
			} else{
				$.ajax({
					type : "post",
					url : "./join",
					data : {
						id : $("#userId").val(),
						pw : $("#userPw").val(),
						email : $("#userEmail").val(),
						family : $("#userFamily").val(),
						member_div : $("#member_div").val()
					},
					dataType : "json",
					success : function(data) {
						if(data.success > 0){
							alert("회원가입이 완료되었습니다.");
							location.href="./";	
						}else{
							alert("회원가입에 실패했습니다.");
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			}
		});
		
		
	</script>
</html>