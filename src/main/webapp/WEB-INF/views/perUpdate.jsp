<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
		
			/* submenubar css */
			.submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0}
			.submenubar_header{font-family:fallM;margin-left:40px;width:150px;height:50px;display:inline-block;margin-top:30px;float:left;}
			td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:10px;margin-left:5px;}
			.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:3%};
			
	        body {padding-top: 70px;}
	        .content {font-family: "bareun"; margin-bottom: 50px; text-align: center;}
	          font-size: 14px; margin: 5px 0; float:left;border: 0px;text-align: center;padding-top: 15px;}
	        input[type='text'], input[type='password'] {font-size:13px;padding:10px;width: 500px;height: 50px;
	            line-height: 40px; outline:none;margin: 5px 0;display: inline;padding-left: 20px;margin-left: 15px;
	            font-family: "bareun";}
	        input{font-family: "NanumM";}
	        /* add */
	        .center-block{ width: 650px;}
	        #group{background: black; color: white; height: 15px; width: 150px;}
	        /* 비밀번호 확인 */
	        .warn{ font-family: "bareun"; margin-left: 135px; display: none; }
	        #blink{height: 1px; background-color: white; border-color: white; width: 150px;}
	        /* 성 밑에 설명 */
	        #info{font-family: "bareun"; margin-left: 140px;}
	        /* 버튼 */
	        #btnC{text-align: center;}
	        
	         .container {
	        	margin-top: 150px;
	        	margin-bottom: 50px;
	            padding-top: 25px;
	            padding-bottom: 25px;
	            background: #E4EEF0;
	        }
	        
	        #updateForm_id {
	        	background-color: gray;
	        	color: white;
	        }
	        
			/* submenuBar 링크 글자 색상 */
			.submenubar_button a{ color: white;}
			.submenubar_button_last a{color: white;}
			.submenubar_button a:hover{color: #FF8000; background-color: #121F27;text-decoration: none;}
			.submenubar_button_last a:hover{color: #FF8000; background-color: #121F27; text-decoration: none;}
			
			.inputHeader {
	        	width: 100%;
				height: 50px;
	        	line-height: 50px;
	        	font-family: "bareun";
	            background: #121F27;
				margin-top: 5px;
				color: white;
				text-align: center;
				font-size: 13px;
				padding: 0px;
				margin-left: 10px;
	        }
	        
	        .inputTag {
				width: 100%;
				height: 50px;
	        	line-height: 50px;
	        	font-family: "bareun";
	            background: white;
	            border: 0px;
	            outline:none;
				margin-top: 5px;
				color: black;
				text-align: center;
				font-size: 13px;
				padding: 0px;
				margin-left: -10px;
	        }

	        #mUpdate {
	            width: 100%;
	            height: 50px;
	            font-size: 16px;
	            border: 0px;
	            background-color: #FF8000;
	            color: white;
	            font-family: "bareun";
	            margin-top: 50px;
	            margin-bottom: 20px;
	        }
	        
	        .comment{
	        	font-family: "bareun";
	        	text-align: left;
	            font-size: 11px;
	            margin-top: 10px;
	        }
	        
		</style>
	</head>

	<body>
		<jsp:include page="menubar.jsp"/>
		
		<!-- 서브 메뉴바 -->
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">마이페이지</td>
	                </tr>
	            </table>
	        </div>
           <span class="submenubar_button_last"><a href="./pageMove?page=outMemForm">회원탈퇴</a></span>
           <span class="submenubar_button"><a href="./pageMove?page=myReplyList">내가 쓴 댓글 보기</a></span>
           <span class="submenubar_button"><a href="./pageMove?page=myWriteList">내가 쓴 글 보기</a></span>
           <span id="companyupdate_btn" class="submenubar_button"></span>
           <span class="submenubar_button"><a href="./perUpdateForm">개인정보 수정</a></span>
	    </div>
		
		<!-- 개인정보 수정 페이지 -->
	    <div class="container">
	    	<form method="post">
				<div class="row">
					<div class="col-md-10 col-md-push-1">
						<div class="row">
							<div class="col-md-10 col-md-push-1"><h1 class="content">개인정보 수정</h1></div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">아이디</h3></div>
			               		<div class="col-md-push-1 col-md-7">
			               			<input id="updateForm_id" class="inputTag" readonly="readonly" value="${member.member_id}" type="text" />
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">새 비밀번호</h3></div>
				               	<div class="col-md-push-1 col-md-7">
				               		<input id="pw" class="inputTag" name="pw" type="password" placeholder="비밀번호 입력" />
		                			<span id="pwChkMsg" class="warn">　</span>
		                		</div>
	                		</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">새 비밀번호 확인</h3></div>
				               	<div class="col-md-push-1 col-md-7">
				               		<input id="pwChk" class="inputTag" type="password" placeholder="비밀번호 확인 입력"/>
	                				<span id="pwChkReMsg" class="warn">　</span>
		                		</div>
	                		</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">이메일</h3></div>
				               	<div class="col-md-push-1 col-md-7">
				               		<input value="${member.member_email }" class="inputTag" name="email" type="text" placeholder="이메일 입력" onkeyup="emailCheck()" />
	                				<span id="userEmailMsg" class="warn">　</span>
		                		</div>
	                		</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">성씨 입력</h3></div>
				               	<div class="col-md-push-1 col-md-7">
				               		<input class="inputTag" name="family" type="text" placeholder="성씨입력" value="${member.member_family}" />
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
	                <button id="mUpdate">개인정보 수정</button>
	            </div>
	    	</form>
		</div>
	</body>
	<script>
		// 서브 메뉴바
		var member_div = "${sessionScope.member_div}";
			
		$(document).ready(function(){
			if(member_div == "인턴") {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate'>회사정보 등록</a>");
			} else {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate'>회사정보 수정</a>");
			}
		});
	
		// 비밀번호 길이 검사
		$("#pw").keyup(function(){
			if($("#pw").val() == ""){
				$("#pwChkMsg").css("display", "inline");
				$("#pwChkMsg").css("color", "red");
				$("#pwChkMsg").html("새 비밀번호 8~12자리 입력");
			} else if ($("#pw").val().length < 8 || $("#pw").val().length > 12){
				$("#pwChkMsg").css("display", "inline");
				$("#pwChkMsg").css("color", "red");
				$("#pwChkMsg").html("새 비밀번호 8~12자리 입력");
			} else if ($("#pw").val().length >= 8 || $("#pw").val().length <= 12){
				$("#pwChkMsg").css("display", "none");
			}
		});
		
		// 비밀번호 확인 중복 검사
		$("#pwChk").keyup(function(){
			if($("#pw").val() != $("#pwChk").val()){
				$("#pwChkReMsg").css("display", "inline");
				$("#pwChkReMsg").css("color", "red");
				$("#pwChkReMsg").html("비밀번호가 일치하지 않습니다.");
			} else {
				$("#pwChkReMsg").css("display", "none");
			}
		});
		
		// 개인정보 수정 버튼을 클릭했을 때, 
		$("#mUpdate").click(function(){
			if($("#pw").val() == "" || $("#pw").val().length < 8 || $("#pw").val().length > 12){
				alert("새 비밀번호를 다시 입력해주세요.");
				$("#pw").focus();
			} else if($("#pw").val() != $("#pwChk").val()) {
				alert("새 비밀번호 확인을 다시 입력해주세요.");
				$("#pwChk").focus();
			} else {
				alert("개인정보 수정이 완료되었습니다.");
				$("form").attr("action", "perUpdate");
			}
		});
	</script>
</html>