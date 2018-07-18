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
			.submenubar_header{font-family:fallM;margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:25px;float:left;}
			td.submenubar_name{text-align: left; font-family:"fallM"; font-size:25px;color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:12px;margin-left:5px;color:#323838;}
			.submenubar_description{font-family: "fallM"; background-color: #E4EEF0; border: 1px solid #E4EEF0; font-size:12px;height:15px;margin-top:10px;color:#121F27;}
			.submenubar_button,.submenubar_button_last{width:120px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:100px;}
		
			
	        body { padding-top: 100px; }
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; height: 25px; line-height: 25px; }
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
				width: 430px;
			
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
	          text-align: center;
	        }
			
			.page-link {
				width: 200px;
			}
			
			
			select {
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
			
			.container {
				margin-top: 100px;
			}
    	</style>
  </head>
<body>
	<jsp:include page="menubar.jsp"/>

    <div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">모르면 물어봐<b class="submenubar_detail">정규직을 향한 인턴들의 폭풍 질문</b></td>
                </tr>
                <tr>
                    <td class="submenubar_description">*대리 회원(직장인 회원)과 인턴 회원(비직장인 회원) 전부 글 작성, 열람이 가능합니다.</td>
                </tr>
            </table>
        </div>
        <span id="write" class="submenubar_button" onclick="writeForm()">글 작성</span>
    </div>

	<div class="container">
		<div class="center-block search_div">
			<input id="search_text" type="text" placeholder="검색어를 입력해주세요.">
			<button class="search_btn" onclick="kimSaySearch()">검색</button>
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
		<div id="pagingAdd"></div>		
	</div>
	<div class="container-fluid">
		<div class="paging_button">
		  <ul class="pagination pagination-lg">
		    <li class="page-item disabled">
		      <a id="more" class="page-link" href="#" tabindex="-1">더보기</a>
		    </li>
		  </ul>
		</div>
	</div>
</div>
</body>
	<script>
	/* 회원 권한 & 페이징 변수 */
    var member_div = "${sessionScope.member_div}";		
    var job_no;	
    
    /* 페이징 변수 */
    var startPage = 1;
    var endPage = 15;
    
    /* 더보기 요청 구분 */
    var search_div = false;
    
    /* 게시글 리스트 호출 */
	function kimSayList(){
		$.ajax({
			type : "get",
			url : "./kimSayList",
			data : {
				job_no: job_no,
				startPage: startPage,
				endPage: endPage
			},
			success : function(data) {
				boardPrint(data.list);
				
				if((data.listCnt)-1 >= endPage) {
					$(".page-item").removeClass("disabled");
				} else {
					$(".page-item").addClass("disabled");
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
    /* 게시글 리스트 출력 */
	function boardPrint(list){
		var str = "";
		for(var i=0; i<list.length; i++) {
			str+="<div class='col-md-4'>";
	        str+="<div class='thumbnail'>";
	        str+="<a href='./kimSayDetail?board_no="+list[i].board_no+"'><div id='title' class='thumbnail_header'><p class='thumbnail_contents'>"+list[i].board_title+"</p></div></a>";
	        var date = new Date(list[i].board_date);	
	        str+="<span class='caption_date'>작성일자: <b>"+date.toLocaleDateString("ko-KR")+"</b></span>";
	        str+="<span class='caption_detail'>조회<br/><b>"+list[i].board_bHit+"</b></span>";
	        str+="<span class='caption_detail'>추천<br/><b>"+list[i].board_recom+"</b></span>";
	        str+="<span class='caption_detail'>댓글<br/><b>"+list[i].board_comm+"</b></span>";
	        str+="</div>";
	        str+="</div>";
		}
		$("#pagingAdd").append(str);
		// $(".page-link").focus();
	}
    
    /* 더보기 버튼 클릭 시 */
    $("#more").click(function(){
    	startPage += 15;
    	endPage += 15;

    	console.log("search_div: "+search_div);
    	if(search_div) {
    		console.log("김세이서치 더보기 호출");
    		kimSaySearch();
    	} else {
    		console.log("김세이리스트 더보기 호출");
    		kimSayList();
    	}
    });
    
    /* 키워드 검색 */
    function kimSaySearch() {
		$(".page-link").focus();
    	search_div = true; 
    	if($("#search_text").val() == "") {
    		alert("검색 키워드를 입력하세요.");
    	} else {
    		$(".col-md-4").remove();
    		$.ajax({
    			type : "post",
    			url : "./kimSaySearchList",
    			data : {
    				keyword : $("#search_text").val(),
    				category : $(".custom_select2 option:selected").val(),
    				job_no : job_no,
    				startPage : startPage,
 					endPage : endPage   				
    			},
    			dataType : "json",
    			success : function(data) {
    				boardPrint(data.list);
    				
    				if((data.listSearchCnt)-1 >= endPage) {
    					$(".page-item").removeClass("disabled");
    				} else {
    					$(".page-item").addClass("disabled");
    				}
    			},
    			error : function(error) {
    				console.log(error);
    			}
    		});	
    	}
    }
    
    /* 상단의 직종 select 값이 바뀌면, 게시글 리스트를 비우고, 직종 값에 맞게 리스트 불러옴 */
    $(".custom_select").change(function() {
    	job_no = $(".custom_select option:selected").val();
    	$(".col-md-4").remove();
    	
    	startPage = 1;
    	endPage = 15;
    	kimSayList();
    });
    
    /* 글쓰기 폼으로 이동 */
    function writeForm() {
    	location.href='./pageMove?page=kimSayWrite&job_no='+job_no;
    }
	
	</script>
</html>