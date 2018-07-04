<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
    <style>
        body { padding-top: 100px; }
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        th.center{ text-align: center;}
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
    </style>
	</head>
	<body>
		<jsp:include page="menubar.jsp" flush="false"/>
		
	    <div class="container">
	        <h1 class="content">받은 쪽지함</h1>
	        <table class="table table-hover">
	            <thead>
	             <tr>
	               <th class="center"><input type="checkbox"/></th>
	               <th class="center">번 호</th>
	               <th class="center">내   용</th>
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