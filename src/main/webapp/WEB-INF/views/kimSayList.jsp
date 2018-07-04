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
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
        .paging_button { text-align: center;}
        .page-link { font-family: "bareun"; }
		
		/* a Link 속성(밑줄 등) 제거 */
		a:link { color: #121F27; text-decoration: none;}
 		a:visited { color: #121F27; text-decoration: none;}
 		a:hover { color: #121F27; text-decoration: none;}
		
		.thumbnail_header {
			text-align: center;
			vertical-align: middle;
			width: 100%;
			height: 250px;
			font-size: 15px;
			font-family: "bareun";
			border: 0.25px solid #DDDDDD;
			background-color: #121F27;
			color: white;
		}
		
		
		.caption_detail {
			margin: 0 auto;
			float: left;
			width: 33.3%;
			height: 50px;
			text-align: center;
			font-family: "fallM";
			font-size: 12px;
			background-color: #E4EEF0;
			white-space: pre-line;
			padding-top: 7px;
			border: 0.25px solid #DDDDDD;
		}
		
		.thumbnail {
			height: 335px;
		}
		
		.thumbnail_contents {
			width: 100%;
			height: 200px;
			margin-top: 105px;
			text-align: center;
			white-space: pre-line;
		}
		
		.search_div {
			margin-top: 50px;
			margin-bottom: 150px;
			text-align: center;
			width: 530px;
		}
		
		input[type='text'] {
            font-size:13px;
            padding:10px;
            width: 350px;
            height: 50px;
            line-height: 40px;
            outline:none;
            margin: 5px 0;
            display: inline;
            float: left;
        }
		
		.search_btn {
          font-family: "bareun";
          color: #fff;
          background-color: #121F27;
          width: 75px;
          height: 50px;
          font-size: 14px;
		  float: left;
		  margin: 5px 0 5px 0;
          border: 0px;
        }
		
		.page-link {
			width: 200px;
		}
		
		
		.custom_select {
			width: 100px; /* 원하는 너비설정 */ 
			height: 50px;
			font-family: inherit; /* 폰트 상속 */ 
			border: 1px solid #999; 
			border-radius: 0px; /* iOS 둥근모서리 제거 */ 
			appearance: none;
			display: inline-block;
		  	margin: 5px 5px 5px 0;
		  	float: left;
		}
		
		.caption_date {
			margin: 0 auto;
			float: left;
			width: 100%;
			height: 25px;
			line-height: 25px;
			text-align: center;
			font-family: "fallM";
			font-size: 12px;
			background-color: #E4EEF0;
			white-space: pre-line;
			border: 0.25px solid #DDDDDD;
		}
		
    </style>
  </head>
<body>
	<jsp:include page="menubar.jsp"/>


	<div class="container">
		<div class="center-block search_div">
			
			<select class="custom_select"> 
				<option value="전체" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체</option> 
				<option value="잡담">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잡담</option> 
				<option value="이직">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이직</option> 
				<option value="업무 질문">&nbsp;&nbsp;&nbsp;&nbsp;업무 질문</option>
			</select>
			
			<input type="text" placeholder="검색어를 입력해주세요.">
			<button class="search_btn">검색</button>
		</div>
		
        <div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"><div class="thumbnail_header"><p class="thumbnail_contents">안녕안녕안녕안녕안녕
						안녕안녕안녕안녕안녕</p></div></a>
					<span class="caption_date">작성일자: <b>2018-07-03 13:07</b></span>
					<span class="caption_detail">조회<br/><b>1</b></span>
					<span class="caption_detail">추천<br/><b>1</b></span>
					<span class="caption_detail">댓글<br/><b>1</b></span>
				</div>
			</div>
		</div>
		
        <div class="paging_button">
          <ul class="pagination pagination-lg">
            <li class="page-item disabled">
              <a class="page-link" href="#" tabindex="-1">더보기</a>
            </li>
          </ul>
        </div>
    </div>
</body>
	<script>
	</script>
</html>