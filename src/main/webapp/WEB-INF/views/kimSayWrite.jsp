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
        select {
         width: 100%; /* 원하는 너비설정 */ 
         padding-left: 46.4%;
		 height: 50px;
         background-color: #121F27;
		 color: white;
		 font-family: "fallM"; /* 폰트 상속 */ 
         font-weight: bold;
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
		.form-control { padding: 7px 12px;}
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
                       
						   <select name="category">
						      <option value="" selected="selected">카테고리</option>
							  <option value="잡담">&nbsp;&nbsp;잡담</option>
							  <option value="이직">&nbsp;&nbsp;이직</option>
							  <option value="업무질문">업무질문</option>
						   </select>
					   
                     </tr>
                     <tr>
                       <th>제목</th>
                       <td class="subject"><textarea class="form-control subject" rows="1" placeholder="제목을 입력해주세요."></textarea></td>
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
	<script>
	</script>
</html>