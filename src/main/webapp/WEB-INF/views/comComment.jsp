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
			
			/* main css */
	        button { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { background-color: #FF8000; }

	        td { font-family: "NanumL"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        .table>thead>tr>th { font-family: "NanumL"; text-align: center; vertical-align: middle;  background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; font-size: 14px; }
	        .reply { background-color: #E5EDF0; color: #121F27; border: 1px solid #DDDDDD;}
	        .reply_contents { color: #121F27; background-color: #FFFFFF; width:500px; height: 75px; text-align: left; vertical-align: top; padding: 5px; word-break:break-all;}
	        .reply_date { color: #121F27; background-color: #FFFFFF; width:75px; height: 75px; line-height: 75px; text-align: center; } /* width 삭제 */
			.table>tbody>tr>td.reply_date { vertical-align: middle; border: 1px white; width: 75px;}
			td.reply_updel { width: 75px; }
			.button_group, .div_dont{background-color:#121F27;color:#fff;font-family:bareun; }
			.button_group{width:100%;height:50%;border:.25px solid #fff; }
			.div_dont, .td_star{width:100px;line-height:75px; }
			.div_dont{height:75px;border:1px solid #E4EEF0; }
			.star_grade{height:15px; }
			.td_star{color:#121F27;background-color:#FFF;height:75px;text-align:center;vertical-align:middle; }
			
			.container{margin-top:150px; }			
    	</style>
  </head>
  <body>  
  	<jsp:include page="menubar.jsp" flush="false"/>
  	
  	<!-- Submenubar -->
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
       	<table class="table">
       		<thead>
       			<tr>
       				<th class="reply" colspan="7">코멘트</th>
       			</tr>
       			<tr>
          			<th style="width: 200px;">작성일자</th>
               		<th style="width: 200px;">내용</th>
               		<th>주당야근횟수</th>
               		<th>휴식시간</th>
	                <th>인턴채용</th>
	                <th>연차사용압력</th>
					<th>수정/삭제</th>
              </tr>
       		</thead>
       		<!-- append: thead.after() -->
       	</table>
   	</div>
	</body>
	<script>
		var obj={};
		var userID="${sessionScope.loginId}";
		
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
	 
		/* 코멘트 수정 */
		function commentUpdate(evaluation_no){
			location.href="./evalUpdateForm?evaluation_no="+evaluation_no;
		}
	 
		/* 코멘트 삭제 */
		function commentDelete(evaluation_no){
			var del={};
			createObj(del);
			del.url="./evalDelete?evaluation_no="+evaluation_no;
			del.success=function(data){
				if(data.success>0){
					alert("댓글 삭제에 성공했습니다.");
				} else { 
					alert("댓글 삭제에 실패했습니다.");
				}
				ajaxCall(obj);
			};
			$.ajax(del);
		}
	 	
		/* 코멘트 리스트 출력 */
		function commentListPrint(list){
			var content="";
			$("table.table > tr").remove();
			if(list.length==0){
				content += "<tr>";
				content += "<td colspan=7 style='height:300px; line-height: 300px; background: #E4EEF0; color: black; font-size: 25px; font-family: bareun;'>작성된 기업평가가 존재하지 않습니다.</td>";
				content += "</tr>";
				
				$("thead").append(content);
			} else {
				var content = "";
				
				for(var i=0; i<list.length; i++) {
					var date = new Date(list[i].evaluation_date);
		        	var month = date.getMonth()+1;
					
		        	content += "<tr>";
					content += "<td class='reply_date' style='width: 100px;'>"+dateForm(date)+"</td>"; 
					content += "<td class='reply_contents'>"+list[i].evaluation_comment+"</td>";
					content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+list[i].evaluation_night+".png'/></td>";
	        	    content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+list[i].evaluation_rest+".png'/></td>";
	        	    content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+list[i].evaluation_intern+".png'/></td>";
	        	    content+="<td class='td_star'><img class='star_grade' src='./resources/image/star_"+list[i].evaluation_vacation+".png'/></td>"; 
					
	        	    content += "<td class='reply_updel'>";
	        	    
					if(userID != null && userID == list[i].member_id){
			        	  content+="<button class='button_group pull-right' onclick='commentUpdate("+list[i].evaluation_no+")'>수정</button>";
			        	  content+="<br>";
			        	  content+="<button class='button_group pull-right' onclick='commentDelete("+list[i].evaluation_no+")'''>삭제</button>";
		        	 }else if("${sessionScope.member_div}"=="관리자"){
		        		 content+="<button class='div_dont pull-right' onclick='commentDelete("+list[i].evaluation_no+")'''>삭제</button>";
		        	 }else{
		        		 content+="<div class='div_dont'>수정 불가</div>";
		        	 }
					 content += "</td>";
					 content += "</tr>";
				}
				$("thead").after(content);
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