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
			.submenubar_background{/* position:absolute; */width:100%;height:100px;background-color:#E4EEF0}
			.submenubar_header{font-family:fallM;margin-left:40px;width:150px;height:50px;display:inline-block;margin-top:30px;float:left;}
			td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:10px;margin-left:5px;}
			.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:3%};
			
	        /* main css */
	        .clear { margin-top: 200px; }	/* 여백을 위한 div */
	        .container{margin-top:50px; margin-bottom:50px; padding-top:25px; padding-bottom:25px; background:#E4EEF0;}
	        .inputHeader,.inputHeader2{background:#121F27;color:#fff;margin-left:10px;}
	        .content{font-family:bareun;text-align:center;margin-bottom:50px;}
	        .custom_select{margin-top:25px;margin-bottom:10px;width:100%;height:50px;font-family:fallM;border-radius:0;appearance:none;display:inline-block;float:left;color:#fff;background-color:#121F27;}
	        .inputHeader,.inputHeader2,.inputTag{width:100%;height:50px;line-height:50px;font-family:bareun;margin-top:5px;padding:0;text-align:center;}
	        .inputHeader{font-size:13px;}
	        .inputHeader2{font-size:8px;}
	        .inputTag{background:#fff;border:0;outline:0;color:#000;font-size:13px;margin-left:-10px;}
	        
	        .company_btn, .file_btn{background-color:#121F27;float:right;cursor:pointer;}
	        #mUpdate,.company_btn,.file_btn{width:100%;line-height:50px;border:0;color:#fff;font-family:bareun;height:50px;}
	        .company_btn{text-align:center;margin:5px -35px 0 10px;}
	        .comment{font-family:bareun;text-align:left;font-size:11px;margin-top:10px;}
	        .file_btn{text-align:center;margin:5px -35px 0 10px;}
	        input[type=file]{position:absolute;clip:rect(0,0,0,0);overflow:hidden;border:0;}
	        #mUpdate{font-size:16px;margin:30px 0 20px;background-color:#FF8000;}
	        
	        /* Modal */
	        .table-hover tbody tr td, .table-hover thead tr th{border:1px solid #fff;text-align:center;font-weight:700;}
	        #myModalLabel{font-family:bareun;}
	        #modal-search-bar{font-size:13px;padding:10px;width:350px;height:50px;line-height:40px;outline:0;margin:5px 0;display:inline;float:left;}
	        .table-hover{visibility:hidden;}
	        .table-hover tbody tr td{background-color:#E4EEF0;font-family:NanumL;font-size:14px;}
	        
	        /* loading */
	        #loading{position:absolute;left:47%;display:inline-block;width:75px;height:75px;border:5px solid #E4EEF0;border-radius:50%;border-top-color:#FF8000;animation:spin 1s ease-in-out infinite;-webkit-animation:spin 1s ease-in-out infinite;}
	        @keyframes spin{to{-webkit-transform:rotate(360deg);}}
	        @-webkit-keyframes spin{to{-webkit-transform:rotate(360deg);}}
	        
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
		<jsp:include page="menubar.jsp"/>
		
	    <!-- 서브메뉴바 -->
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
	    
	    <div class="clear">　</div>
	    
	    <!-- 회사정보 수정 메인 페이지 -->
	    <div class="container">
	    	<form method="post" id="fileUpload" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-10 col-md-push-1">
						<div class="row">
							<div class="col-md-10 col-md-push-1"><h1 class="content">회사정보 수정</h1></div>
						</div>
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<div class="col-md-10 col-md-push-1">
									<div class="col-md-12">
					              		<select name="jobSel" class="custom_select"> 
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
							
							<!-- 기업명 검색 -->
							<div class="row">
								<div class="col-md-10 col-md-push-1">
									<div class="col-md-12">
					              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader">기업명</h3></div>
					               		<div class="col-md-push-1 col-md-7">
							                <input id="comName" name="companyName" class="inputTag" name="email" type="text" placeholder="기업명" style="background-color:#121F27; color:white; border: 0px; " readonly />
					            		</div>
					            		<div class="col-md-2">
					            			<label class="company_btn" data-toggle="modal" data-target="#bs-example-modal-lg">기업 검색</label>
					            		</div>
				            		</div>
				            	</div>
							</div>
							
							<!-- 기업 웹메일 사진 -->
							<div class="row">
								<div class="col-md-10 col-md-push-1">
									<div class="col-md-12">
					              		<div class="col-md-push-1 col-md-3"><h3 class="inputHeader2">기업 웹메일 사이트 캡쳐사진</h3></div>
					               		<div class="col-md-push-1 col-md-7">
							                <input id="fileName" class="inputTag" type="text" placeholder="파일명"  readonly />
							                
							                <!-- 코멘트 -->
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
					            		
					            		<!-- 파일 첨부 버튼 -->
					            		<div class="col-md-2">
					            			<label for="upload" class="file_btn">파일 첨부</label>
				            				<input type="file" id="upload" name="file" onchange="fileUpload()" />
					            		</div>
				            		</div>
				            	</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-md-push-3">
                	<button id="mUpdate">회사정보 수정 요청</button>
            	</div>
			</form>
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
	</body>
	<script>
		// 서브 메뉴바
		var member_div = "${sessionScope.member_div}";
		
		/* 기업명 search - 재광 */
    	function company_search() {
    	    $(".table-hover").css("visibility", "hidden");	// 테이블 숨김
    	    $("#list").empty();
    	    $(".modal-body").prepend("<div id='loading'></div>");
    	    
    	    var search_keyword = $("#inputdefault").val();
    	    
    		$.ajax({
    		      type : "GET",
    		      url : "./apiList",
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
    		         alert("List 불러오기 실행 오류!");
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
	   	                  $("#comName").val(data.companyDTO.company_name);
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
		
		$(document).ready(function(){
			if(member_div == "인턴") {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate' style='color:white;'>회사정보 등록</a>");
			} else {
				$("#companyupdate_btn").html("<a href='./pageMove?page=companyUpdate' style='color:white;'>회사정보 수정</a>");
			}
		});
		
		function fileUpload(){
			var fileValue = $("#upload").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명 
			$("#fileName").val(fileName);
		}
		
		$("#mUpdate").click(function(){
			if($("#comName").val()==""){
				alert("기업명을 선택해주세요.");
				$("#comName").focus();
				console.log("미입력");
			}else if($("#fileName").val() == ""){
				alert("사진을 선택해주세요");	
			}else{
				$("form").attr("action", "companyUpdate");
			}
		});
	</script>
</html>