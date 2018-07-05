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
	        <form action="" method="">
	            <div class="login_group">    
	                <h1 class="content">[인턴(비직장인 회원) 회원가입]</h1>
	                <!-- 아이디 입력 -->
	                <div>
	                <div class="joinForm">아이디 </div>
	                <input type="text" placeholder="아이디 (10자 이상,영소문자+숫자로 구성) 입력"/>
	                <span class="warn">중복된 아이디 입니다.</span></div>
	                
					<!-- 비밀번호 -->
					<div>
	                <div class="joinForm">비밀번호</div>  
	                <input type="password" placeholder="비밀번호 8자 이상 입력">
	                <span class="warn">비밀번호를 8자 이상 입력해 주세요</span></div>
	                <!-- 비밀번호 확인 -->
	                <div>
	                <div class="joinForm">비밀번호 확인</div>
	                <input type="password" placeholder="비밀번호 확인 입력">
	                <span class="warn">비밀번호를 확인 해 주세요 </span></div>
	                <!-- 이메일 -->
	                <div>
	                <div class="joinForm">이메일</div>
	                <input type="text" placeholder="이메일 입력">
	                <span class="warn">올바른 이메일 형식이 아닙니다.</span></div>
	                <!-- 성 -->
	                <div>
		                <div class="joinForm">성씨 입력</div>
		                <input type="text" placeholder="성씨입력">
		           		<div><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
		                <div><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
	               </div>
	               
				</div>
	            <div class="btn_group">
	                <button class="join_btn">인턴(비직장인 회원) 회원가입</button>
	            </div>
	        </form>
    	</div>
	</body>
	<script>
	</script>
</html>