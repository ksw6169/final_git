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
			
	        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
			.table>tbody>tr>th { text-align: center; }
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
        <div class="detail_div">
          <form action="nBoardUpdate?board_no=${board.board_no}" method="post">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>제목</th>
                       <td class="subject">
                       <textarea class="form-control subject" rows="1" style="padding-bottom: 11px;" name="board_title">${board.board_title}</textarea></td>
                     </tr>
                     
                     <tr>
                       <th colspan="2">내용</th>
					 </tr>
					<tr>
						<td class="write_content" colspan="2">
						<textarea class="form-control" rows="15" name="board_content">${board.board_content}</textarea></td>
					</tr>
                </table>
                     
				<button class="btn btn-default pull-right" >수정 완료</button>
            </div>
          </form> 
            <div class="button-group">
                <button class="btn btn-default pull-right" onclick="location.href='nBoardList'">목록</button>       
            </div>
        </div>
    </div>
</body>
	<script>
/* 	
	var obj = {};
	var board_title = ${board.board_title};
	var board_content = ${board.board_content};
	
	$("#update").click(function(){
		obj.url = "./nBoardUpdate?board_no=${board.board_no}";
		obj.data={ 
				"board_title" : board_title,
				"board_content":board_content};
		obj.success = function(d){
			console.log(d);
			
		}
		ajaxCall();
		
	});
	
	function ajaxCall(){
		$.ajax;
	} */
	</script>
</html>