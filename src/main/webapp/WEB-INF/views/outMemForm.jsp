<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    
   	 	<title>bootstrap</title>

    	<!-- Bootstrap -->
    	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/kfonts2.css" rel="stylesheet">
    	<link href="./resources/css/custom.css" rel="stylesheet">
      
    <style>
        body { padding-top: 70px; text-align: center;}
        
        .container {
            padding-top: 70px;
            width: 435px;
            
        }
        .content {
            font-family: "bareun";
            text-align: center;
            margin-bottom: 70px;
        }
        input[type='text']{
            font-size:13px;
            padding:10px;
            width: 400px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            padding-left: 20px;
        	font-family: fallM;
        }
        #wrong{
        	text-align: left;
        	color: red;
        	font-family: bareun;
        }
        button {
			width: 150px;
            height: 50px;
            font-size: 16px;
            margin-left: 20px;
            margin-top: 50px;
            border: 0px;
            background-color: #121F27;
            color: white;
            font-family: "bareun";
		}
		.textbox{
			font-family: fallM;
			font-size: 15px;
		}
		.bord{
			font-family: fallB;
		}
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp"/>
		
		<div class="container">
	        <h1 class="content">회원 탈퇴</h1>
	            <div class="text_box">
	                <span class="bord">정말 탈퇴를 원하시나요?</span><br/>
	                회원 탈퇴를 원하시면, 로그인한 ID를 입력하고<br/>
	                회원탈퇴 버튼을 눌러주세요.
	            </div>
	            <div class="input">
		            <input type="text" placeholder="ID를 입력해주세요."/>
                    <div id="wrong">
                        *ID를 잘못 입력하셨습니다.
                    </div>
                </div>
                <div class="btn">
                	<button>회원 탈퇴</button>
                	<button>취소</button>
                </div>
    	</div>
	</body>
	<script>
	</script>
</html>