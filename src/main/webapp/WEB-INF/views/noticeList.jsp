<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    
   	 	<title>bootstrap</title>

    	<!-- Bootstrap -->
    	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/css/kfonts2.css" rel="stylesheet">
    	<link href="./resources/css/custom.css" rel="stylesheet">
      
    <style>
        body { padding-top: 100px; }
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
        
        .search {
            text-align: center;
            margin-bottom: 50px;
        }
        
        
        
        input[type='text'] {
            font-size:13px;
            height: 40px;
            padding:10px;
            width:400px;
            display: inline-block;
            
        }
        
        .search_group {
            text-align: center;
            margin-bottom: 50px;
        }
        
        span.input-group-addon {
          width: 50px;
          height: 40px;
          vertical-align: top;
          line-height: 35px;
          font-family: "bareun";
          display: inline-block;
          border: 0px;
          color: #fff;
          background-color: #121F27;
          font-size: 13px;
          cursor: pointer;
          margin-left: -4px;
        }
        
        button {
          width: 75px;
          height: 30px;
          vertical-align: top;
          line-height: 30px;
          font-family: "bareun";
          border: 0px;
          color: #fff;
          background-color: #121F27;
          font-size: 13px;
          cursor: pointer;
        }
    </style>
  </head>
	<body>
	    <div class="container">
	        <div class="search_group">
	            <input type="text" placeholder="제목+내용을 입력해주세요."/>
	            <span class="input-group-addon">
	                <span class="glyphicon glyphicon-search"></span>
	            </span>
	        </div>
	        <table class="table table-hover">
	            <thead>
	             <tr>
	               <th>번 호</th>
	               <th>제 목</th>
	               <th>작성일자</th>
	               <th>조회수</th>
	             </tr>
	             </thead>
	             <tr>
	               <td>1</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>2</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>3</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>4</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>5</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>6</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>7</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>8</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>9</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr>
	               <td>10</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             
	        </table>
	        <button class="pull-right">글 작성</button>
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