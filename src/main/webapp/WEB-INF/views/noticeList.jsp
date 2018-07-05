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
    
        body { padding-top: 100px; }
        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        th.center{text-align: center;}
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; height: 25px; line-height: 25px; }
        .table>thead>tr>th { text-align: center; vertical-align: middle; }
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
            margin-top: 50px;
            margin-bottom: 50px;
            margin-top : 30px;
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
          text-align: center;
        }
        
        button.pull-right {
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
        
        .clear {
        	height: 7px;
        }
        
        .pull-right{
	        color : white;
        }

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
	                    <td class="submenubar_name">공지합니다<b class="submenubar_detail">공지사항</b></td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    
	    <div class="container">
	        <div class="search_group">
	            <input type="text" placeholder="제목+내용을 입력해주세요."/>
	            <span class="input-group-addon">
	            	<div class="clear"></div>
	                <span class="glyphicon glyphicon-search"></span>
	            </span>
	        </div>
	        <table class="table table-hover">
	            <thead>
	             <tr>
	               <th class="center">번 호</th>
	               <th class="center">제 목</th>
	               <th class="center">작성일자</th>
	               <th class="center">조회수</th>
	             </tr>
	             </thead>
	             <tr class="center">
	               <td>1</td>
	               <td><a href="#">내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></td>
	               <td>2018-09-10 10:50</td>
	               <td>1</td>
	             </tr>
	             <tr class="center">
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