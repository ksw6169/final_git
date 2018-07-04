<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
        button:hover { color: #121F27; }
        /* board_detail css */
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
		.table>tbody>tr>th { text-align: center; }
		button.btn.btn-default.send { margin-left: 100px; }
		.email { background-color: #FFFFFF; color: #121F27 }
		.button-group { margin-top: 15px; }
        textarea.form-control { color: #121F27; background-color: #FFFFFF; text-align: center; }
		.subject { background-color: #E4EEF0; }
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
    </style>
  </head>
  <body>
  	<jsp:include page="menubar.jsp"/>
  
  <div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>받는 사람 이메일</th>
                       <td class="email">user001@naver.com</td>
                     </tr>
					 <tr>
                       <th>제목</th>
                       <td class="subject"><textarea class="form-control" rows="1">'김과장이 왜그럴까' 회원가입 신청 미승인</textarea></td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
					 </tr>
					<tr>
						<td class="write_content" colspan="2"><textarea class="form-control" rows="15">안녕하세요. 귀하의 대리(직장인) 회원가입 신청이 승인되지 못했습니다. 사유는 이러이러 합니다.</textarea></td>
					</tr>
                </table>
				<button class="btn btn-default send">전송</button>
				<button class="btn btn-default pull-right">이전</button>
            </div>
        </div>
    </div>
</body>
	<script>
	</script>
</html>