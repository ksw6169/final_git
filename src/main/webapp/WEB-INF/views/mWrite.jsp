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
        th { width: 250px; font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
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
    </style>
  </head>
  <body>
  <jsp:include page="menubar.jsp"/>
  
  <div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>받는 사람</th>
                       <td class="subject">관리자</td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
                     </tr>
                     <tr>
						<td class="write_content" colspan="2"><textarea class="form-control" rows="15" placeholder="내용을 입력해주세요."></textarea></td>
					 </tr>
                </table>
            <button class="btn btn-default pull-right">작성 완료</button>
            </div>    
            <div class="button-group">
                <button class="btn btn-default pull-right">목록</button>       
            </div>
        </div>
    </div>
</body>
</html>