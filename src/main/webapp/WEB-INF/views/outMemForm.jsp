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
        
        .div{
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
            margin: 5px 15px;
            padding-left: 20px;
        	font-family: fallM;
        }
        #wrong{
        	text-align: left;
        	padding-left: 20px;
        	color: red;
        	font-family: bareun;
        }
        .out_btn{
			width: 150px;
            height: 50px;
            margin-left: 20px;
            margin-right: 20px;
            border: 0px;
            background-color: #121F27;
            color: white;
            border-radius: 0px 0px 0px 0px;
		}
		.btn_group{
		 	font-size: 16px;
            margin-top: 50px;
            font-family: "bareun";
		}
		.textbox{
			font-family: fallM;
			font-size: 15px;
		}
		.bord{
			font-family: fallB;
		}
		.memOut_group{
			width: 520px;
			text-align: center;
			padding: 50px;
			background-color: #E5EDF0;
		}
		.a{
			margin-bottom: 20px;
		}
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp" flush="false"/>
		
		<div class="col-md-4 col-md-offset-4">
			<div class="memOut_group">
		    	<h1 class="content">회원 탈퇴</h1>
		        <span class="bord">정말 탈퇴를 원하시나요?</span><br/>
		        회원 탈퇴를 원하시면, 로그인한 ID를 입력하고<br/>
		        회원탈퇴 버튼을 눌러주세요.
		        <div class="a"></div>
		        <input type="text" placeholder="ID를 입력해주세요."/>
	            <div id="wrong">
	                *ID를 잘못 입력하셨습니다.
	            </div>
	            <div class="btn_group">
	            	<button class="out_btn">회원 탈퇴</button>
	                <button class="out_btn">취소</button>
	            </div>
            </div>
        </div>
	</body>
	<script>

	
	</script>
</html>