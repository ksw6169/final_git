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
	        .submenubar_background { position: absolute; width: 100%; height: 100px; background-color: #E4EEF0; }
	        .submenubar_header { font-family: "fallM"; margin-left: 40px; width: 400px; height: 50px; display: inline-block; margin-top: 25px; float: left; }
	        td.submenubar_name {font-family:"fallM"; font-size: 25px; color: #121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
	        .submenubar_detail { font-size: 12px; margin-left: 5px; color: #323838; }
	        .submenubar_description {text-align: left; font-family: "fallM"; border: 1px solid #E4EEF0; font-size: 12px; height: 15px; margin-top: 10px; color: #121F27; background-color: #E4EEF0; }
	        .submenubar_button { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 10px; float: right; background-color: #121F27; cursor: pointer; }
	        .submenubar_button_last { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 100px; float: right; background-color: #121F27; cursor: pointer; }
			select { width: 100%; height: 100%; background-color: #121F27; color: white; font-family: "fallM"; border-radius: 0px; appearance: none; outline: none; 
				display: inline-block; }
			
	        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        /* button -> .btn으로 수정 */
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; height: 25px; line-height: 25px; }
	        .table>tbody>tr>th { text-align: center; }
	        .button-group { margin-top: 15px;}
	
	        .like { background-color: #FF8000; margin: 15px 0 0 15px; }
	
	        .reply { background-color: #121F27; color: white; }
	        .subject, .date { width: 750px; text-align: center; color: #121F27; background-color: #FFFFFF; }
	        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 
	
	        .reply_contents { color: #121F27; background-color: #FFFFFF; height: 75px; line-height: 75px; text-align: left; }
	        .reply_date { color: #121F27; background-color: #FFFFFF; width: 280px; height: 75px; line-height: 75px; text-align: center; }
			td.reply_updel { background-color: #FFFFFF; border: 1px #FFFFFF; width: 80px; }
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center; margin-bottom: 50px; }
			.table>tbody>tr>td.reply_date { vertical-align: middle; border: 1px white; }
			.table>tbody>tr>td.reply_updel { padding: 0px; border-top: 0px; }
			
			.button_group {
				width: 100px;
				height: 37.5px;
				background-color: white;
				color: #121F27;
				border: 0.25px solid #DDDDDD;
			}
			
			.clear1 {
				margin-top: 150px;
			}
			
			.clear2 {
				margin-top: 50px;
			}
    	</style>
  </head>
  <body>
  	<jsp:include page="menubar.jsp"/>
  	
    <div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">김대리의 한마디<b class="submenubar_detail">오늘도 수고한 대리들의 뒷이야기</b></td>
                </tr>
                <tr>
                    <td class="submenubar_description">*대리 회원(직장인 회원)만 글 작성, 열람이 가능합니다.</td>
                </tr>
            </table>
        </div>
		<span class="submenubar_button_last">
			<select name="category">
				<option value="" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IT</option>
				<option value="잡담">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잡담</option>
				<option value="이직">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이직</option>
				<option value="업무질문">&nbsp;&nbsp;&nbsp;&nbsp;업무질문</option>
			</select>
		</span>
        <span class="submenubar_button" onclick="location.href='./pageMove?page=kimSayWrite'">글 작성</span>
    </div>
  	
    <div class="clear1"></div>
    
  <div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th id="board_category" colspan="2"></th>
                     </tr>
                     <tr>
                       <th>제목</th>
                       <td id="board_title" class="subject"></td>
                     </tr>
                     <tr>
                       <th>작성일자</th>
                       <td id="board_date" class="date"></td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
                     </tr>
                     <tr>
                       <td id="board_content" class="contents" colspan="2"></td>
                     </tr>
                </table>

                <button id="like" class="btn like_btn"></button>
            </div>    
            <div class="button-group">
                <button id="delete" class="btn btn-default pull-right">삭제</button>
                <button id="update" class="btn btn-default pull-right">수정</button>
                <button class="btn btn-default pull-right" onclick="location.href='./pageMove?page=kimSayList'">목록</button>
            </div>
        </div>
    </div>
    
    <div class="clear2"></div>
    
    <!-- 댓글 부분 미구현 -->  
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
						<button class="btn btn-default pull-right" style="border-top-width: 0px;">수정</button>
						<br>
                		<button class="btn btn-default pull-right">삭제</button>
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
    var dto={
            board_title:"${board.board_title}",
            board_date:"${board.board_date}",
            board_content:"${board.board_content}",
            board_recom:"${board.board_recom}",
            board_category:"${board.board_category}",
            board_no:"${board.board_no}"
    };
    
    BoardPrint(dto);
    
    function BoardPrint(board){
        console.log(board);
        $("#board_category").html(board.board_category);
        $("#board_title.subject").html(board.board_title);
        $("#board_date.date").html(board.board_date);
        $("#board_content.contents").html(board.board_content);
        $("#like.btn.like_btn").html("추천 "+board.board_recom);
    }
    
    $("#update").click(function(){
		location.href="./kimSayUpdateForm?board_no="+${board.board_no};
	});
    
    $("#delete").click(function(){
		location.href="./kimSayDelete?board_no="+${board.board_no};
	});
	</script>
</html>