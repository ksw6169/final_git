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
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
	       	th.center{text-align: center;}
	        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
	        .table>thead>tr>th { text-align: center; }
	        .paging_button { text-align: center;}
	        .page-link { font-family: "bareun"; }
	        
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
                    <td class="submenubar_name">인증신청관리</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="container">
    	<h1 class="content">대리(회사원) 인증 목록</h1>
        <table class="table table-hover">
            <thead>
             <tr>
               <th class="center">번 호</th>
               <th class="center">ID</th>
               <th class="center">회사명</th>
               <th class="center">회사 캡쳐본</th>
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
	
	var sNum = 1; //페이징 할 첫번째 단위
	var eNum = 10; //페이지 할 마지막 단위
	var listCnt = 0; //페이징을 위한 글 갯수
	var obj = {}; //ajax에 담아서 보낼 객체
	var options = {year: "numeric", month: "numeric",
			    day: "numeric", hour: "2-digit", minute: "numeric", second: "numeric"}; //날짜 옵션설정
	var msg = "";
	   
	   obj.error=function(e){console.log(e)}; //ajax 에러날 경우의 함수
	   obj.type="POST"; //ajax로 보낼 타입
	   obj.dataType="JSON"; //ajax 실행 후 받을 값 형태
	   $(document).ready(function(){ //페이지가 실행되자마자 
	      listCall(); //리스트 콜 함수 실행 --> ajax
	      
	   });
	   
	   $("#pre").click(function(){ //이전 목록 클릭시
		   if($("#preLi").attr('class') != "page-item disabled"){ //이전 목록 버튼의 클래스가 page-item disabled아니라면 --> 클릭 활성화
			   sNum -= 10; //현재 페이징의 첫번째 숫자에서 10 줄여라
			   eNum -= 10; //현재 페이징의 마짐가 숫자에서 10 줄려라
			   listCall(); //리스트 콜 함수 실행
		   }
	   });
	   
	   $("#next").click(function(){ //다음 목록 클릭시  --> 이전목록과 유사
		   if($("#nextLi").attr('class') != 'page-item disabled'){
			   sNum += 10;
			   eNum += 10;
			   listCall();
		   }
	   });
	   
	   //리스트 요청 --> ajax
		function listCall(){
		   	obj.url = "./memAcceptList"; //ajax memAcceptList요청
			obj.data={ //같이 보낼 데이터
				"sNum":sNum,
				"eNum":eNum
			};
		   	obj.success=function(data){ //성공시의 함수
		   		msg = data.msg;
		   		console.log(msg);
		   		if(msg != null){
		   			alert(data.msg);
		   			location.href = "./";
		   		}else{
		   			listCnt = data.listCnt; //변수 리스트 카운터에 담음
					listPrint(data.list); //변수 프린트에 담음
					console.log(data);
					
					if(eNum >= listCnt){ //리스트의 갯수가 마지막 숫자보다 크거나 같으면
						$("#nextLi").addClass('disabled'); //다음목록 비활성화
					}else{ //리스트의 갯수가 마지막 숫자보다 적으면
						$("#nextLi").removeClass('disabled'); //다음목록 활성화
					}
					if(sNum == 1){ //시작 숫자가 1이면
						$("#preLi").addClass('disabled'); //이전목록 비활성화
					}else{ //시작숫자가 1보다 크면
						$("#preLi").removeClass('disabled'); //이전목록 활성화
					}
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
				content += "<td><a href='./memAcceptDetail?id="+item.member_id+"'>"+item.member_id+"</a></td>";
				content += "<td>"+item.member_company+"</td>";
				content += "<td>"+item.member_capture+"</td>";
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