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
			
        body { padding-top: 100px; }
        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
        th { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
        td { font-family: "NanumM"; text-align: center; background: #E4EEF0;  height: 25px; }
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
			width: 50%;
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
			height: 310px;
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
			width: 450px;
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
          width: 100px;
          height: 50px;
          font-size: 14px;
		  float: left;
		  margin: 5px 0 5px 0;
          border: 0px;
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
		
		.container {
			margin-top: 100px;
		}
		
		#more:hover{cursor: pointer;}
    </style>
  </head>
<body>
	<jsp:include page="menubar.jsp" flush="false"/>

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

	<div class="container">
		<div id="search_div" class="center-block search_div" >
			<input id="search_text" type="text" placeholder="기업명을 입력해주세요.">
			<button class="search_btn">기업명 검색</button>
		</div>
        <div class="paging_button">
          <ul class="pagination pagination-lg">
            <li class="page-item disabled">
              <a id="more" class="page-link" tabindex="-1">더보기</a>
            </li>
          </ul>
        </div>
    </div>
</body>
	<script>
        var obj={};
        var pagingEnd=15;
        var keyword="";
        createObj(obj);
        ajaxCall(obj,keyword,pagingEnd);
        
        $("#more").click(function(){
            pagingEnd+=15;
            ajaxCall(obj,keyword,pagingEnd);
        });
        
        $(".search_btn").click(function(){
            pagingEnd=15;
            keyword=$("#search_text").val();
            ajaxCall(obj,keyword,pagingEnd);
        });
        
        function ajaxCall(obj,keyword,pagingEnd){
    		obj.data={
                "keyword":keyword,
                "pagingEnd":pagingEnd
            };
            obj.success=function(data){
                listPrint(data.companyList);
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
            $("div.row").remove();
            
            var content="";
            //companyList[] - company_no, company_name, 조회수, company_eval
            list.forEach(function(companyDTO,idx){
                if(idx==0||idx%3==0){content+="<div class='row'>";}
                content+="<div class='col-md-4'>";
                content+="<div class='thumbnail'>";
                content+="<a href='./companyDetail?company_no="+companyDTO.company_no+"'><div class='thumbnail_header'><p class='thumbnail_contents'>"+companyDTO.company_name+"</p></div></a>";
				content+="<span class='caption_detail'>조회<br/><b>"+companyDTO.company_bHit+"</b></span>";
                content+="<span class='caption_detail'>평가수<br/><b>"+companyDTO.company_eval+"</b></span>";
				content+="</div>";
                content+="</div>";
                if(idx%3==2||idx==list.length-1){content+="</div>";}
            });
            $("#search_div").after(content);
        }
	</script>
</html>