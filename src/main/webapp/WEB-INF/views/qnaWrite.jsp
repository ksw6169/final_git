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
			.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:25px;float:left;}
			td.submenubar_name{text-align: left; font-family:"fallM"; font-size:25px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:12px;margin-left:5px;color:#323838;}
			.submenubar_description{font-family: "fallM"; background-color: #E4EEF0; border: 1px solid #E4EEF0; font-size:12px;height:15px;margin-top:10px;color:#121F27;}
			.submenubar_button,.submenubar_button_last{width:120px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
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
                    <td class="submenubar_name">모르면 물어봐<b class="submenubar_detail">정규직을 향한 인턴들의 폭풍 질문</b></td>
                </tr>
                <tr>
                    <td class="submenubar_description">*대리 회원(직장인 회원)과 인턴 회원(비직장인 회원) 전부 글 작성, 열람이 가능합니다.</td>
                </tr>
            </table>
        </div>
        <span class="submenubar_button_last">글 작성</span>
    </div>
  
  <div class="container">
        <div class="detail_div">
        <form id="sendForm" method="post">
            <div class="table_div">
                <table class="table">
                     <input name="member_id" type="hidden" value="${sessionScope.loginId}"/>
                     <input name="board_category" type="hidden" value="물어봐"/>
                     <tr>
                       <th>제목</th>
                       <td class="subject"><textarea name="board_title" id="title_textarea" onKeyPress="javascript: if (event.keyCode==13) return false;" class="form-control subject" rows="1" placeholder="제목을 입력해주세요." style="padding-bottom: 11px;"></textarea></td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
					 </tr>
					<tr>
						<td class="write_content" colspan="2"><textarea name="board_content" id="content_textarea" class="form-control" rows="15" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
                </table>
                
				<button id="save" class="btn btn-default pull-right">작성 완료</button>
            </div> 
            </form>   
            <div class="button-group">
                <button id="list" class="btn btn-default pull-right">목록</button>       
            </div>
        </div>
    </div>
</body>
	<script>
		$(document).ready(function() {
	        var loginId = "${sessionScope.loginId}";
	        console.log(loginId);
		});
		
		$("#save").click(function(){
			if($("#title_textarea").val()==""){
				alert("제목을 입력해주세요.");
				$("#title_textarea").focus();
			}else if($("#content_textarea").val() == ""){
				alert("내용을 입력해주세요");
			}else{
				console.log("전송");
				$("#sendForm").attr("action", "./qnaWrite");
				var word=$("#content_textarea").val();
	        	word=word.replace(/\n/gi,"<br>");
	        	$("#content_textarea").val(word);
				$("#sendForm").submit();
			}
		});
		
		$("#list").click(function(){
			location.href='./pageMove?page=qnaList';
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