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
		.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:35px;float:left;}
		td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
		.submenubar_detail{font-size:12px;margin-left:5px;color:#323838;}
		.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
		.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
			margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
		.submenubar_button{margin-right:10px;}
		.submenubar_button_last{margin-right:100px;}
    
        body { padding-top: 100px; }
        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        th.center{text-align: center;}
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; height: 25px; line-height: 25px; }
        .table>thead>tr>th { text-align: center; vertical-align: middle; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
        
        .search {
            text-align: center;
            margin-bottom: 50px;
        }
        
        input[type='text'] {
            font-size:13px;
            height: 40px;
            padding:10px;
            width:400px;
            display: inline-block;
            
        }
        
        .search_group {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 50px;
            margin-top : 30px;
        }
        
        span.input-group-addon {
          width: 50px;
          height: 40px;
          vertical-align: top;
          line-height: 35px;
          font-family: "bareun";
          display: inline-block;
          border: 0px;
          color: #fff;
          background-color: #121F27;
          font-size: 13px;
          cursor: pointer;
          margin-left: -4px;
          text-align: center;
        }
        
        button.pull-right {
          width: 75px;
          height: 30px;
          vertical-align: top;
          line-height: 30px;
          font-family: "bareun";
          border: 0px;
          color: #fff;
          background-color: #121F27;
          font-size: 13px;
          cursor: pointer;
        }
        
        .clear {
        	height: 7px;
        }
        
        .pull-right{
	        color : white;
        }

		.container {
			margin-top: 150px;
		}

    </style>
  </head>
	<body>
		<jsp:include page="menubar.jsp"/>
		
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">공지합니다<b class="submenubar_detail">공지사항</b></td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    
	    <div class="container">
	        <div class="search_group">
	            <input id="serchBox" type="text" placeholder="제목+내용을 입력해주세요."/>
	            <span class="input-group-addon" id="Nserch">
	            	<div class="clear"></div>
	                <span class="glyphicon glyphicon-search"></span>
	            </span>
	        </div>
	        <table class="table table-hover" >
	            <thead>
	             <tr>
	               <th class="center">번 호</th>
	               <th class="center">제 목</th>
	               <th class="center">작성일자</th>
	               <th class="center">조회수</th>
	             </tr>
	             </thead>
	             <tbody id="list"></tbody>
	        </table>
	        <button class="pull-right"  onclick ="location.href ='pageMove?page=noticeWrite'">글 작성</button>
	        <div class="paging_button">
	          <ul class="pagination">
	            <li class="page-item" id="pre">
	              <a class="page-link" tabindex="-1">이전 페이지</a>
	            </li>
	            <li class="page-item"  id="next">
	              <a class="page-link" >다음 페이지</a>
	            </li>
	          </ul>
	        </div>
	    </div>
	</body>
	<script>
	
		var obj = {};
		var startPage = 1; //페이징 첫
		var addPage = 10; //페이지 마지막
		var allPage = 0;
		var serText = "";
		obj.error=function(e){console.log(e)};
		obj.dataType="JSON";
		obj.type="POST";
		
		//페이지 출력시 바로 실행 
		$(document).ready(function(){
			listCall(); 
		});
		
		function listCall(){
			console.log(startPage+"/"+addPage);
			obj.url = "./nBoardList";
			obj.data = {
					"startPage":startPage, 
					"addPage":addPage
					};
			obj.success = function(data){
				allPage = data.allPage;
				listPrint(data.nBoardList);
				if(addPage >= allPage){
					//페이지 당 리스트의 갯수가 addPage = 10 보다 작으면 다음 페이지 비활성화
					$("next").addClass('disabled');
				}else{
					$("next").removeClass('disabled');
				}
				if(startPage==1){
					$("#pre").addClass('diasbled');
				}else{
					$("#pre").removeClass('disabled');
				}
			};
			ajaxCall(obj);
		}
		
		//ajax 실행 
		function ajaxCall(obj){
			$.ajax(obj)
		};
		
		//리스트 그리기
		function listPrint(nBoardList){
			var content ="";
			console.log(nBoardList);
			//번호, 제목, 작성일, 조회수
			nBoardList.forEach(function(item,board_no){
					content += "<tr>";
					content += "<td>"+item.board_no+"</td>";
					content += "<td><a href='./nBoardDetail?board_no="+item.board_no+"''>"+item.board_title+"</a></td>";
					//날짜 변경 
					var date = new Date(item.board_date);
					content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
					content += "<td>"+item.board_bHit+"</td>";
					content += "</tr>";
				
				});
			$("#list").empty();
			$("#list").append(content);
		}
		
		//다음 버튼 클릭시 
		$("#next").click(function(){
			 if($("#next").attr('class') != "page-item disabled"){
				startPage +=10;
				addPage +=10;
				listCall();
			 }
		});
		
		$("#pre").click(function(){
			 if($("#pre").attr('class') != "page-item disabled"){
				//이전 목록 활성화 시키기
				startPage -=10;
				addPage -=10;
				listCall();
			 }
		});
		
		$("#Nserch").click(function(){
			addPage = 10;
			listCall();
			
			
		})

	
	

	

 
		
	
	
	</script>
</html>