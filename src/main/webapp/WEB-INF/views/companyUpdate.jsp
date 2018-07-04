<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
        body { padding-top: 70px;}
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
		</style>
	</head>
	
	<body>
	<jsp:include page="menubar.jsp"/>
	
	<div class="col-md-4 col-md-offset-4">
	
        <form action="#" method="post">
	        
				<div class="center-block">
				<h1 class="content">회사정보 수정</h1>
					<div class="duty">직무</div>
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