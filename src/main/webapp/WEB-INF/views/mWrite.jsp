<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String loginId = request.getParameter("member_id");
	
%> 
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
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
			
	        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { width: 250px; font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        .table>tbody>tr>th { text-align: center; }
	        .button-group { margin-top: 15px;}
	        .subject { color: white; background-color: #848484; }
			.contents { color: #121F27; background-color: #FFFFFF; height: 350px; line-height: 100px; text-align: left; } 
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center;}
			.table>tbody>tr>td.write_content { background-color: #E4EEF0; padding: 0px; }
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
			
			/* submenuBar 링크 글자 색상 */
		.submenubar_button a{ color: white;}
		.submenubar_button_last a{color: white;}
		.submenubar_button a:hover{color: #FF8000; background-color: #121F27;text-decoration: none;}
		.submenubar_button_last a:hover{color: #FF8000; background-color: #121F27; text-decoration: none;}
    	</style>
  </head>
  <body>
  <jsp:include page="menubar.jsp"/>
  
    <div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">쪽지함</td>
                </tr>
            </table>
        </div>
	        <span id="AdminWrite" class="submenubar_button_last"><a href="./pageMove?page=mWrite">쪽지 작성</a></span>
	        <span class="submenubar_button"><a href="./pageMove?page=sendMlist">보낸 쪽지함</a></span>
	        <span class="submenubar_button"><a href="./pageMove?page=getMlist">받은 쪽지함</a></span>
    </div>
  
  <div class="container">
        <div class="detail_div">
        <form action="./messagewrite" method="post">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>받는 사람</th>
                       <td class="subject" ><input type="hidden" value="admin" name="message_receive"/>관리자</td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
                     </tr>
                     <tr>
						<td class="write_content" colspan="2">
						<textarea id="message_content" class="form-control" rows="15" placeholder="내용을 입력해주세요." name="message_content"></textarea></td>
					 </tr>
                </table>
            <button class="btn btn-default pull-right">작성 완료</button>
            </div>   
            </form> 
            <div class="button-group">
                <button class="btn btn-default pull-right">목록</button>       
            </div>
        </div>
    </div>
</body>
<script>



		$(document).ready(function(){ 
			session();
			adminCK();
			//글자수 제한
			$("#message_content").on('keyup',function(){
				if($(this).val().length > 100) {
		        	$(this).val($(this).val().substring(0, 100));
		        	alert("글자수를 초과하셨습니다 !");
		        }
			});
		});

	function session(){
		var id = "${sessionScope.loginId}";
		console.log(id);
		
		
	}
	
	//관리자 접속 체크 및 공지사항 작성 버튼 활성/비활성화 
	 function adminCK(){
		 	var id = "${sessionScope.loginId}"
			var div = "${sessionScope.membe_div}"
				console.log(id +"/"+div);
			if(id != "admin" && div != "관리자"){
				$("#AdminWrite").show();
			}else{
				$("#AdminWrite").hide();
				}
		}
	
</script>

</html>