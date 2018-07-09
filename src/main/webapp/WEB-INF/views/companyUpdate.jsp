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
			
	        body { padding-top: 150px;}
	        .content { font-family: "bareun";  margin-bottom: 50px; text-align: center; margin-right: 125px;}
	        .updateForm{font-family: "bareun";color: #fff;background-color: #121F27;width: 100px;height: 50px;
	          font-size: 14px;margin: 5px 0;float:left;border: 0px;text-align: center;padding-top: 15px;}
	        input[type='text'], input[type='password'] {font-size:13px;padding:10px;width: 435px; height: 50px;line-height: 50px;
	          outline:none;margin: 5px 0;padding-left: 20px;margin-left: 15px;display: inline; font-family: "bareun";}
	       .company_photo{font-family: "bareun"; color: #fff; background-color: #121F27; width: 100px; height: 50px; 
	          font-size: 12px;margin: 5px 0;float:left;border: 0px white;text-align: center;padding-top: 10px;}
	        /*파일 버튼*/
	        .file_btn{font-family: "bareun";color: #fff;background-color: #121F27;float: right;width: 120px;
	            height: 50px;margin: 5px 5px 0 0;border: 0;cursor: pointer;text-align: center;line-height: 50px;}
	        input[type='file']{position : absolute;clip:rect(0,0,0,0);overflow: hidden;border:0;}
	         /* add */
	        .center-block{ width: 700px;}
	        #group{background: black; color: white; height: 15px; width: 150px; position: static;}
	        #capture{background: black; color: white; height: 15px; width: 150px; font-size: 15px; padding: 2px 2px;}
	        /* 캡쳐 밑에 설명 */
	        #blink{height: 1px; background-color: white; border-color: white; width: 150px;}
	        #info{font-family: "bareun"; color: red; margin-left: 115px;}
	        /* 버튼 */
	        #mUpdate{width: 300px;height: 50px;font-size: 16px;margin: 10px 0 0 0;border: 0px;background-color: #FF8000;
	            color: white;font-family: "bareun";margin-left: 125px;}
	        #btnC{text-align: center; }
	        /* 파일 찾기 버튼 */
	        #fileDiv{float: left; position: relative;}
	        /*직무 div*/
	        .duty{font-family: "bareun"; color: #fff; background-color: #121F27; width:550px; height:50px; border:0; text-align: center; line-height: 50px; float: left; margin : 0 100px 10px 0; font-size: 20px;}
		
			div.col-md-4.col-md-offset-4 {
				margin-right: 50px;
				margin-top: 150px; 
			}
		
			.custom_select {
				width: 100%; /* 원하는 너비설정 */ 
				height: 100%;
				font-family: "fallM"; /* 폰트 상속 */ 
				border-radius: 0px; /* iOS 둥근모서리 제거 */ 
				appearance: none;
				display: inline-block;
			  	float: left;
			  	color: white;
			  	background-color: #121F27;
			}
		
			.custom_select {
				padding-left: 50%;
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
           <span class="submenubar_button"><a href="./pageMove?page=perUpdate">개인정보 수정</a></span>
	    </div>
		
		<div class="col-md-4 col-md-offset-4">
		
	        <form action="#" method="post">
		        
					<div class="center-block">
					<h1 class="content">회사정보 수정</h1>
						<div class="duty">
							<!-- 미수정!(0705_성원) -->
							<select class="custom_select"> 
								<option value="1" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경영, 사무, 금융, 보험직</option> 
								<option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연구직 및 공학기술직</option> 
								<option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교육, 법률, 사회복지, 경찰, 소방직 및 군인</option> 
								<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보건, 의료직</option>
								<option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예술, 디자인, 방송, 스포츠직</option>
								<option value="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;미용, 여행, 숙박, 음식, 경비, 청소직</option>
								<option value="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영업, 판매, 운전, 운송직</option>
								<option value="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;건설, 채굴직</option>
								<option value="9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;설치, 정비, 생산직</option>
								<option value="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;농림어업직</option>
							</select>
						</div>
					<!-- 기업명 수정 -->
					<div>
				        <div class="updateForm">기업명</div>
				        <input type="text" placeholder="기업명 입력" />
				    </div>
				    <!-- 기업 웹메일 수정 -->
				   	<div class="company_photo">기업 웹메일<br/> 사이트 캡쳐사진</div>
				   	<input type="text" placeholder="파일명" readonly/>
				   	<label for="upload" class=file_btn>파일 첨부</label>
					<input type="file" id="upload"/>
				   	<!-- 코멘트 -->
					<div><span id="info">*기업 웹메일 사이트에 로그인한 화면을 캡쳐하신 후 첨부해주세요.</span></div>
				    <div><span id="info">*기업명과 첨부하신 로그인 화면은 수정 신청 승인 후 즉시 폐기되어</span></div>
				    <div><span id="info">회원님의 익명을 절대 보장해드립니다.</span></div>
				    </div>
				    
					<div class="center-block">
					    	<input id="mUpdate" type="button" value="개인정보 수정">
					</div>	    
	        </form>
			</div>
	</body>
	<script>
	</script>
</html>