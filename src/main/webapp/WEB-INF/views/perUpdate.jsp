<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
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
        #pwchk{ font-family: "bareun"; color: red; margin-left: 115px;}
        #blink{height: 1px; background-color: white; border-color: white; width: 150px;}
        /* 성 밑에 설명 */
        #info{font-family: "bareun"; margin-left: 115px;}
        /* 버튼 */
        #mUpdate{font-family: "bareun";font-size:18; padding: 10px 60px; text-align: center; background-color: #FF8000; border: 0; color: white;}
        #btnC{text-align: center;}
		</style>
	</head>

	<body>
	<jsp:include page="menubar.jsp"/>
    <div class="col-md-4 col-md-offset-4">   
        <form action="#" method="post">
        	
			<div class="center-block">
			<h1 class="content">개인정보 수정</h1>
				<!-- 아이디 수정 -->
				
		        <div class="updateForm">아이디</div>
				<input type="text" readonly="readonly" value="아이디"/>

		       <!-- 비밀번호 수정 -->
		        <div class="updateForm">비밀번호</div>  
	            <input type="password" placeholder="비밀번호 입력">
	            
		        <!-- 비밀번호 확인 수정 -->
		        <div class="updateForm">비밀번호 확인</div>  
	            <input type="password" placeholder="비밀번호 입력">
	            <div><span id="pwchk">비밀번호가 같지 않습니다. </span></div>

		       <!--  이메일 수정 -->
		        <div class="updateForm">이메일</div>  
	            <input type="text" placeholder="이메일 입력">
	            
		        <!-- 성씨 수정 -->
		        <div class="updateForm">성씨 입력</div>  
	            <input type="text" placeholder="성씨 입력">
		        <div><span id="info">*입력한 성씨는 '김인턴, 박인턴'과 같은 호칭에 사용됩니다.</span></div>
		        <div><span id="info">*호칭은 본인 외 다른 사람들은 볼 수 없습니다.</span></div>
	        </div>
	        <br/>
		    <div id="btnC" class="center-block">
		    	<input id="mUpdate" type="button" value="개인정보 수정">
		    </div>
        </form>
    </div>
	</body>
	<script>
	</script>
</html>