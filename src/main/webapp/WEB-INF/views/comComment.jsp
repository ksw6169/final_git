<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
        button { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
        button:hover { color: #121F27; }
        /* board_detail css */
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
        .table>thead>tr>th { font-family: "fallM"; text-align: center; vertical-align: middle;  background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }

        .like { background-color: #FF8000; margin: 15px 0 0 15px; }

        .reply { background-color: #E5EDF1; color: #121F27; border: 1px solid #DDDDDD;}
        .subject, .date { color: #121F27; background-color: #FFFFFF; }
        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 

        .reply_contents { color: #121F27; background-color: #FFFFFF; height: 75px; line-height: 75px; text-align: left; }
        .reply_date { color: #121F27; background-color: #FFFFFF; width: 280px; height: 75px; line-height: 75px; text-align: center; }
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
        
        .star_grade {
        	height: 15px;
        }
        
        .td_star { color: #121F27; background-color: #FFFFFF; width: 100px; height: 75px; line-height: 75px; text-align: center; vertical-align: middle; }
    </style>
  </head>
  <body>  
  	<jsp:include page="menubar.jsp" flush="false"/>
  
	<div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
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
                </table>
            </div>
        </div>
		
    </div>
</body>
	<script>
	</script>
</html>