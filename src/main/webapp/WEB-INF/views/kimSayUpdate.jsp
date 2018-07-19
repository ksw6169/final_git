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
	        .submenubar_description {text-align: left;  font-family: "fallM"; background-color: #E4EEF0; border: 1px solid #E4EEF0;  font-size: 12px; height: 15px; margin-top: 10px; color: #121F27; }
	        .submenubar_button { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 10px; float: right; background-color: #121F27; cursor: pointer; }
	        .submenubar_button_last { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 100px; float: right; background-color: #121F27; cursor: pointer; }
			select { width: 100%; height: 100%; background-color: #121F27; color: white; font-family: "fallM"; border-radius: 0px; appearance: none; outline: none; 
				display: inline-block; }
			
			
	        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; height: 25px; line-height: 25px; }
	        .table>tbody>tr>th { text-align: center; }
	        .category {
	         width: 100%; /* 원하는 너비설정 */ 
	         padding-left: 46.5%;
			 height: 50px;
	         background-color: #121F27;
			 color: white;
			 font-family: "fallM"; /* 폰트 상속 */ 
	         font-weight: bold;
			 font-size: medium;
			 border: 1px solid #999; 
	         border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	         appearance: none;
			 outline: none;
	         display: inline-block;
	           margin: 3px 3px 3px 0;
	           float: left;
	        }
			option { background-color: #DDDDDD; color: #121F27; border: 1px black; }
			.button-group { margin-top: 15px; }
	        .subject, .date { color: #121F27; background-color: #FFFFFF; }
			.table>tbody>tr>td.subject { padding: 0px; }
	        .contents { color: #121F27; background-color: #FFFFFF; height: 200px; line-height: 100px; text-align: left; } 
			.table>tbody>tr>td.write_content { background-color: #E4EEF0; padding: 0px; }
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center;}
			.form-control { padding: 7px 12px; color: #121F27; }
			.button_group {
				width: 100px;
				height: 37.5px;
				background-color: white;
				color: #121F27;
				border: 0.25px solid #DDDDDD;
			}
			
			.container {
				margin-top: 100px;
				margin-bottom: 50px;
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
    </div>
  <div class="container">
        <div class="detail_div">
        <form id="sendForm" action="kimSayUpdate" method="post"> 
            <div class="table_div">
                <table class="table">
                     <tr>
						   <select id="board_category" name="category" class="category" style="margin-bottom: 0px;">
							  <option id="talk" value="잡담">&nbsp;&nbsp;잡담</option>
							  <option id="trans" value="이직">&nbsp;&nbsp;이직</option>
							  <option id="que" value="업무질문">업무질문</option>
						   </select>
                     </tr>
                     <!-- <tr>
                       <th id="board_category" colspan="2"></th>
                     </tr> -->
                     <input name="board_no" type="hidden" value="${param.board_no}"/>
                     <tr>
                       <th>제목</th>
                       <td id="board_title" class="subject"><textarea name="board_title" id="title_textarea" class="form-control subject" rows="1" style="padding-bottom: 11px;"></textarea></td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
					 </tr>
					<tr>
						<td id="board_content" class="write_content" colspan="2"><textarea name="board_content" id="content_textarea" class="form-control" rows="15"></textarea></td>
					</tr>
                </table>
                
				<button id="update" class="btn btn-default pull-right">수정 완료</button>
            </div>
            </form>    
            <div class="button-group">
                <button class="btn btn-default pull-right" onclick="location.href='./pageMove?page=kimSayList'">목록</button>       
            </div>
        </div>
    </div>
</body>
	<script>
	var dto={
            board_title:"${board.board_title}",
            board_content:"${board.board_content}",
            board_category:"${board.board_category}"
    };
    
    BoardPrint(dto);
    
    function BoardPrint(board){
        console.log(board);
        
        if(board.board_category == "잡담") {
        	$("#talk").attr("selected", "selected");
        } else if(board.board_category == "이직") {
        	$("#trans").attr("selected", "selected");
        } else {
        	$("#que").attr("selected", "selected");
        }
        $("#title_textarea").text(board.board_title);
        $("#content_textarea").text(board.board_content);
    }
    
    $("#update").click(function(){
		if($("#title_textarea").val()==""){
			alert("제목을 입력해주세요.");
			location.href="./kimSayUpdateForm?board_no="+${board.board_no};
			console.log("제목 미입력");
		}else if($("#content_textarea").val() == ""){
			alert("내용을 입력해주세요");
		}else{
			$("#sendForm").submit();
		}
	});
    
  	//글자수 제한
    $("#title_textarea").on('keyup',function(){
        if($(this).val().length > 20) {
            $(this).val($(this).val().substring(0, 20));
            alert("글자수를 초과하셨습니다 !");
        }
    });
    
    $("#content_textarea").on('keyup',function(){
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            alert("글자수를 초과하셨습니다 !");
        }
    });
	</script>
</html>