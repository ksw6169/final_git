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
            padding-left: 20px;
            margin-left: 15px;
            font-family: "bareun";
        }
        .comment{
			font-size:11px;
   			font-family: "bareun";
        	margin-left: 115px;    	
        }
        .comment_red{
        	color : red;
			font-size:11px;
   			font-family: "bareun";
        	margin-left: 115px;     	
        }
        .company_join{
	        font-family: "bareun";
	        color: #fff;
	        background-color: #121F27;
	        width: 465px;
	        font-size: 20px;
	        height: 50px;
	        line-height: 50px;
	        margin: 10px 200px 10px 0;
         	float:left;
          	border: 0px;
          	text-align: center;
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
            width: 650px;
        }
        
        .join_btn {
            width: 300px;
            height: 50px;
            font-size: 16px;
            margin: 10px 0 0 0px;
            border: 0px;
            background-color: #FF8000;
            color: white;
            font-family: "bareun";
            margin-left: 75px;
            
        }
        .company_photo{
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 100px;
          height: 50px;
          font-size: 12px;
          margin: 5px 0;
          float:left;
          border: 0px white;
          text-align: center;
          padding-top: 10px;
        }
        
        .company_btn {
            font-family: "bareun";
         	color: #fff;
          	background-color: #121F27;
            float: right;
            width: 150px;
            height: 50px;
            margin: 5px 20px 0 0;
            border: 0;
            cursor: pointer;
            text-align: center;
            line-height: 50px;
        }
        
        .file_btn {
            font-family: "bareun";
         	color: #fff;
          	background-color: #121F27;
            float: right;
            width: 150px;
            height: 50px;
            margin: 5px 20px 0 0;
            border: 0;
            cursor: pointer;
            text-align: center;
            line-height: 50px;
        }
         .warn{
        	color : red;
        	font-family: "bareun";
        	margin-left: 115px;
        }
        input[type='file']{
        	position : absolute;
  			clip:rect(0,0,0,0);
  			overflow: hidden;
        	border:0;
        }
        
        div.col-md-4.col-md-offset-4 {
        	margin-top: 50px;
        }
        
        .custom_select {
			width: 100%; /* 원하는 너비설정 */ 
			height: 100%;
			font-family: "fallM"; /* 폰트 상속 */ 
			border-radius: 0px; /* iOS 둥근모서리 제거 */ 
			appearance: none;
			display: inline-block;
		  	float: left;
		  	color: white;
		  	background-color: #121F27;
		}
    </style>
    <body>
   	 <jsp:include page="menubar.jsp" flush="false"/>
    
       <div class="col-md-4 col-md-offset-4">
            <div class="login_group">    
                <h1 class="content">[대리(직장인 회원) 회원가입]</h1>
                
                <!-- 아이디 입력 -->       
                <div class="joinForm">아이디</div>  
                <input id="userId" name="id" type="text" placeholder="아이디 (10자 이상,영소문자+숫자로 구성) 입력" onkeyup="overlay()"/>
                   <div><span id="userIdMsg" class="warn">　</span></div>
				
				<!-- 비밀번호 -->
                <div class="joinForm">비밀번호</div>  
                <input id="userPw" name="pw" type="password" placeholder="********" onkeyup="lengthChk()">
                <div><span id="userPwMsg" class="warn">　</span></div>

                <!-- 비밀번호 확인 -->
                <div class="joinForm">비밀번호 확인</div>
                <input id="userPw_re" type="password" placeholder="********" onkeyup="pwOverlay()">
                <div><span id="userPwReMsg" class="warn">　</span></div>
                   
                <div class="joinForm">이메일</div>
                <input id="userEmail" name="email" type="text" placeholder="이메일 입력" onkeyup="emailCheck()">
                <div><span id="userEmailMsg" class="warn">　</span></div>
                <!-- 성 -->
                <div>
                <div class="joinForm">성씨 입력</div>
                <input id="userFamily" name="family" type="text" placeholder="성씨입력">
	                <div><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
	                <div><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
                </div>
          
				<!-- 기업 -->
				<div class="login_group">
					<div class="company_join">
						<select id="job_no" name="job_no" class="custom_select"> 
							<option value="1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경영, 사무, 금융, 보험직</option> 
							<option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연구직 및 공학기술직</option> 
							<option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교육, 법률, 사회복지, 경찰, 소방직 및 군인</option> 
							<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보건, 의료직</option>
							<option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예술, 디자인, 방송, 스포츠직</option>
							<option value="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;미용, 여행, 숙박, 음식, 경비, 청소직</option>
							<option value="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영업, 판매, 운전, 운송직</option>
							<option value="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;건설, 채굴직</option>
							<option value="9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;설치, 정비, 생산직</option>
							<option value="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;농림어업직</option>
						</select>
					</div>
					<!-- 기업명 -->
	                <div>
			            <div class="joinForm">기업명</div>
			            <input id="company" name="company" type="text" placeholder="기업명 입력"/>
			            <label class="company_btn">기업명 버튼</label>
	                	<div><span id="companyMsg" class="warn">　</span></div>
		            </div>
		            <!-- 기업 캡쳐파일 부분 -->               
	                <div class="company_photo">기업 웹메일 <br/>사이트 캡쳐사진</div>
		            <input id="fileName" type="text" placeholder="파일명" readonly>
					
					<!-- 파일 첨부 버튼-->
		            <label for="upload" class=file_btn>파일 첨부</label>
		            <form id="fileUpload" method="post" enctype="multipart/form-data">
		           		<input type="file" id="upload" name="file" onchange="fileUpload()" />
	           		</form>
		            
		            <!-- 코멘트 -->     
		           	<div><b class="comment_red">*기업 웹메일 사이트에 로그인한 화면을 캡쳐하신 후 첨부해주세요.</b></div>
		            <div><b class="comment_red">*기업명과 첨부하신 로그인 화면은 가입 신청 승인 후 즉시 폐기되어</b></div>
		            <div><b class="comment_red">회원님의 익명을 절대 보장해 드립니다.</b></div>
                   </div>        
            </div>
            
            <input id="member_div" name="member_div" type="hidden" value="인턴"/> <!-- 회사 인증을 거칠 때, 대리로 -->
            
            <div class="btn_group">
                <button id="joinBtn" class="join_btn">대리(직장인 회원) 회원가입</button>
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
			
			var formData = new FormData();
			
			// 전송할 데이터 담음
			formData.append("id", $("#userId").val());
			formData.append("pw", $("#userPw").val());
			formData.append("email", $("#userEmail").val());
			formData.append("family", $("#userFamily").val());
			formData.append("member_div", $("#member_div").val());
			formData.append("job_no", $("#job_no").val());
			formData.append("company", $("#company").val());
			formData.append("div", "대리 회원가입 요청");
			
			formData.append("file", $("#upload")[0].files[0]);
			
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
			} else if($("#company").val()=="") {
				$("#companyMsg").html("기업명을 입력해주세요.");
				$("#company").focus();
			} else{
				$.ajax({
					// contentType, processData : ajax 파일 업로드 시 반드시 필요
					contentType: false,	
					processData: false,
					
					type : "post",
					url : "./join",
					data : formData,
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
		
		// 기업 인증 사진 처리
		function fileUpload() {
			var fileValue = $("#upload").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명 
			$("#fileName").val(fileName);
		}
		
	</script>
</html>