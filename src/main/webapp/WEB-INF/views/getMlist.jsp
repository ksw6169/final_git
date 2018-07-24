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
        .submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0;}
		.submenubar_header{font-family:fallM;margin-left:40px;width:150px;height:50px;display:inline-block;margin-top:35px;float:left;}
		td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
		.submenubar_detail{font-size:10px;margin-left:5px;}
		.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
		.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
			margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
		.submenubar_button{margin-right:10px;}
		.submenubar_button_last{margin-right:3%;}
    
        body { padding-top: 100px; }
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
       .table>thead>tr>th { text-align: center; vertical-align: middle; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
        th>input[type='checkbox'] { position:relative; top:-4px; }
        
        .container { margin-top: 150px; }
       	
       	/* submenuBar 링크 글자 색상 */
		.submenubar_button a{ color: white;}
		.submenubar_button_last a{color: white;}
		.submenubar_button a:hover{color: #FF8000; background-color: #121F27;text-decoration: none;}
		.submenubar_button_last a:hover{color: #FF8000; background-color: #121F27; text-decoration: none;}
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp" flush="false"/>
		
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">쪽지함</td>
	                </tr>
	            </table>
	        </div>
	        <span id="AdminWrite" class="submenubar_button_last"><a href="./pageMove?page=mWrite">쪽지 작성</a></span>
	        <span id="sendM" class="submenubar_button"><a href="./pageMove?page=sendMlist">보낸 쪽지함</a></span>
	        <span id="getM" class="submenubar_button"><a href="./pageMove?page=getMlist">받은 쪽지함</a></span>
	    </div>
	    <div class="container">
	        <h1 class="content">받은 쪽지함</h1>
	        <table class="table table-hover">
	        	<thead>
	             <tr>
	               <th class="center"><input type="checkbox"  id="allChk" onclick="allChk(this);"/></th>
	               <th class="center">번 호</th>
	               <th class="center">내   용</th>
	               <th class="center">작성일자</th>
	             </tr>
	            </thead>
	             <tbody id="list"></tbody>
	        </table>
	        <button id="del" class="btn btn-default pull-right">삭제</button>
	        <div class="paging_button">
	          <ul class="pagination">
	            <li id="pre" class="page-item disabled" >
	              <a class="page-link" href="#" tabindex="-1">이전 페이지</a>
	            </li>
	            <li id="next" class="page-item">
	              <a class="page-link" href="#">다음 페이지</a>
	            </li>
	          </ul>
	        </div>
	    </div>		
	</body>
	<script>
		var obj = {};
		var sPage =1;
		var ePage = 10;
		var page = 0;
		var readCK = "N";
		
		var id = "${sessionScope.loginId}";
		console.log(id);
		
		listCall();
		adminCK(); 
		
		obj.error=function(e){console.log(e)};
		obj.dataType="JSON";
		obj.type="POST";
		
		//ajax 실행 
		function ajaxCall(obj){
			$.ajax(obj)
		};
		
		//관리자 접속 체크 및 공지사항 작성 버튼 활성/비활성화 
		 function adminCK(){
			 	var id = "${sessionScope.loginId}"
				var div = "${sessionScope.membe_div}"
					console.log(id +"/"+div);
				if(id != "admin" && div != "관리자"){
					$("#AdminWrite").show();
				}else{
					$("#sendM").removeClass("submenubar_button").addClass('submenubar_button_last');
					$("#AdminWrite").hide();
					}
			}
		
		function listCall(){
			obj.url = "./UgetmessageList";
			obj.data = {
					"sPage":sPage,
					"ePage":ePage
			};
			obj.success=function(data){
				console.log(data.GmessageList);
				listPrint(data.GmessageList); 
	
				page = data.GmessageList.length;
				if(ePage >= page){
					$("#next").addClass('disabled');
				}else{
					$("#next").removeClass('disabled');
				}
				if(sPage==1){
					$("#pre").addClass('disabled');
				}else{
					$("#pre").removeClass('disabled');
				}
			};
			ajaxCall(obj);
		}
		
		//리스트 그리기
		function listPrint(GmessageList){
			var content ="";
			//체크박스,번호, 제목, 작성일
			GmessageList.forEach(function(GmessageList,message_no){
						content += "<tr>";
						content += "<td><input class='Chk' name='RowCheck' type='checkbox' value='"+GmessageList.message_no+"'/></td>";
						content += "<td>"+GmessageList.message_no+"</td>";	
						//읽은부분 텍스트 색상 변경 
						if(GmessageList.message_read=='y'){
							content += "<td><a style='color:black; text-decoration:none;' id='readChk' href='./UmessageDetail?message_no="+GmessageList.message_no+"''>"+GmessageList.message_content+"</a></td>";
			   			}else{
			   			content += "<td ><a id='readChk' href='./UmessageDetail?message_no="+GmessageList.message_no+"''>"+GmessageList.message_content+"</a></td>";
			   			}
						//날짜 변경 
						var date = new Date(GmessageList.message_date);
						content += "<td>"+dateForm(date)+"</td>";
						content += "</tr>";
			});
				$("#list").empty();
				$("#list").append(content);
		}
		
		// 다음 버튼 클릭시 
		$("#next").click(function(){
			 if($("#next").attr('class') != "page-item disabled"){
				sPage +=10;
				ePage +=10;
				listCall();
			 }
			 
		function listCall(){
			obj.url = "./UgetmessageList";
			obj.data = {
					"sPage":sPage,
					"ePage":ePage
			};
			obj.success=function(data){
				console.log(data.GmessageList);
				listPrint(data.GmessageList); 
				page = data.listAll;
				if(ePage >= page){
					$("#next").addClass('disabled');
				}else{
					$("#next").removeClass('disabled');
				}
				if(sPage==1){
					$("#pre").addClass('disabled');
				}else{
					$("#pre").removeClass('disabled');
				}
			};
			ajaxCall(obj);
		}
	
		//리스트 그리기
		function listPrint(GmessageList){
			var content ="";
			//체크박스,번호, 제목, 작성일
			GmessageList.forEach(function(GmessageList,message_no){
				content += "<tr>";
				content += "<td><input class='Chk' name='RowCheck' type='checkbox' value='"+GmessageList.message_no+"'/></td>";
				content += "<td>"+GmessageList.message_no+"</td>";	
				//읽은부분 텍스트 색상 변경 
				if(GmessageList.message_read=='y'){
					content += "<td><a style='color:black; text-decoration:none;' id='readChk' href='./UmessageDetail?message_no="+GmessageList.message_no+"''>"+GmessageList.message_content+"</a></td>";
	   			}else{
	   			content += "<td ><a id='readChk' href='./UmessageDetail?message_no="+GmessageList.message_no+"''>"+GmessageList.message_content+"</a></td>";
	   			}
				//날짜 변경 
				var date = new Date(GmessageList.message_date);
				content += "<td>"+dateForm(date)+"</td>";
				content += "</tr>";
			});
		
		//이전 버튼 클릭시 
		$("#pre").click(function(){
			 if($("#pre").attr('class') != "page-item disabled"){
				//이전 목록 활성화 시키기
				sPage -=10;
				ePage -=10;
				listCall();
			 }
		});
		
		//체크박스 전체 선택 
		 function allChk(obj){
		      var chkObj = document.getElementsByName("RowCheck");
		      var rowCnt = chkObj.length - 1; //상단에 있는 갯수 -1 
		      var check = obj.checked;
				console.log(rowCnt);
				if(check) {﻿
					for (var i=0; i<=rowCnt; i++){
						if(chkObj[i].type == "checkbox")
							chkObj[i].checked = true;
						
						}
				}else{
					for (var i=0; i<=rowCnt; i++) {
						if(chkObj[i].type == "checkbox"){
							chkObj[i].checked = false; 
							}
						}
					}
				} 
		
		$("#del").click(function(){
			var con_check = confirm("정말 삭제하시겠습니까?");
			if(con_check ==true){
				obj.url = "./messagedelete";
				var checked = [];
				
				$("input[name='RowCheck']:checked").each(function(){
					checked.push($(this).val());
				});
				console.log(checked);
				obj.data={
						"Chkdel":checked
				};
				obj.success = function(data){	
					if(data.success){
							alert("삭제 되었습니다.");
							location.href = "./pageMove?page=getMlist";
					}else{
						alert("삭제되지 않았습니다.");
						location.href = "./pageMove?page=getMlist";
					}
				}
				ajaxCall(obj);
			}else{
				alert("삭제되지 않았습니다.");
			}
		});
		
		function dateForm(now) {
			year = "" + now.getFullYear();
			month = "" + (now.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
			day = "" + now.getDate(); if (day.length == 1) { day = "0" + day; }
			hour = "" + now.getHours(); if (hour.length == 1) { hour = "0" + hour; }
			minute = "" + now.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
			second = "" + now.getSeconds(); if (second.length == 1) { second = "0" + second; }
			return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
		}
	</script>
</html>