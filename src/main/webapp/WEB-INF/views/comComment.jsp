<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<script>
			divCheck();
			function divCheck(){
		    	var loginId = "${sessionScope.loginId}";
		    	var loginDiv ="${sessionScope.member_div}";
		
		    	if(loginId != null && loginDiv == "인턴"){
		    		alert("해당 게시판 권한이 없습니다.");
		    		location.href=document.referrer;
		    	}
		    }
		</script>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
   	 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
			
			
	        button { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        .table>thead>tr>th { font-family: "fallM"; text-align: center; vertical-align: middle;  background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	
	        .like { background-color: #FF8000; margin: 15px 0 0 15px; }
	
	        .reply { background-color: #E5EDF0; color: #121F27; border: 1px solid #DDDDDD;}
	        .subject, .date { color: #121F27; background-color: #FFFFFF; }
	        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 
	
	        .reply_contents { color: #121F27; background-color: #FFFFFF; width:250px; height: 75px; line-height: 75px; text-align: left; }
	        .reply_date { color: #121F27; background-color: #FFFFFF; width:150px; height: 75px; line-height: 75px; text-align: center; } /* width 삭제 */
			td.reply_updel { background-color: #FFFFFF; border: 1px #FFFFFF; width: 80px; }
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center;}
			.table>tbody>tr>td.reply_date { vertical-align: middle; border: 1px white; }
	        .table>tbody>tr>td.td_star { vertical-align: middle; border: 1px solid #DDDDDD; }
			.table>tbody>tr>td.reply_updel { padding: 0px; border-top: 0px; }
			
			.button_group {
				width: 100px;
				height: 37.5px;
				background-color: #121F27;
				color: white;
				font-family: "bareun";
				border: 1px solid #E4EEF0;
			}
			
			.div_dont{
				width: 100px;
				height: 75px;
				background-color: #121F27;
				color: white;
				font-family: "bareun";
				border: 1px solid #E4EEF0;
				line-height: 75px;
			}
	        
	        .star_grade {
	        	height: 15px;
	        }
	        
	        .td_star { color: #121F27; background-color: #FFFFFF; width: 100px; height: 75px; line-height: 75px; text-align: center; vertical-align: middle; }
    	
    		.container {
				margin-top: 100px; 
			}
    	</style>
  </head>
  <body>  
  	<jsp:include page="menubar.jsp" flush="false"/>
  	
 	<div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">기업평가</td>
                </tr>
            </table>
        </div>
        <span class="submenubar_button_last" onclick="location.href='./evalForm?company_no=${company_no}'">기업평가 작성</span>
        <span class="submenubar_button" onclick="location.href='./companyCommentView?company_no=${company_no}'">코멘트</span>
        <span class="submenubar_button" onclick="location.href='./companyDetail?company_no=${company_no}'">기업평가 정보</span>
    </div>
  
  
	<div class="container">
        <div class="detail_div">
            <div class="table_div">
                <!-- <table class="table">
                	<thead>
                     <tr>
                       <th class="reply" colspan="7">코멘트 121</th>
                     </tr>
                     <tr>
                       <th>작성일자</th>
                       <th>내용</th>
                       <th>주당야근횟수</th>
                       <th>휴식시간</th>
                       <th>인턴채용</th>
                       <th>연차사용압력</th>
					   <th>수정/삭제</th>
                     </tr>
                     </thead>
                     <tr>
					   <td class="reply_date">2018-06-26 15:20</td>
                       <td class="reply_contents">너무 걱정하지 마세요~ ^0^</td>
                       <td class="td_star"><img class="star_grade" src="./resources/image/star_1.png"/></td>
                       <td class="td_star"><img class="star_grade" src="./resources/image/star_2.png"/></td>
                       <td class="td_star"><img class="star_grade" src="./resources/image/star_3.png"/></td>
                       <td class="td_star"><img class="star_grade" src="./resources/image/star_4.png"/></td>  
					   <td class="reply_updel">
						<button class="button_group pull-right">수정</button>
						<br>
                		<button class="button_group pull-right">삭제</button>
					   </td>
                     </tr>
                </table> -->
            </div>
        </div>
		
    </div>
</body>
	<script>
	var obj={};
	var userID="${userID}";
	
	createObj(obj);
	ajaxCall(obj);
	
	 function createObj(obj){
         obj.url="./companyCommentList";
         obj.type="GET";
         obj.dataType="JSON";
         obj.error=function(e){console.log(e)};
     }
	 function ajaxCall(obj){
 		obj.data={
             "company_no":"${company_no}"
         };
         obj.success=function(data){
             commentListPrint(data.evaluationList);
         };
         $.ajax(obj);
 	}
	 function commentUpdate(evaluation_no){
		 location.href="./evalUpdateForm?evaluation_no="+evaluation_no;
	 }
	 function commentDelete(evaluation_no){
		 var del={};
		 createObj(del);
		 del.url="./evalDelete?evaluation_no="+evaluation_no;
		 del.success=function(data){
			 if(data.success>0){console.log("삭제 성공");}
			 else{console.log("삭제 실패");}
			 
			 ajaxCall(obj);
		 };
		 console.log(del);
		 $.ajax(del);
	 }
	 
	 function commentListPrint(list){
          $("table.table").remove();
          var content="";
          if(list.length==0){
        	  content+="<table class='table'>";
        	  content+="<thead>";
        	  content+="<tr>";
        	  content+="<th class='reply'>작성된 기업평가가 존재하지 않습니다.</th>";
        	  content+="</tr>";
        	  content+="</thead>";
        	  content+="</table>";
        	  $(".table_div").append(content);
          }else{
          
	          //evaluationList[] - evaluation_comment, evaluation_night, evaluation_rest, evaluation_intern, evaluation_vacation
	          list.forEach(function(evaluationDTO,idx){
	        	  var date = new Date(evaluationDTO.evaluation_date);
	        	  var month=date.getMonth()+1;
	        	  
	        	  content="";
	        	  content+="<table class='table'>";
	        	  content+="<thead>";
	        	  content+="<tr>";
	        	  content+="<th class='reply' colspan='7'>코멘트 "+evaluationDTO.evaluation_no+"</th>";
	        	  content+="</tr>";
	        	  content+="<tr>";
	        	  content+="<th>작성일자</th>";
	        	  content+="<th>내용</th>";
	        	  content+="<th>주당야근횟수</th>";
	        	  content+="<th>휴식시간</th>";
	        	  content+="<th>인턴채용</th>";
	        	  content+="<th>연차사용압력</th>";
	        	  content+="<th>수정/삭제</th>";
	        	  content+="</tr>";
	        	  content+="</thead>";
	        	  content+="<tr>";
	        	  //content+="<td class='reply_date'>"+date.getFullYear()+"."+month+"."+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+"</td>";
	        	  content+="<td class='reply_date'>"+dateForm(date)+"</td>";
	        	  content+="<td class='reply_contents'>"+evaluationDTO.evaluation_comment+"</td>";
	        	  content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+evaluationDTO.evaluation_night+".png'/></td>";
	        	  content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+evaluationDTO.evaluation_rest+".png'/></td>";
	        	  content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+evaluationDTO.evaluation_intern+".png'/></td>";
	        	  content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+evaluationDTO.evaluation_vacation+".png'/></td>"; 
	        	  content+="<td class='reply_updel'>";
	        	 if(userID!=null&&userID==evaluationDTO.member_id){
		        	  content+="<button class='button_group pull-right' onclick='commentUpdate("+evaluationDTO.evaluation_no+")'>수정</button>";
		        	  content+="<br>";
		        	  content+="<button class='button_group pull-right' onclick='commentDelete("+evaluationDTO.evaluation_no+")'''>삭제</button>";
	        	 }else if("${sessionScope.member_div}"=="관리자"){
	        		 content+="<button class='div_dont pull-right' onclick='commentDelete("+evaluationDTO.evaluation_no+")'''>삭제</button>";
	        	 }else{
	        		 content+="<div class='div_dont'>수정 불가</div>";
	        	 }
	        	  content+="</td>";
	        	  content+="</tr>";
	        	  content+="</table>";
	        	  $(".table_div").append(content);
          });
          }
      }
	 
	 function evalCheck(company_no){
     	var chk={};
     	chk.url="./evalCheck";
     	chk.type="GET";
     	chk.dataType="JSON";
     	chk.error=function(e){console.log(e)};
     	chk.data={"company_no":company_no};
     	chk.success=function(data){
                if(data.success){
             	   location.href="./evalForm?company_no="+company_no;
                }else{alert(msg);}
             };
             $.ajax(chk);
     }
	 
		function dateForm(now){
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