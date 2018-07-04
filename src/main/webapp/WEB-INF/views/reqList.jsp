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
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .table>thead>tr>th { text-align: center; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
    </style>
  </head>
<body>
	<jsp:include page="menubar.jsp"/>

    <div class="container">
        <table class="table table-hover">
            <thead>
             <tr>
               <th>번 호</th>
               <th>ID</th>
               <th>회사명</th>
               <th>회사 캡쳐본</th>
             </tr>
             </thead>
             <tr>
				<td>1</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>2</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>3</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>4</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>5</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>6</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>7</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>8</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>9</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
             <tr>
				<td>10</td>
				<td><a href="#">ksw6169</a></td>
				<td>NHN</td>
				<td>File1.png</td>
             </tr>
        </table>
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