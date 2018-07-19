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
      	/* submenubar css */
       .submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0}
       .submenubar_header{font-family:fallM;margin-left:40px;width:150px;height:50px;display:inline-block;margin-top:30px;float:left;}
       td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
       .submenubar_detail{font-size:10px;margin-left:5px;}
       .submenubar_description{font-size:10px;height:15px;margin-top:10px;}
       .submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
         margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
       .submenubar_button{margin-right:10px;}
       .submenubar_button_last{margin-right:3%};
    	
    	/* main css */
        body { padding-top: 70px; text-align: center;}
    	.container{margin-top:150px;margin-bottom:50px;padding-top:25px;padding-bottom:25px;background:#E4EEF0;}
    	.inputHeader,.inputTag{font-family:bareun;margin-top:5px;text-align:center;font-size:13px;padding:0;width:100%;height:50px;line-height:50px;}
    	.content{font-family:bareun;text-align:center;margin-bottom:50px;}
    	.inputHeader{background:#121F27;color:#fff;margin-left:10px;}
    	.inputTag{background:#fff;border:0;outline:0;color:#000;margin-left:-10px;}
    	.bord{font-family:fallB;}
    	.out_btn{width:100%;height:50px;line-height:50px;font-size:16px;margin:30px 0 20px;border:0;background-color:#121F27;color:#fff;font-family:bareun;}
		
		/* submenuBar 링크 글자 색상 */
		.submenubar_button a{ color: white;}
		.submenubar_button_last a{color: white;}
		.submenubar_button a:hover{color: #FF8000; background-color: #121F27;text-decoration: none;}
		.submenubar_button_last a:hover{color: #FF8000; background-color: #121F27; text-decoration: none;}
		.submenubar_button a:active{color: #FF8000; background-color: #121F27;text-decoration: none;}
		.submenubar_button_last a:active{color: #FF8000; background-color: #121F27;text-decoration: none;}
    </style>
   </head>
   <body>
      <jsp:include page="menubar.jsp" flush="false"/>
      
      <!-- 서브 메뉴바 -->
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
           <span id="companyupdate_btn" class="submenubar_button"></span>
           <span class="submenubar_button"><a href="./perUpdateForm">개인정보 수정</a></span>
       </div>
      
		<!-- main -->
		<div class="container">
	    	<div class="row">
				<div class="col-md-10 col-md-push-1">
					<div class="row">
						<div class="col-md-10 col-md-push-1"><h1 class="content">회원 탈퇴</h1></div>		
					</div>
					<div class="row" style="text-align: center; margin-bottom: 25px;">
						<span class="bord">정말 탈퇴를 원하시나요?</span><br/>
				        회원 탈퇴를 원하시면, 로그인한 ID를 입력하고<br/>
				        회원탈퇴 버튼을 눌러주세요.
					</div>
					<div class="row">
						<div class="col-md-10 col-md-push-1">
		               		<div class="col-md-push-2 col-md-8">
		               			<input id="inputId" class="inputTag" type="text" placeholder="ID를 입력해주세요." />
		            			<div id="wrong">　
		            				*ID를 잘못 입력하셨습니다.
		            			</div>	
		            		</div>
	            		</div>
            		</div>
					<div class="row">
						<div class="col-md-6 col-md-push-3">
							<div class="col-md-6">
			                	<button id="out" class="out_btn">회원탈퇴</button>
			                </div>
							<div class="col-md-6">	                   			
                   				<button id="cancel" class="out_btn">취소</button>
                   			</div>
			            </div>
		            </div>
				</div>
			</div>
	    </div>  
	</body>
	<script>
	   var userId = "${sessionScope.loginId}";
	   var member_div = "${sessionScope.member_div}";
	   
	   var msg = "{msg}";
	   if(msg == ""){
	      alert(msg);
	   }
			
		$(document).ready(function(){
			if(member_div == "인턴") {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate'>회사정보 등록</a>");
			} else {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate'>회사정보 수정</a>");
			}
		});
	   
	   $("#wrong").hide();
	   
	   $("#out").click(function(){
	      if($("#inputId").val() == userId){
	    	 alert("탈퇴가 완료 되었습니다.");
	         location.href="./outMem";
	      }else{
	         $("#wrong").show();
	         $("#inputId").clear();
	      }
	   });
	   
	   $("#inputId").keyup(function(){
	      $("#wrong").hide();
	   });
	   
	   /* 취소 버튼 클릭 시 */
	   $("#cancel").click(function() {
		   location.href = "./";
	   });
   </script>
</html>