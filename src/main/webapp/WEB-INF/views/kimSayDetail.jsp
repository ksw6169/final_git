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
				margin-right: 230px; float: right; background-color: #121F27; cursor: pointer; }
	        .submenubar_button_last { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 100px; float: right; background-color: #E4EEF0; cursor: pointer; }
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
	
	        .like { background-color: white; margin: 15px 0 0 15px; }
	
	        .reply { background-color: #121F27; color: white; }
	        .subject, .date { width: 750px; text-align: center; color: #121F27; background-color: #FFFFFF; }
	        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 
	
	        .reply_contents { color: #121F27; background-color: #FFFFFF; height: 75px; line-height: 75px; text-align: left; }
	        .reply_date { color: #121F27; background-color: #FFFFFF; width: 280px; height: 75px; line-height: 75px; text-align: center; }
			td.reply_updel { background-color: #FFFFFF; border: 1px #FFFFFF; width: 80px; }
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center; margin-bottom: 50px; }
			.table>tbody>tr>td.reply_date { vertical-align: middle; border: 0.25px solid #DDDDDD; }
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

                <button id="like" class="btn like_btn" onclick="like()"></button>
            </div>    
            <div class="button-group">
                <button id="delete" class="btn btn-default pull-right">삭제</button>
                <button id="update" class="btn btn-default pull-right">수정</button>
                <button class="btn btn-default pull-right" onclick="location.href='./pageMove?page=kimSayList'">목록</button>
            </div>
        </div>
    </div>
    
    <div class="clear2"></div>
    
	<div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table replyTable">
                     <tr>
                       <th class="reply" colspan="4"></th>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
					   <th>작성일자</th>
					   <th style="width: 100px;">수정/삭제</th>
                     </tr>
                </table>
				<textarea class="form-control replyContent" rows="5" name ="replyContent"></textarea>
				<div class="button-group">
                <button class="btn btn-default pull-right replyWrite">댓글 작성</button>
				</div>
            </div>
        </div>
    </div>
</body>
	<script>
		var loginId = "${sessionScope.loginId}";
		var board_no = "${param.board_no}";
		var myLike;
		var replyId;

		
		/* 게시물의 추천수 + 내가 추천했는지 여부 */
		$(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./likeCount",
				data : { 
					loginId : loginId,
					board_no : board_no
				},
				dataType : "json",
				success : function(data) {
					console.log(data.likeCount);
					// 추천 여부 - data.myLike
					myLike = data.myLike;
					
					if(data.myLike == true) {
						$("#like.btn.like_btn").css("background", "#FF8000");
						$("#like.btn.like_btn").css("color", "white");
					} else {
						$("#like.btn.like_btn").css("background", "white");
						$("#like.btn.like_btn").css("color", "black");
					}
					
					 $("#like.btn.like_btn").html("추천 "+data.likeCount);
				},
				error : function(error) {
					console.log(error);
				}
			});
			
			/* 댓글 리스트 불러오기 */
			$.ajax({
				type : "post",
				url : "./replyList",
				data : { 
					board_no : board_no
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					$(".reply").html("댓글 "+data.list.length);
					
					var content = "";
					for(var i=0; i<data.list.length; i++) {
						content += "<tr>";
						content += "<td class='reply_contents' colspan='2' style='padding: 0px;'><textarea name='replyContent' id='replyContent"+data.list[i].reply_no+"' style='width: 100%; height: 100%;' readonly='readonly'>"+data.list[i].reply_content+"</textarea></td>";
						var date = new Date(data.list[i].reply_date);
						content += "<td class='reply_date' style='0.25px solid #DDDDDD;'>"+dateForm(date)+"</td>";
						if(data.list[i].member_id == loginId) {
							content += "<td class='reply_updel' style='width: 100px;'>";
							content += "<button class='btn btn-default pull-right updateBtn"+data.list[i].reply_no+"' onclick='replyUpdate("+data.list[i].reply_no+")' style='border-top-width: 0px;'>수정</button>";
							content += "<br/>";
							content += "<button class='btn btn-default pull-right' onclick='replyDelete("+data.list[i].reply_no+")'>삭제</button>";
							content += "</td>";
						}
						content += "</tr>";
					}
					
					$(".replyTable").append(content);
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		
		/* 추천수 올리기 */
		function like() {
			console.log("myLike : "+myLike);
			
			$.ajax({
				type : "post",
				url : "./like",
				data : { 
					loginId : loginId,
					board_no : board_no,
					myLike : myLike
				},
				dataType : "json",
				success : function(data) {
					console.log("추천 성공성공");
					if(myLike == true) {
						myLike = false;
					} else {
						myLike = true;
					}
					
					if(data.like == true) {
						$("#like.btn.like_btn").css("background", "#FF8000");
						$("#like.btn.like_btn").css("color", "white");
					} else {
						$("#like.btn.like_btn").css("background", "white");
						$("#like.btn.like_btn").css("color", "black");
					}
					
					$("#like.btn.like_btn").html("추천 "+data.likeCount);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	var date = "${board.board_date}";  //날짜 뒤 .0 자름
	var afterStr = date.split('.');
    var dto={
            board_title:"${board.board_title}",
            //board_date:"${board.board_date}",
            board_date:afterStr[0],
            board_content:"${board.board_content}",
            board_recom:"${board.board_recom}",
            board_category:"${board.board_category}",
            board_no:"${board.board_no}",
            member_id:"${board.member_id}"
    };
    BoardPrint(dto);
    function BoardPrint(board){
        console.log(board);
        $("#board_category").html(board.board_category);
        $("#board_title.subject").html(board.board_title);
        $("#board_date.date").html(board.board_date);
        $("#board_content.contents").html(board.board_content);
    }
    
    $("#update").click(function(){
    	if(loginId == ("${board.member_id}")){
			location.href="./kimSayUpdateForm?board_no="+${board.board_no};
    	} else{
    		alert("수정 권한이 없습니다.");
    	}
	});
    
    $("#delete").click(function(){
    	if(loginId == ("${board.member_id}")){
    		location.href="./kimSayDelete?board_no="+${board.board_no};
    	} else{
    		alert("삭제 권한이 없습니다.");
    	}
	});
    
    // 댓글 작성 버튼 클릭시
    $(".replyWrite").click(function() {
    	console.log($(".replyContent").val());
    	
    	$.ajax({
			type : "post",
			url : "./replyWrite",
			data : { 
				loginId : loginId,
				board_no : board_no,
				reply_content : $(".replyContent").val()
			},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href = "./kimSayDetail?board_no="+board_no;
			},
			error : function(error) {
				console.log(error);
			}
		});
    });
    
    // 댓글 수정 버튼 클릭시
    function replyUpdate(reply_no) {
		$("#replyContent"+reply_no).attr("readonly", false);
    	$(".updateBtn"+reply_no).after("<button class='btn btn-default pull-right completeBtn"+reply_no+"' onclick='replyUpdateComplete("+reply_no+")' style='border-top-width: 0px; background: #FF8000; color: white;'>완료</button>");
    	$(".updateBtn"+reply_no).hide();
    }
    
    // 댓글 수정 완료 버튼 클릭시
    function replyUpdateComplete(reply_no) {
		$("#replyContent"+reply_no).attr("readonly", true);
    	$(".completeBtn"+reply_no).hide();
    	$(".updateBtn"+reply_no).show();
    	
    	var updateContent = $("#replyContent"+reply_no).val();
    	
    	$.ajax({
			type : "post",
			url : "./replyUpdate",
			data : { 
				reply_no : reply_no,
				reply_content : updateContent
			},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
			},
			error : function(error) {
				console.log(error);
			}
		});
    }
    
    /* 댓글 삭제 */
    function replyDelete(reply_no) {
    	board_no = "${param.board_no}";
    	
    	$.ajax({
			type : "post",
			url : "./replyDelete",
			data : { 
				reply_no : reply_no,
				board_no : board_no
			},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href = "./kimSayDetail?board_no="+board_no;
			},
			error : function(error) {
				console.log(error);
			}
		});
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