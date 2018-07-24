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
	        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
	        .table>thead>tr>th { text-align: center; vertical-align: middle; }
	        th>input[type='checkbox'] { position:relative; top:-4px; }
	        .paging_button { text-align: center;}
	        .page-link { font-family: "bareun"; }
	        .container { margin-top: 120px; }
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
	        <span class="submenubar_button_last">보낸 쪽지함</span>
	        <span class="submenubar_button">받은 쪽지함</span>
	    </div>
	
	    <div class="container">
	        <h1 class="content">받은 쪽지함</h1>
	        <table class="table table-hover">
	            <thead>
	             <tr>
	               <th><input type="checkbox"/></th>
	               <th>번 호</th>
	               <th>내 용</th>
	               <th>작성일자</th>
	             </tr>
	             </thead>
	             <tbody id="list"></tbody>
	        </table>
	        <button class="btn btn-default pull-right">삭제</button>
	        <div class="paging_button">
	          <ul class="pagination">
	            <li class="page-item disabled">
	              <a class="page-link" href="#" tabindex="-1">이전 페이지</a>
	            </li>
	            <li class="page-item">
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
		
		obj.error=function(e){console.log(e)};
		obj.dataType="JSON";
		obj.type="POST";
		
		//ajax 실행 
		function ajaxCall(obj){
			$.ajax(obj)
		};
		
		function listCall(){
			obj.url = "./UgetmessageList";
			obj.data = {
					"sPage":sPage,
					"ePage":ePage
			};
			obj.success=function(data){
				console.log(data);
				listPrint(data.GmessageList); //리스트 뿌린후
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
			GmessageList.forEach(function(item,message_no){
					content += "<tr>";
					content += "<td><input type='checkbox'/></td>";
					content += "<td>"+item.message_no+"</td>";
					content += "<td id='readChk'><a href='./UmessageDetail?message_no="+item.message_no+"''>"+item.message_content+"</a></td>";
					//날짜 변경 
					var date = new Date(item.message_date);
					content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
					content += "</tr>";
				});
			$("#list").empty();
			$("#list").append(content);
		}
		
		//다음 버튼 클릭시 
		$("#next").click(function(){
			 if($("#next").attr('class') != "page-item disabled"){
				sPge +=10;
				ePage +=10;
				listCall();
			 }
		});
		//이전 버튼 클릭시 
		$("#pre").click(function(){
			 if($("#pre").attr('class') != "page-item disabled"){
				//이전 목록 활성화 시키기
				sPge -=10;
				ePage -=10;
				listCall();
			 }
		});
	</script>
</html>