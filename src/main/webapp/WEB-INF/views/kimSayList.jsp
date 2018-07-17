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
	        .submenubar_background { position: absolute; width: 100%; height: 100px; background-color: #E4EEF0; }
	        .submenubar_header { font-family: "fallM"; margin-left: 40px; width: 400px; height: 50px; display: inline-block; margin-top: 25px; float: left; }
	        td.submenubar_name {font-family:"fallM"; font-size: 25px; color: #121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
	        .submenubar_detail { font-size: 12px; margin-left: 5px; color: #323838; }
	        .submenubar_description {text-align: left;  font-family: "fallM"; background-color: #E4EEF0; border: 1px solid #E4EEF0;  font-size: 12px; height: 15px; margin-top: 10px; color: #121F27; }
	        .submenubar_button { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 10px; float: right; background-color: #121F27; cursor: pointer; }
	        .submenubar_button_last { width: 120px; height: 50px; line-height: 50px; color: white; font-family: "fallM"; font-size: 15px; text-align: center; margin-top: 25px;
				margin-right: 100px; float: right; background-color: #121F27; cursor: pointer; }
			select { width: 100%; height: 100%; background-color: #121F27; color: white; font-family: "fallM"; border-radius: 0px; appearance: none; outline: none; 
				display: inline-block; }
			
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
				font-family: "fallM"; /* 폰트 상속 */ 
				border: 1px solid #999; 
				border-radius: 0px; /* iOS 둥근모서리 제거 */ 
				appearance: none;
				display: inline-block;
			  	margin: 5px 5px 5px 0;
			  	float: left;
			  	color: white;
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
                    <td class="submenubar_name">김대리의 한마디<b class="submenubar_detail">오늘도 수고한 대리들의 뒷이야기</b></td>
                </tr>
                <tr>
                    <td class="submenubar_description">*대리 회원(직장인 회원)만 글 작성, 열람이 가능합니다.</td>
                </tr>
            </table>
        </div>
		<span class="submenubar_button_last">
			<select name="category">
				<option value="" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IT</option>
				<option value="잡담">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잡담</option>
				<option value="이직">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이직</option>
				<option value="업무질문">&nbsp;&nbsp;&nbsp;&nbsp;업무질문</option>
			</select>
		</span>
        <span id="write" class="submenubar_button" onclick="location.href='./pageMove?page=kimSayWrite'">글 작성</span>
    </div>

	<div class="container">
		<div id="search_div" class="center-block search_div">
			
			<select class="custom_select"> 
				<option value="잡담" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잡담</option> 
				<option value="이직">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이직</option> 
				<option value="업무 질문">&nbsp;&nbsp;업무 질문</option>
			</select>
			
			<input id="search_text" type="text" placeholder="검색어를 입력해주세요.">
			<button class="search_btn">검색</button>
		</div>
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
</body>
	<script>
    var obj={};
    var pagingEnd=15;
    var keyword="";
    
    ajaxCall(obj,keyword,pagingEnd);
    
    $("#more").click(function(){
        pagingEnd+=15;
        ajaxCall(obj,keyword,pagingEnd);
    });
    
    $(".search_btn").click(function(){
        keyword=$("#search_text").val();
        ajaxCall(obj,keyword);
    });
    
    
    function ajaxCall(obj,keyword){
        obj.data={
            "keyword":keyword,
        };
        obj.success=function(data){
        	
        };
        $.ajax(obj);
    }
    
    /* 게시판 접근 권한 체크 */ 
	$(document).ready(function() {
        var loginId = "${sessionScope.loginId}";
        var member_div = "${sessionScope.member_div}";
        
        if(member_div == "관리자" || member_div == "대리"){
            kimSayList();
        } else if(member_div == "인턴"){
        	alert("대리 회원만 이용 가능합니다.");
        	location.href='./';
        }
	});
	
    /* 게시글 리스트 호출 */
	function kimSayList(){
		$.ajax({
			type : "get",
			url : "./kimSayCall",
			success : function(data) {
				console.log(data);
				boardPrint(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
    /* 게시글 리스트 출력 */
	function boardPrint(list){
		var str = "";
		list.forEach(function(i){
			i.forEach(function(item){
				str+="<div class='col-md-4'>";
	            str+="<div class='thumbnail'>";
	            str+="<a href='./kimSayDetail?board_no="+item.board_no+"'><div id='title' class='thumbnail_header'><p class='thumbnail_contents'>"+item.board_title+"</p></div></a>";
	            var date = new Date(item.board_date);	
	            str+="<span class='caption_date'>작성일자: <b>"+date.toLocaleDateString("ko-KR")+"</b></span>";
	            str+="<span class='caption_detail'>조회<br/><b>"+item.board_bHit+"</b></span>";
	            str+="<span class='caption_detail'>추천<br/><b>"+item.board_recom+"</b></span>";
	            str+="<span class='caption_detail'>댓글<br/><b>"+item.board_comm+"</b></span>";
	            str+="</div>";
	            str+="</div>";
			})
		})
		$("#search_div").after(str);
	}
    
    
	</script>
</html>