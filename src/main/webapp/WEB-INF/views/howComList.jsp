<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
   	 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			/* submenubar css */
	        .submenubar_background{ position:absolute; width:100%; height:100px; background-color:#E4EEF0;}
			.submenubar_header{ font-family:"fallM"; margin-left:40px; width:500px; height:50px; display:inline-block; margin-top:20px; float:left;}
			td.submenubar_name{font-family:"fallM"; font-size:25px; color:#121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
			.submenubar_detail{font-size:12px; margin-left:5px; color:#323838;}
			.submenubar_description{font-family:"fallM"; font-size:12px; height:15px; margin-top:10px; color:#121F27;  border: 1px solid #E4EEF0; text-align: left; }
			.submenubar_button,.submenubar_button_last{ width:120px; height:50px; line-height:50px; color:#fff; font-family:fallM; font-size:15px; text-align:center;
				margin-top:25px; float:right; background-color:#121F27; cursor:pointer; }
			.submenubar_button{ margin-right:10px; }
			.submenubar_button_last{ margin-right:100px; }
			
			/* main */
	        body { padding-top: 100px; }
	        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #E4EEF0;  height: 25px; }
	        .paging_button { text-align: center;}
	        .page-link { font-family: "bareun"; }
			.container{margin-top:100px; }
			.page-item{cursor:pointer; }
			.center{text-align:center; }
			.td_content{width: 70%;}
		
			/* search bar */
			.search_div{margin-top:50px;margin-bottom:150px;text-align:center;width:450px;}
			input[type=text]{font-size:13px;padding:10px;width:350px;height:50px;line-height:40px;outline:0;margin:5px 0;display:inline;float:left;}
			.search_btn{font-family:bareun;color:#fff;background-color:#121F27;width:100px;height:50px;font-size:14px;float:left;margin:5px 0;border:0;}
			.page-link{width:200px;}
    	</style>
  	</head>
	<body>
		<jsp:include page="menubar.jsp" flush="false"/>

		<!-- sub menubar -->
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">너의 직장은?<b class="submenubar_detail">꿈의 직장, 아직 만난 적 없는 너를 찾고 있어</b></td>
	                </tr>
	                <tr>
	                    <td class="submenubar_description">*대리 회원(직장인 회원)만 글 작성, 열람이 가능합니다.</td>
	                </tr>
					<tr>
	                    <td class="submenubar_description">*재직중인 기업만 기업평가 작성이 가능합니다.</td>
					</tr>
	            </table>
	        </div>
	    </div>
		
		<!-- main -->
	    <div class="container">
	        <div id="search_div" class="center-block search_div" >
				<input id="search_text" type="text" placeholder="기업명을 입력해주세요.">
				<button class="search_btn">기업명 검색</button>
			</div>
	        <table class="table table-hover" >
	            <thead>
	             <tr>
	               <th class="center">회사명</th>
	               <th class="center">조회수</th>
	               <th class="center" id="date">평가수</th>
	             </tr>
	             </thead>
	             <tbody id="list"></tbody>
	        </table>
	        
	        <!-- paging -->
	        <div class="paging_button">
	          <ul class="pagination">
	            <li class="page-item" id="pre">
	              <a class="page-link" tabindex="-1">이전 페이지</a>
	            </li>
	            <li class="page-item"  id="next">
	              <a class="page-link" >다음 페이지</a>
	            </li>
	          </ul>
	        </div>
	    </div>
	</body>
	<script>
        var obj={};
        var startPage = 1;
        var endPage = 10;
        
        var keyword="";
        createObj(obj);
        
        $(document).ready(function() {
    		ajaxCall(obj, keyword, startPage, endPage);
    		if("${msg}"!=""){
    			alert("${msg}");
    		}
    	});
        
        /* 이전 목록 버튼 클릭 시 */
		$("#pre").click(function(){
			if($("#pre").attr('class') != "page-item disabled") {
				startPage -= 10;
				endPage -= 10;
				ajaxCall(obj, keyword, startPage, endPage);
			}
		});
        
        /* 다음 목록 버튼 클릭 시 */
        $("#next").click(function(){
			if($("#next").attr('class') != "page-item disabled") {
				startPage += 10;
				endPage += 10;
				ajaxCall(obj, keyword, startPage, endPage);
			}
        });
        
        /* 검색 버튼 클릭 시 */
        $(".search_btn").click(function(){
            startPage = 1;
        	endPage = 10;
            keyword=$("#search_text").val();
            ajaxCall(obj, keyword, startPage, endPage);
        });
        
        function ajaxCall(obj,keyword,pagingEnd){
    		obj.data={
                keyword: keyword,
                startPage: startPage,
                endPage: endPage
            };
            obj.success=function(data){
                listPrint(data.companyList);
                
                if(data.companyListCnt >= endPage ) {
                	$("#next").removeClass("disabled");
                } else {
                	$("#next").addClass("disabled");
                }
                
                if(endPage <= 10) {
                	$("#pre").addClass("disabled");
                } else {
                	$("#pre").removeClass("disabled");
                }
            };
            $.ajax(obj);
    	}
        
        function createObj(obj){
            obj.url="./companyList";
            obj.type="GET";
            obj.dataType="JSON";
            obj.error=function(e){console.log(e)};
        }
        
        function listPrint(list){
            $("#list").empty();
            
            var content="";
            
            for(var i=0; i<list.length; i++) {
           		content += "<tr>";
           		content += "<td class='center td_content'><a href='./companyDetail?company_no="+list[i].company_no+"'>"+list[i].company_name+"</a></td>";
           		content += "<td class='center'>"+list[i].company_bHit+"</td>";
           		content += "<td class='center'>"+list[i].company_eval+"</td>";
           		content += "</tr>";
            }
            $("#list").append(content);
        }
	</script>
</html>