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
        th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
        .button-group { margin-top: 15px;}

        .like { background-color: #FF8000; margin: 15px 0 0 15px; }

        .reply { background-color: #121F27; color: white; }
        .subject, .date { color: #121F27; background-color: #FFFFFF; }
        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 

        .reply_contents { color: #121F27; background-color: #FFFFFF; height: 75px; line-height: 75px; text-align: left; }
        .reply_date { color: #121F27; background-color: #FFFFFF; width: 280px; height: 75px; line-height: 75px; text-align: center; }
		td.reply_updel { background-color: #FFFFFF; border: 1px #FFFFFF; width: 80px; }
        .detail_div { margin-top: 50px;}
        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center;}
		.table>tbody>tr>td.reply_date { vertical-align: middle; border: 1px white; }
		.table>tbody>tr>td.reply_updel { padding: 0px; border-top: 0px; }
		
		.button_group {
			width: 100px;
			height: 37.5px;
			background-color: white;
			color: #121F27;
			border: 0.25px solid #DDDDDD;
		}
    </style>
  </head>
  <body>
  <jsp:include page="menubar.jsp"/>
  
  <div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>제목</th>
                       <td class="subject">취업 질문</td>
                     </tr>
                     <tr>
                       <th>작성일자</th>
                       <td class="date">2018-06-26 14:32</td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
                     </tr>
                     <tr>
                       <td class="contents" colspan="2">내용내용</td>
                     </tr>
                </table>

                <button class="btn like_btn">추천 5</button>
            </div>    
            <div class="button-group">
                <button class="btn btn-default pull-right">삭제</button>
                <button class="btn btn-default pull-right">수정</button>
                <button class="btn btn-default pull-right">목록</button>       
            </div>
        </div>
    </div>
      
      
	<div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th class="reply" colspan="4">댓글 3</th>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
					   <th>작성일자</th>
					   <th>수정/삭제</th>
                     </tr>
                     <tr>
                       <td class="reply_contents" colspan="2">너무 걱정하지 마세요~ ^0^</td>
					   <td class="reply_date">2018-06-26 15:20</td>
					   <td class="reply_updel">
						<button class="button_group pull-right">수정</button>
						<br>
                		<button class="button_group pull-right">삭제</button>
					   </td>
                     </tr>
                </table>
				<textarea class="form-control" rows="5" ></textarea>
				<div class="button-group">
                <button class="btn btn-default pull-right replyWrite">댓글 작성</button>
				</div>
            </div>
        </div>
		
    </div>
</body>
	<script>
	</script>
</html>