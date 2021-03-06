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
			.form-control { padding: 7px 12px; }
			.button_group{width:100px;height:37.5px;background-color:#fff;color:#121F27;border:.25px solid #DDD;}
			.container{margin-top:100px;}
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
	            <div class="table_div">
	            <form action="nBoardWrite" method="post">
	                <table class="table">
	                     <tr>
	                       <th>제목</th>
	                       <td class="subject" >
	                       <textarea name="board_title" class="form-control subject" rows="1" placeholder="제목을 입력해주세요." style="padding-bottom: 11px;"></textarea></td>
	                     </tr>
	                     <tr>
	                       <th colspan="2">내용</th>
						 </tr>
						<tr>
							<td class="write_content"  colspan="2">
							<textarea id="board_content" name="board_content" class="form-control" rows="15" placeholder="내용을 입력해주세요."></textarea></td>
						</tr>
	                </table>
	                
					<button class="btn btn-default pull-right">작성 완료</button>
					</form>
	            </div>    
	            <div class="button-group">
	                <button class="btn btn-default pull-right" onclick="list()">목록</button>       
	            </div>
	        </div>
	    </div>
	</body>
	<script>
		function list(){
			location.href ="./nBoardListForm";
		}

		//글자수 제한 
		$(document).ready(function() {
			$("#board_content").on('keyup',function(){
				if($(this).val().length > 500) {
		        	$(this).val($(this).val().substring(0, 500));
		        	alert("글자수를 초과하셨습니다 !");
		        }
			});  
		});
	</script>
</html>