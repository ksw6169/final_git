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
			.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:30px;float:left;}
			td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:10px;margin-left:5px;}
			.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:100px};
			
	        body {padding-top: 70px;}
	        .content {font-family: "bareun"; margin-bottom: 50px; text-align: center;}
	        .updateForm{font-family: "bareun"; color: #fff;background-color: #121F27; width: 100px;height: 50px;
	          font-size: 14px; margin: 5px 0; float:left;border: 0px;text-align: center;padding-top: 15px;}
	        input[type='text'], input[type='password'] {font-size:13px;padding:10px;width: 500px;height: 50px;
	            line-height: 40px; outline:none;margin: 5px 0;display: inline;padding-left: 20px;margin-left: 15px;
	            font-family: "bareun";}
	        input{font-family: "NanumM";}
	        /* add */
	        .center-block{ width: 650px;}
	        #group{background: black; color: white; height: 15px; width: 150px;}
	        /* 비밀번호 확인 */
	        #warn{ font-family: "bareun"; color: red; margin-left: 115px;}
	        #blink{height: 1px; background-color: white; border-color: white; width: 150px;}
	        /* 성 밑에 설명 */
	        #info{font-family: "bareun"; margin-left: 115px;}
	        /* 버튼 */
	        #mUpdate{font-family: "bareun";font-size:18; padding: 10px 60px; text-align: center; background-color: #FF8000; border: 0; color: white;}
	        #btnC{text-align: center;}
	        
	        div.col-md-4.col-md-offset-4 {
				margin-right: 50px;
	        	margin-top: 150px;
	        }
	        
		/* submenuBar 링크 글자 색상 */
		.submenubar_button a{ color: white;}
		.submenubar_button_last a{color: white;}
		.submenubar_button a:hover{color: #FF8000; background-color: #121F27;text-decoration: none;}
		.submenubar_button_last a:hover{color: #FF8000; background-color: #121F27; text-decoration: none;}
		</style>
	</head>

	<body>
		<jsp:include page="menubar.jsp"/>
		
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
           <span class="submenubar_button"><a href="./pageMove?page=companyUpdate">회사정보 수정</a></span>
           <span class="submenubar_button"><a href="./perUpdateForm">개인정보 수정</a></span>
	    </div>
		
		
	    <div class="col-md-4 col-md-offset-4">   
	        <form method="post">
				<div class="center-block">
				<h1 class="content">개인정보 수정</h1>
					<!-- 아이디 수정 -->
					
			        <div class="updateForm">아이디</div>
					<input type="text" readonly="readonly" value="${member.member_id}"/>
	
			       <!-- 비밀번호 수정 -->
			        <div class="updateForm">새 비밀번호</div>  
		            <input type="password" id="pw" placeholder="비밀번호 입력" name="pw">
		            
			        <!-- 비밀번호 확인 수정 -->
			        <div class="updateForm">새 비밀번호 확인</div>  
		            <input type="password" id="pwChk" placeholder="비밀번호 입력">
		            <div><span id="warn" >비밀번호가 같지 않습니다. </span></div>
	
			       <!--  이메일 수정 -->
			        <div class="updateForm">이메일</div>  
		            <input type="text" placeholder="이메일 입력" value="${member.member_email }" name="email">
		            
			        <!-- 성씨 수정 -->
			        <div class="updateForm">성씨 입력</div>  
		            <input type="text" placeholder="성씨 입력" value="${member.member_family }" name="family">
			        <div><span id="info">*입력한 성씨는 '김인턴, 박인턴'과 같은 호칭에 사용됩니다.</span></div>
			        <div><span id="info">*호칭은 본인 외 다른 사람들은 볼 수 없습니다.</span></div>
		        </div>
		        <br/>
			    <div id="btnC" class="center-block">
			    	<button id="mUpdate">개인정보 수정</button>
			    </div>
	        </form>
	    </div>
	</body>
	<script>
	$(document).ready(function(){
		$("#warn").hide();
	});
	
	$("#pwChk").keyup(function(){
		if($("#pw").val() != $("#pwChk").val()){
			$("#warn").show();
		}else{
			$("#warn").hide();
			console.log($("#warn"));
		}
		
		//console.log("pwChk");
	});
	
	$("#pw").keyup(function(){
		if($("#pw").val() != $("#pwChk").val()){
			$("#warn").show();
		}else{
			$("#warn").hide();
		}
	});
	
	$(".ckh_btn").click(function(){
		if($("#warn").css("display") == "none"){
			console.log("컨트롤러에 보냄");
			$("form").attr("action", "checkPW");
		}
	});
	
	$("#mUpdate").click(function(){
		if($("#warn").css("display") == "none"){
			console.log("컨트롤러에 보냄");
			$("form").attr("action", "perUpdate");
		}
	});
	</script>
</html>