<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
      
      	<!-- 반응형 완료(0715) -->
		<style>
			body { padding-top: 70px; }
	        .container{margin-top:50px;margin-bottom:50px;padding-top:25px;padding-bottom:25px;background:#E4EEF0}
	        .inputHeader,.inputTag{height:50px;line-height:50px;font-family:bareun;margin-top:5px;text-align:center;font-size:13px;padding:0;width:100%}
	        .content{font-family:bareun;text-align:center;margin-bottom:50px}
	        .inputHeader{background:#121F27;color:#fff;margin-left:10px}
	        .inputTag{background:#fff;border:0;outline:0;color:#000;margin-left:-10px}
	        .joinForm,.join_btn{height:50px;border:0;color:#fff;font-family:bareun}
	        .comment{font-family:bareun;text-align:left;font-size:11px;margin-top:10px}
	        .joinForm{background-color:#121F27;font-size:14px;margin:5px 0;text-align:center;padding-top:15px}
	        .join_btn{width:100%;font-size:16px;background-color:#FF8000;margin-top:50px;margin-bottom:20px}
	        .warn{color:red;font-family:bareun;text-align:left;margin-top:15px;margin-bottom:15px}
		</style>
	</head>
	<body>
	    <jsp:include page="menubar.jsp" flush="false"/>
		
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-push-1">
					<div class="row">
						<div class="col-md-10 col-md-push-1"><h1 class="content">[인턴(비직장인 회원) 회원가입]</h1></div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
		              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">아이디</h3></div>
		               		<div class="col-md-push-1 col-md-7">
		               			<input id="userId" class="inputTag" name="id" type="text" placeholder="아이디 (5 - 20자, 영문+숫자로 구성) 입력" onkeyup="overlay()" />
		            			<span id="userIdMsg" class="warn">　</span>	
		            		</div>
		            	</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">비밀번호</h3></div>
			               	<div class="col-md-push-1 col-md-7">
			               		<input id="userPw" class="inputTag" name="pw" type="password" placeholder="비밀번호 8 - 12자 입력" onkeyup="lengthChk()" />
	                			<span id="userPwMsg" class="warn">　</span>
	                		</div>
                		</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">비밀번호 확인</h3></div>
			               	<div class="col-md-push-1 col-md-7">
			               		<input id="userPw_re" class="inputTag" type="password" placeholder="********" onkeyup="pwOverlay()"/>
                				<span id="userPwReMsg" class="warn">　</span>
	                		</div>
                		</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">이메일</h3></div>
			               	<div class="col-md-push-1 col-md-7">
			               		<input id="userEmail" class="inputTag" name="email" type="text" placeholder="이메일 입력" onkeyup="emailCheck()" />
                				<span id="userEmailMsg" class="warn">　</span>
	                		</div>
                		</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">성씨 입력</h3></div>
			               	<div class="col-md-push-1 col-md-7">
			               		<input id="userFamily" class="inputTag" name="family" type="text" placeholder="성씨 입력" >
				           		<div class="row">
				           			<div class="col-md-12"><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
				           		</div>
				           		<div class="row">
				                	<div class="col-md-12"><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
				                </div>
	                		</div>
                		</div>
					</div>
					<input id="member_div" name="member_div" type="hidden" value="인턴"/>
				</div>
			</div>
			
			<div class="col-md-6 col-md-push-3">
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
						chk = false;
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
				emailChk = false;
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
				alert("ID를 입력해주세요.");
				$("#userId").focus();
			}else if(chk==false){
				chk = false;
				alert("ID가 중복되었습니다.");
				$("#userId").focus();
			}else if(!idReg.test(userId)){
				alert("ID를 5~20자리 영문과 숫자로 입력해주세요.");
				$("#userId").focus();
			}else if(userPw==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
			}else if($("#userPw").val().length < 8 || $("#userPw").val().length >12){
				alert("비밀번호를 8~12자리 입력해주세요.")
				$("#userPw").focus();
			}else if(userPw_re==""){		
				alert("비밀번호 확인을 입력해주세요.");
				$("#userPw_re").focus();
			}else if(userPw != userPw_re){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPw_re").focus();
			}else if($("#userEmail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
			}else if(emailChk==false){
				alert("올바른 이메일 형식이 아닙니다.");
				$("#userEmail").focus();
			} else if($("#userFamily").val()=="") {
				alert("성을 입력해주세요.");
				$("#userFamily").focus();
			} else if($("#userFamily").val().length > 20) {
				alert("성을 20자 이하로 입력해주세요.");
			} else{
				$.ajax({
					type : "post",
					url : "./join",
					data : {
						id : $("#userId").val(),
						pw : $("#userPw").val(),
						email : $("#userEmail").val(),
						family : $("#userFamily").val(),
						member_div : $("#member_div").val(),
						div: "인턴 회원가입 요청"
					},
					dataType : "json",
					success : function(data) {
						if(data.success > 0){
							alert("회원가입에 성공했습니다.");
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