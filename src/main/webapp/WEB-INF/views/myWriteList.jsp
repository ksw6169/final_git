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
      .submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:35px;float:left;}
      td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
      .submenubar_detail{font-size:10px;margin-left:5px;}
      .submenubar_description{font-size:10px;height:15px;margin-top:10px;}
      .submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
         margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
      .submenubar_button{margin-right:10px;}
      .submenubar_button_last{margin-right:100px};
    
        body { padding-top: 100px; }
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        .table>thead>tr>th { text-align: center; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
        .container {
         margin-top: 150px;
      }
      /* 리스트 크기 */
      #board_date{width: 350px;}
      #board_no{width: 150px;}
      /* 링크 글색 */
      .boardLink{color: black;}
      .boardLink:hover{text-decoration: none; color: black;}
      .boardLink:active{text-decoration: none; color: black;}
      .boardLink:visited {text-decoration: none; color: black;}
      
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
   
   
       <div class="container">
           <h1 class="content">내가 쓴 글 보기</h1>
           <table class="table table-hover" id="listTable">
               <thead id='tableTh'>
                <tr>
                  <th id="board_no" class="center">번 호 </th>
                  <th class="center">제 목</th>
                  <th id="board_date" class="center">작성일자</th>
                </tr>
                </thead>
                <tbody id="list">
                </tbody>
           </table>
           <div class="paging_button">
             <ul class="pagination">
               <li id="preLi" class="page-item">
                 <a id="pre" class="page-link" tabindex="-1">이전 페이지</a>
               </li>
               <li id="nextLi" class="page-item">
                 <a id="next" class="page-link">다음 페이지</a>
               </li>
             </ul>
           </div>
       </div>
   </body>
   <script>
   var tableTh = $("#tableTh").html();
   var sNum = 1;
   var eNum = 10;
   var listCnt = 0;
   var obj = {};
   var options = {year: "numeric", month: "numeric",
		    day: "numeric", hour: "2-digit", minute: "numeric", second: "numeric"};
   
   obj.error=function(e){console.log(e)}; //ajax 에러날 경우의 함수
   obj.type="POST"; //ajax로 보낼 타입
   obj.dataType="JSON"; //ajax 실행 후 받을 값 형태
   $(document).ready(function(){
      listCall();
      console.log($("#preLi"));
      
   });
   
   $("#pre").click(function(){
	   if($("#preLi").attr('class') != "page-item disabled"){
		   sNum -= 10;
		   eNum -= 10;
		   listCall();
	   }
   });
   
   $("#next").click(function(){
	   if($("#nextLi").attr('class') != 'page-item disabled'){
		   sNum += 10;
		   eNum += 10;
		   listCall();
	   }
   });
   
   //리스트 요청
	function listCall(){
	   	obj.url = "./myWriteList"; //ajax myWriteList로 요청
		obj.data={ //같이 보낼 데이터
			"sNum":sNum,
			"eNum":eNum
		};
	   	obj.success=function(data){ //성공시의 함수
	   		console.log(data);
	   		listCnt = data.listCnt;
			listPrint(data.list);
			if(eNum >= listCnt){
				$("#nextLi").addClass('disabled');
			}else{
				$("#nextLi").removeClass('disabled');
			}
			if(sNum == 1){
				$("#preLi").addClass('disabled');
			}else{
				$("#preLi").removeClass('disabled');
			}
		};
		ajaxCall(obj); //아작스 보내는 함수 호출
   }
   
	//받아온 리스트 그리기
	function listPrint(list){
		var content = "";
		list.forEach(function(item, idx){
			content += "<tr class='listVal'>";
			content += "<td>"+item.rnum+"</td>";
			content += "<td><a class='boardLink' href='#'>"+item.board_title+"</a></td>";
			
			//millisecond 로 나올경우
			var date = new Date(item.board_date);
			content += "<td>"+date.toLocaleDateString("ko-KR", options)+"</td>";
			content += "</tr>";
		});
		$("#list").empty();
		$("#list").append(content);//내용 붙이기
	}
   

	function ajaxCall(obj){
		$.ajax(obj);
	}
   
   </script>
</html>