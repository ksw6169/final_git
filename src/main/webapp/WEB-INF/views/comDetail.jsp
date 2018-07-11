<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
			function divCheck(){
		    	var loginId = "${sessionScope.loginId}";
		    	var loginDiv ="${sessionScope.member_div}";
		
		    	if(loginId != null && loginDiv == "인턴"){
		    		alert("해당 게시판 권한이 없습니다.");
		    		location.href=document.referrer;
		    	}
		    }
		</script>
		
		<style>
		
			/* submenubar css */
			.submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0;}
			.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:30px;float:left;}
			td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:10px;margin-left:5px;}
			.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:100px;}
			
	        body { padding-top: 70px; }
	        
	        .container {
	        	margin-top: 150px;
	            text-align: center;
	        }
	        
			.eval {
				text-align: center;
	            width: 650px;
			}
			
			.row_title {
				width: 650px;
				height: 50px;
				line-height: 50px;
				font-family: "fallB";
				font-size: 20px;
				background: #E4EEF0;
				border: 1px solid black;
				text-align: left;
	            padding-left: 30px;
	            float: left;
				display: inline-block;
			}
			
			.row {
				width: 650px;
				height: 50px;
				line-height: 50px;
				font-family: "fallB";
				font-size: 20px;
				background: #E4EEF0;
	            float: left;
				display: inline-block;
	            text-align: center;
			}
			
			
			.row_header {
				width: 150px;
				height: 50px;
				line-height: 50px;
				text-align: center;
	            background: #E4EEF0;
				font-family: "fallB";
				display: inline-block;
				border: 1px solid black;
				float: left;
				font-size: 14px;
			}
			
			.row_body {
				width: 500px;
				height: 50px;
				line-height: 50px;
				text-align: center;
				background: white;
				font-family: "fallM";
				display: inline-block;
				border: 1px solid black;
				float: left;
				font-size: 14px;
			}
			
			.star_grade {
				height: 15px;
				margin-top: 15px;
			}
   		</style>
  </head>
<body>
	<jsp:include page="menubar.jsp" flush="false"/>

	<div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">기업평가</td>
                </tr>
            </table>
        </div>
        <span class="submenubar_button_last" onclick="location.href='./evalForm?company_no=${companyDTO.company_no}'">기업평가 작성</span>
        <span class="submenubar_button" onclick="location.href='./companyCommentView?company_no=${companyDTO.company_no}'">코멘트</span>
        <span class="submenubar_button" onclick="location.href='./companyDetail?company_no=${companyDTO.company_no}'">기업평가 정보</span>
    </div>

	<div class="container">
		<div class="eval center-block">
			<div class="row">
				<div id="company_name" class="row_title center-block">
					기업명
				</div>
			</div>
			<div class="row">
				<div class="row_header">평균연봉</div>
				<div id="company_salary" class="row_body">만원</div> 
			</div>
			<div class="row">
				<div class="row_header">평가자수</div>
				<div id="company_user" class="row_body">명</div>
			</div>
			<div class="row">
				<div class="row_header">주당 야근 횟수</div>
				<div class="row_body"><img id="evaluatino_nightAVG" class="star_grade" src="./resources/image/star_1.png"/></div>
			</div>
			<div class="row">
				<div class="row_header">휴식시간</div>
				<div class="row_body"><img id="evaluatino_restAVG" class="star_grade" src="./resources/image/star_1.png"/></div>
			</div>
			<div class="row">
				<div class="row_header">인턴 채용</div>
				<div class="row_body"><img id="evaluatino_internAVG" class="star_grade" src="./resources/image/star_1.png"/></div>
			</div>
			<div class="row">
				<div class="row_header">연차사용압력</div>
				<div class="row_body"><img id="evaluatino_vacationAVG" class="star_grade" src="./resources/image/star_1.png"/></div>
			</div>
		</div>
	</div>
</body>
	<script>
		var dto={
				company_name:"${companyDTO.company_name}",
				company_salary:"${companyDTO.company_salary}",
				company_user:"${companyDTO.company_user}",
				evaluatino_nightAVG:"${companyDTO.evaluatino_nightAVG}",
				evaluatino_restAVG:"${companyDTO.evaluatino_restAVG}",
				evaluatino_internAVG:"${companyDTO.evaluatino_internAVG}",
				evaluatino_vacationAVG:"${companyDTO.evaluatino_vacationAVG}",
				company_eval:"${companyDTO.company_eval}"
        };
        
		companyPrint(dto);
		
        function companyPrint(companyDTO){
            $("#company_name").html("<b>"+companyDTO.company_name+"</b>");
            $("#company_salary").html(companyDTO.company_salary+"만원");
            $("#company_user").html(companyDTO.company_eval+"명");
            $("#evaluatino_nightAVG").attr("src","./resources/image/star_"+Math.floor(companyDTO.evaluatino_nightAVG)+".png");
            $("#evaluatino_restAVG").attr("src","./resources/image/star_"+Math.floor(companyDTO.evaluatino_restAVG)+".png");
            $("#evaluatino_internAVG").attr("src","./resources/image/star_"+Math.floor(companyDTO.evaluatino_internAVG)+".png");
            $("#evaluatino_vacationAVG").attr("src","./resources/image/star_"+Math.floor(companyDTO.evaluatino_vacationAVG)+".png");
        }
        
	</script>
</html>