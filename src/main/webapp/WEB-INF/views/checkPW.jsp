<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
      
		<style>
			body{padding-top:70px;}
			.container{margin-top:50px;margin-bottom:50px;padding-top:25px;padding-bottom:25px;background:#E4EEF0;}
			.inputHeader,.inputTag{line-height:50px;margin-top:5px;text-align:center;font-size:13px;padding:0;width:100%;height:50px;font-family:bareun;}
			.content{font-family:bareun;text-align:center;margin-bottom:50px;}
			.inputHeader{background:#121F27;color:#fff;margin-left:10px;}
			.inputTag{background:#fff;border:0;outline:0;color:#000;margin-left:-10px;}
			.chk_btn{width:100%;height:50px;font-size:16px;border:0;background-color:#FF8000;color:#fff;font-family:bareun;margin-top:50px;margin-bottom:20px;}
		</style>
	</head>
	<body>
	    <jsp:include page="menubar.jsp" flush="false"/>

		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-push-1">
					<div class="row">
						<div class="col-md-10 col-md-push-1"><h1 class="content">비밀번호 확인</h1></div>
					</div>
					
					<form method="post">
						<!-- ID -->
			            <div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">아이디</h3></div>
			               		<div class="col-md-push-1 col-md-7">
			               			<input id="userId" name="userId" class="inputTag" type="text" value="" readonly="readonly"/>
			            		</div>
			            	</div>
						</div>
			                
						<!-- 비밀번호 -->
			            <div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">비밀번호</h3></div>
				               	<div class="col-md-push-1 col-md-7">
				               		<input id="pw" name="userPw" class="inputTag" type="password" placeholder="비밀번호 8자 이상 입력"/>
		                		</div>
	                		</div>
						</div>    
			            
			            <!-- 비밀번호 확인 버튼 -->
			            <div class="col-md-6 col-md-push-3">
			                <button class="chk_btn">비밀번호 확인</button>
			            </div>
		            </form>
		    	</div>
	        </div>
       </div>
	</body>
	<script>
		var msg = "${msg}";	
		
		if(msg != "") {
			alert(msg);
		}
	
		var userId = "${sessionScope.loginId}";
		$(document).ready(function(){
			$("#userId").val(userId);
			$("#pw").focus();
		});
		
		$(".chk_btn").click(function(){					// 비밀번호 확인 버튼을 눌렀을 때,	
			$("form").attr("action", "checkPW");	// Controller로 checkPW 요청
		});
	</script>
</html>