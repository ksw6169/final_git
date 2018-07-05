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
        .file_btn{
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
    </style>
    <body>
   	 <jsp:include page="menubar.jsp" flush="false"/>
    
       <div class="col-md-4 col-md-offset-4">
	        <form action="" method="">
	            <div class="login_group">    
	                <h1 class="content">[대리(직장인 회원) 회원가입]</h1>
	                
	                <!-- 아이디 입력 -->       
	                <div class="joinForm">아이디</div>  
	                <input type="text" placeholder="아이디 (10자 이상,영소문자+숫자로 구성) 입력"/>
                    <div><span class="warn">중복된 아이디 입니다.</span></div>
					
					<!-- 비밀번호 -->
	                <div class="joinForm">비밀번호</div>  
	                <input type="password" placeholder="********">
	                <div><span class="warn">비밀번호를 8자 이상 입력해주세요</span></div>

	                <!-- 비밀번호 확인 -->
	                <div class="joinForm">비밀번호 확인</div>
	                <input type="password" placeholder="********">
	                <div><span class="warn">비밀번호와 같지 않습니다.</span></div>
                    
	                <div class="joinForm">이메일</div>
	                <input type="text" placeholder="이메일 입력">
	                <div><span class="warn">올바른 이메일 형식이 아닙니다.</span></div>
	                <!-- 성 -->
	                <div>
	                <div class="joinForm">성씨 입력</div>
	                <input type="text" placeholder="성씨입력">
		                <div><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
		                <div><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
	                </div>
	          
					<!-- 기업 -->
					<div class="login_group">
						<div class="company_join">기업</div>
						<!-- 기업명 -->
		                <div>
			            <div class="joinForm">기업명</div>
			            <input type="text" placeholder="기업명 입력"/>
			            </div>
			            <!-- 기업 캡쳐파일 부분 -->               
		                <div class="company_photo">기업 웹메일 <br/>사이트 캡쳐사진</div>
			            <input type="text" readonly>
						<!-- 파일 첨부 버튼 !! -->
			            <label for="upload" class=file_btn>파일 첨부</label>
			            <input type="file" id="upload"/>
			            <!-- 코멘트 -->     
			           	<div><b class="comment_red">*기업 웹메일 사이트에 로그인한 화면을 캡쳐하신 후 첨부해주세요.</b></div>
			            <div><b class="comment_red">*기업명과 첨부하신 로그인 화면은 가입 신청 승인 후 즉시 폐기되어</b></div>
			            <div><b class="comment_red">회원님의 익명을 절대 보장해 드립니다.</b></div>
                    </div>        
	            </div>
	            
	            <div class="btn_group">
	                <button class="join_btn">대리(직장인 회원) 회원가입</button>
	            </div>
	        </form>
    	</div>
    </body>
    <script>
	</script>
</html>