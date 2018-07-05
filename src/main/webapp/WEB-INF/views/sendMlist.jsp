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
        .submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0; }
		.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:35px;float:left;}
		td.submenubar_name{font-family:"fallM"; font-size:30px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
		.submenubar_detail{font-size:10px;margin-left:5px;}
		.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
		.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
			margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
		.submenubar_button{margin-right:10px;}
		.submenubar_button_last{margin-right:100px;}
    	
        body { padding-top: 100px; }
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        th.center{text-align: center;}
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .table>thead>tr>th { text-align: center; vertical-align: middle; }
        th>input[type='checkbox'] { position:relative; top:-4px; }
        
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
        
		.container {
			margin-top: 150px;
		}
        
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
	        <span class="submenubar_button_last">쪽지 작성</span>
	        <span class="submenubar_button">보낸 쪽지함</span>
	        <span class="submenubar_button">받은 쪽지함</span>
	    </div>
		
	    <div class="container">
	        <h1 class="content">보낸 쪽지함</h1>
	        <table class="table table-hover">
	            <thead>
	             <tr>
	               <th class="center"><input type="checkbox"/></th>
	               <th class="center">번 호</th>
	               <th class="center">내 용</th>
	               <th class="center">작성일자</th>
	             </tr>
	             </thead>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>1</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>2</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:49</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>3</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>4</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>5</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>6</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>7</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>8</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>9</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	             <tr>
	               <td><input type="checkbox"/></td>
	               <td>10</td>
	               <td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
	               <td>2018-09-10 10:48</td>
	             </tr>
	        </table>
	        <button class="btn btn-default pull-right">삭제</button>
	        <div class="paging_button">
	          <ul class="pagination">
	            <li class="page-item disabled">
	              <a class="page-link" href="#" tabindex="-1">이전 페이지</a>
	            </li>
	            <li class="page-item">
	              <a class="page-link" href="#">다음 페이지</a>
	            </li>
	          </ul>
	        </div>
	    </div>
	</body>
	<script>
	</script>
</html>