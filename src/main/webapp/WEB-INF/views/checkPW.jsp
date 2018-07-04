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
            margin-bottom: 20px;
        }
        
        input[type='text'], input[type='password'] {
            font-size:13px;
            padding:10px;
            width: 435px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 50px 0 0 0;
            display: inline;
            float: right;
            padding-left: 20px;
            font-family: "bareun";
        
        }
        input[type='text']{
        	background-color: gray;
        	color: white;
        }
        .joinForm {
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 100px;
          height: 50px;
          font-size: 14px;
          margin: 50px 0 0 0;
          float:left;
          border: 0px;
          text-align: center;
          padding-top: 15px;
          

        }
        
        .chk_group {
            width: 550px;
        }
        
        .ckh_btn{
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
		
		</style>
	</head>
	<body>
	    <jsp:include page="menubar.jsp" flush="false"/>

		<div class="col-md-4 col-md-offset-4">
	        <form action="" method="">
	            <div class="chk_group">    
	                <h1 class="content">비밀번호 확인</h1>
	                <!-- 아이디 입력 -->
	                <div>
	                <div class="joinForm">아이디 </div>
	                <input type="text" value="아이디" readonly="readonly"/></div>
	                
					<!-- 비밀번호 -->
					<div>
	                <div class="joinForm">비밀번호</div>  
	                <input type="password" placeholder="비밀번호 입력"></div>
	                <!-- 비밀번호 확인 -->
	                <div>
	                <div class="joinForm">비밀번호 확인</div>
	                <input type="password" placeholder="비밀번호 확인 입력">
	                <span class="warn">비밀번호와 같지 않습니다. </span></div>
				</div>
	            <div class="btn_group">
	                <button class="ckh_btn">비밀번호 확인</button>
	            </div>
	        </form>
    	</div>
	</body>
	<script>
	</script>
</html>