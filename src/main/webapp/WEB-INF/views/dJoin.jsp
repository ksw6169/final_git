<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      
		<style>
		body { padding-top: 70px; }
        
        .container {
            margin-top: 50px;
        	margin-bottom: 50px;
            padding-top: 25px;
            padding-bottom: 25px;
            background: #E4EEF0;
        }
        
        .content {
            font-family: "bareun";
            text-align: center;
            margin-bottom: 50px;
        }
        
        .inputHeader {
        	width: 100%;
			height: 50px;
        	line-height: 50px;
        	font-family: "bareun";
            background: #121F27;
			margin-top: 5px;
			color: white;
			text-align: center;
			font-size: 13px;
			padding: 0px;
			margin-left: 10px;
        }
        
        .inputHeader2 {
        	width: 100%;
			height: 50px;
			line-height: 50px;
        	font-family: "bareun";
            background: #121F27;
			margin-top: 5px;
			color: white;
			text-align: center;
			font-size: 8px;
			padding: 0px;
			margin-left: 10px;
        }
        
        .inputTag {
			width: 100%;
			height: 50px;
        	line-height: 50px;
        	font-family: "bareun";
            background: white;
            border: 0px;
            outline:none;
			margin-top: 5px;
			color: black;
			text-align: center;
			font-size: 13px;
			padding: 0px;
			margin-left: -10px;
        }
        
        .comment{
        	font-family: "bareun";
        	text-align: left;
            font-size: 11px;
            margin-top: 10px;
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
            width: 100%;
            height: 50px;
            line-height: 50px;
            font-size: 16px;
            margin: 30px 0 20px 0px;
            border: 0px;
            background-color: #FF8000;
            color: white;
            font-family: "bareun";
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
        
        .company_btn {
            font-family: "bareun";
         	color: #fff;
          	background-color: #121F27;
            float: right;
            width: 100%;
            height: 50px;
            border: 0;
            cursor: pointer;
            text-align: center;
            line-height: 50px;
            margin: 5px -35px 0 10px;
        }
        
        .file_btn {
            font-family: "bareun";
         	color: #fff;
          	background-color: #121F27;
            float: right;
            width: 100%;
            height: 50px;
            border: 0;
            cursor: pointer;
            text-align: center;
            line-height: 50px;
            margin: 5px -35px 0 10px;
        }
        
		.warn{
	        	color : red;
	        	font-family: "bareun";
	        	text-align: left;
	        	margin-top: 15px;
	        	margin-bottom: 15px;
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
        
        .custom_select {
        	margin-top: 25px;
        	margin-bottom: 10px;
			width: 100%; /* 원하는 너비설정 */ 
			height: 50px;
			font-family: "fallM"; /* 폰트 상속 */ 
			border-radius: 0px; /* iOS 둥근모서리 제거 */ 
			appearance: none;
			display: inline-block;
		  	float: left;
		  	color: white;
		  	background-color: #121F27;
		}
		
		.btn_group {
			margin-bottom: 50px;
		}
		
		/* modal search-bar */
		#myModalLabel {
			font-family: "bareun";
		}
		
		#modal-search-bar {
            font-size:13px;
            padding:10px;
            width: 350px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            display: inline;
            float: left;
        }
		
		.table-hover {
			visibility: hidden;
		}
		
		.table-hover thead tr th {
			border: 1px solid white;
			text-align: center;
			font-weight: bold;
		}
		
		.table-hover tbody tr td {
			background-color: #E4EEF0;
			border: 1px solid white;
			text-align: center;
			font-family: "NanumL";
			font-size: 14px;
			font-weight:bold;
		}
		
		/* loading */
        #loading {
          position: absolute;
          left: 47%;
		  display: inline-block;
		  width: 75px;							/* 원 가로 길이 */
		  height: 75px;						/* 원 세로 길이 */
		  border: 5px solid #E4EEF0;	/* 원의 테두리 색 */
		  border-radius: 50%;			
		  border-top-color: #FF8000;	/* 원 회전 색 */
		  animation: spin 1s ease-in-out infinite;
		  -webkit-animation: spin 1s ease-in-out infinite;
		}
	
		@keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
		@-webkit-keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
		
    </style>
    <body>
   	 <jsp:include page="menubar.jsp" flush="false"/>
    
     		<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-1">
						<div class="row">
							<div class="col-md-10 col-md-push-1"><h1 class="content">[대리(직장인 회원) 회원가입]</h1></div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">아이디</h3></div>
			               		<div class="col-md-push-1 col-md-7">
			               			<input id="userId" class="inputTag" name="id" type="text" placeholder="아이디 (5 - 20자, 영문+숫자로 구성) 입력" onkeyup="overlay()" />
			            			<span id="userIdMsg" class="warn">　</span>
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">비밀번호</h3></div>
			               		<div class="col-md-push-1 col-md-7">
					                <input id="userPw" class="inputTag" name="pw" type="password" placeholder="비밀번호 8 - 12자 입력" onkeyup="lengthChk()">
					                <span id="userPwMsg" class="warn">　</span>
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">비밀번호 확인</h3></div>
			               		<div class="col-md-push-1 col-md-7">
					                <input id="userPw_re" class="inputTag" type="password" placeholder="********" onkeyup="pwOverlay()">
	                				<span id="userPwReMsg" class="warn">　</span>
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">이메일</h3></div>
			               		<div class="col-md-push-1 col-md-7">
					                <input id="userEmail" class="inputTag" name="email" type="text" placeholder="이메일 입력" onkeyup="emailCheck()">
	                				<span id="userEmailMsg" class="warn">　</span>
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
			              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">성씨 입력</h3></div>
			               		<div class="col-md-push-1 col-md-7">
	                				<input id="userFamily" class="inputTag" name="family" type="text" placeholder="성씨 입력">
					                <div class="row">
					                	<div class="col-md-12"><b class="comment">*입력한 성씨는 '김인턴,박인턴' 과 같은 호칭에 사용됩니다.</b></div>
					                </div>
					                <div class="row">
		                				<div class="col-md-12"><b class="comment">*호칭은 본인 외 다른사람이 볼 수 없습니다. </b></div>
		                			</div>
			            		</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-12">
				              		<select id="job_no" name="job_no" class="custom_select"> 
										<option value="1" selected>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;경영, 사무, 금융, 보험직</option> 
										<option value="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;연구직 및 공학기술직</option>
										<option value="3">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;교육, 법률, 사회복지, 경찰, 소방직 및 군인</option> 
										<option value="4">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;보건, 의료직</option>
										<option value="5">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;예술, 디자인, 방송, 스포츠직</option>
										<option value="6">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;미용, 여행, 숙박, 음식, 경비, 청소직</option>
										<option value="7">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;영업, 판매, 운전, 운송직</option>
										<option value="8">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;건설, 채굴직</option>
										<option value="9">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;설치, 정비, 생산직</option>
										<option value="10">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;농림어업직</option>
									</select>
								</div>
			            	</div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-12">
				              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">기업명</h3></div>
				               		<div class="col-md-push-1 col-md-7">
						                <input id="company" name="company" class="inputTag" name="email" type="text" placeholder="기업명" style="background-color:#121F27; color:white; border: 0px; " readonly />
				            		</div>
				            		<div class="col-md-2">
				            			<label class="company_btn" data-toggle="modal" data-target="#bs-example-modal-lg">기업 검색</label>
				            		</div>
			            		</div>
			            	</div>
						</div>
						
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-12">
				              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader2">기업 웹메일 사이트 캡쳐사진</h3></div>
				               		<div class="col-md-push-1 col-md-7">
						                <input id="fileName" class="inputTag" type="text" placeholder="파일명"  readonly />
							            <div class="row">
						                	<div class="col-md-12"><b class="comment" style="color: red;">*기업 웹메일 사이트에 로그인한 화면을 캡쳐하신 후 첨부해주세요.</b></div>
						                </div>
						                <div class="row">
			                				<div class="col-md-12"><b class="comment" style="color: red;">*기업명과 첨부하신 로그인 화면은 가입 신청 승인 후 즉시 폐기되어</b></div>
			                			</div>
			                			<div class="row">
			                				<div class="col-md-12"><b class="comment" style="color: red;">회원님의 익명을 절대 보장해 드립니다.</b></div>
			                			</div>
				            		</div>
				            		<div class="col-md-2">
				            			<label for="upload" class="file_btn">파일 첨부</label>
				            			<form id="fileUpload" method="post" enctype="multipart/form-data">
				            				<input type="file" id="upload" name="file" onchange="fileUpload()" />
				            			</form>
				            		</div>
			            		</div>
			            	</div>
						</div>
						
					  <!-- Modal -->
					  <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <div class="modal-header" style="height: 75px;">
					        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        	<input class="form-control" id="inputdefault" placeholder="기업명을 입력해주세요." style="display:inline-block; width:85%; height: 100%; "/>
					        <button class="btn btn-primary btn-md" onclick="company_search()" style="display:inline-block; width:10%; height:100%; font-family:'bareun'; background-color: #121F27; border: 0px; ">검색</button>
					      </div>
					      <div class="modal-body">
						      <table class="table table-hover">
						          <thead style="background-color: #121F27; color: white; font-family:'NanumL'; font-size: 14px; text-align: center;">
							      	<tr>
							      		<th class="center" style="width:50px;">선택</th>
							            <th class="center">기업명</th>
							            <th class="center" style="width:300px;">기업주소</th>
							     	</tr>
							      </thead>
							      <tbody id="list"></tbody>
					          </table>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal" style="font-family:'bareun'; ">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="companyWrite()" style="font-family:'bareun'; background-color: #FF8000; border: 0px; ">완료</button>
					      </div>
					    </div> 
					  </div> 
					</div> 
					
					<input id="member_div" name="member_div" type="hidden" value="인턴"/>
					
					<div class="col-md-6 col-md-push-3">
	                	<button id="joinBtn" class="join_btn">대리(직장인 회원) 회원가입</button>
	            	</div>
				
					</div>			
				</div>
			</div>
		</div>
    </body>
    <script>
		var chk = false;			// 아이디 중복값 체크
		var emailChk = false;	// 이메일 체크 변수
    
    	/* 기업명 search - 재광 */
    	function company_search() {
    	    $(".table-hover").css("visibility", "hidden");	// 테이블 숨김
    	    $("#list").empty();
    	    $(".modal-body").prepend("<div id='loading'></div>");
    	    
    	    var search_keyword = $("#inputdefault").val();
    	    
    		$.ajax({
    		      type : "GET",
    		      url : "./apiList",
    		      timeout:60000,
    		      data : {
    		         company_name : search_keyword
    		      },
    		      dataType : "JSON",
    		      success : function(data) {
    		         if (data.success) {
    		        	$(".table-hover").css("visibility", "visible");
    		        	$("#loading").remove();
    		            console.log(data.companyList);
    		            apiListPrint(data.companyList);
    		         } else {
     		            $("#loading").remove();
    		            alert(data.msg);
    		         }
    		      },
    		      error : function(error) {
    		         console.log(error);
  		            $("#loading").remove();
  		            if(error.statusText=="timeout"){
  		            	alert("서버 응답이 지연되었습니다. 다시 시도해 주세요.");
  		            }else{
  		            	//alert("Ajax 실행 오류");
  		            }
    		      }
    		   });
    	}
    	
    	/* 회사 리스트 출력 - 재광 */
    	 function apiListPrint(companyList){
    	      $("#list tr").remove();	// 요소 전부 지우고
    	      console.log(companyList);
    	      var content;
    	      companyList.forEach(function(companyDTO,idx){
    	         content="";
    	         content+="<tr>";
    	         content+="<td><input type='radio' name='seq' value='"+companyDTO.company_no+"'></td>";
    	         content+="<td>"+companyDTO.company_name+"</td>";
    	         if(companyDTO.company_addr==null){
    	            content+="<td>"+"-"+"</td>";
    	         }else{
    	            content+="<td>"+companyDTO.company_addr+"</td>";
    	         }
    	         content+="</tr>";
    	         $("#list").append(content);
    	      });
   	   }
   	 
     /* 회사 정보 입력 - 재광 */
   	 function companyWrite(){
   	       var seq=$("input[name='seq']:checked").val();
   	       
   	       if(seq != null) {
	   	       console.log("seq: "+seq);
	   	       $('#bs-example-modal-lg').modal('hide');	// 모달 숨기기
				
	   	       $.ajax({
	   	            type : "GET",
	   	            url : "./companyWrite",
	   	            data : {
	   	               seq : seq
	   	            },
	   	            dataType : "JSON",
	   	            success : function(data) {
	   	               console.log(data);
	   	               if(data.companyDTO!=null){
	   	                  $("#company").val(data.companyDTO.company_name);
	   	               }
	   	            },
	   	            error : function(error) {
	   	               console.log(error);
	   	               alert("DB 저장 실행 오류!");
	   	            }
	   	         });
   	       } else {
   	    	   alert("기업을 선택해주세요.");
   	       }
   	    }
		
		// ID 중복 확인(onkeyup 이벤트)
		function overlay() {
			var userId = $("#userId").val();	// ID 입력값
			var msg = $("#userIdMsg");		// ID 중복 체크 결과를 담을 span 태그
			
			var idReg = /^[A-Za-z0-9+]{5,20}$/;
			$.ajax({
				type : "post",
				url : "./overlay",
				data : { id : userId },
				dataType : "json",
				success : function(data) {
					if(userId==""){
						msg.html("아이디 입력을 해주세요.");
						msg.css("color", "red");
					}else if(!idReg.test(userId)){
						msg.html("5~20자리 영문과 숫자만 가능합니다.");	
						msg.css("color", "red");
					}else if(data.msg == "중복된 ID 입니다."){
						chk = false;
						msg.html(data.msg);
						msg.css("color", "red");
					}else{
						msg.html("사용 가능한 아이디입니다.");
						msg.css("color", "green");
						chk = true;
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
		
		// 비밀번호 길이 체크
		function lengthChk(){
			var userPw = $("#userPw");
			var msg = $("#userPwMsg");
			
			if(userPw.val()==""){
				msg.html("비밀번호 8~12자리 입력");
				msg.css("color", "red");
			}else if(userPw.val().length < 8 || userPw.val().length >12){
				msg.html("비밀번호 8~12자리 입력");
				msg.css("color", "red");
			}else if(userPw.val().length >= 8 || userPw.val().length <=12){
				msg.html("사용 가능한 비밀번호입니다.");
				msg.css("color", "green");
			}
		}
		
		// 비밀번호 확인 체크
		function pwOverlay(){
			var userPw1 = $("#userPw");
			var userPw2 = $("#userPw_re");
			var msg = $("#userPwReMsg");
			if(userPw1.val() != userPw2.val()){
				msg.html("비밀번호가 맞지 않습니다.");
				msg.css("color", "red");
			}else if(userPw1.val() == userPw2.val()){
				msg.html("비밀번호가 맞습니다.");
				msg.css("color", "green");
			} 
		} 
		
		// 이메일 체크
		function emailCheck() {
			var email = $("#userEmail").val();
			var msg = $("#userEmailMsg");
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
			// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우		
			if(!exptext.test(email)) {	
				msg.html("이메일 형식이 올바르지 않습니다.");
				msg.css("color", "red");
				emailChk = false;
			} else {
				msg.html("올바른 이메일 형식입니다.");
				msg.css("color", "green");
				emailChk = true;
			}
		}
		
		// 회원가입 버튼 클릭 시 입력 확인
		$("#joinBtn").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			var userPw_re = $("#userPw_re").val();
			
			var formData = new FormData();	
			
			// 전송할 데이터 담음
			formData.append("id", $("#userId").val());
			formData.append("pw", $("#userPw").val());
			formData.append("email", $("#userEmail").val());
			formData.append("family", $("#userFamily").val());
			formData.append("member_div", $("#member_div").val());
			formData.append("job_no", $("#job_no").val());
			formData.append("company", $("#company").val());
			formData.append("div", "대리 회원가입 요청");
			
			formData.append("file", $("#upload")[0].files[0]);
			
			var idReg = /^[A-Za-z0-9+]{5,16}$/;
			
			if($("#userId").val()==""){
				alert("ID를 입력해주세요.");
				$("#userId").focus();
			}else if(chk==false){
				alert("ID가 중복되었습니다.");
				$("#userId").focus();
			}else if(!idReg.test(userId)){
				alert("ID를 5~20자리 영문과 숫자로 입력해주세요.")
				$("#userId").focus();
			}else if(userPw==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
			}else if($("#userPw").val().length < 8 || $("#userPw").val().length >12){
				alert("비밀번호를 8~12자리 입력해주세요.");
				$("#userPw").focus();
			}else if(userPw_re==""){		
				alert("비밀번호를 입력해주세요.");
				$("#userPw_re").focus();
			}else if(userPw != userPw_re){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPw_re").focus();
			}else if($("#userEmail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
			}else if(emailChk==false){
				alert("올바른 이메일 형식이 아닙니다.");
				$("#userEmail").focus();
			} else if($("#userFamily").val()=="") {
				alert("성을 입력해주세요.");
				$("#userFamily").focus();
			} else if($("#userFamily").val().length > 20) {
				alert("성을 20자 이하로 입력해주세요.");
			} else if($("#company").val()=="") {
				alert("기업명을 입력해주세요.")
				$("#company").focus();
			} else if($("#fileName").val()=="") {
				alert("기업 웹메일 사이트 캡쳐사진을 첨부해주세요.");
				$("#fileName").focus();
			} else {
				$.ajax({
					// contentType, processData : ajax 파일 업로드 시 반드시 필요
					contentType: false,	
					processData: false,
					
					type : "post",
					url : "./join",
					data : formData,
					dataType : "json",
					success : function(data) {
						if(data.success > 0){
							alert("회원가입이 완료되었습니다.");
							location.href="./";	
						}else{
							alert("회원가입에 실패했습니다.");
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			}
		});
		
		// 기업 인증 사진 처리
		function fileUpload() {
			var fileValue = $("#upload").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명 
			$("#fileName").val(fileName);
		}
	</script>
</html>