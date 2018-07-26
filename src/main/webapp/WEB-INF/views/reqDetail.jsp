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
			.submenubar_description{font-size:10px;height:15px;margin-top:10px; border: 1px solid #E4EEF0; }
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:100px;}
			
			/* CSS 수정(0719_성원) */
			.container{margin-top:150px;margin-bottom:50px;padding-top:25px;padding-bottom:25px;background:#E4EEF0;}
	        .table { width: 100%; }
	        .table>tbody>tr>th { font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
			.table>tbody>tr>td { font-family: "fallM"; text-align: center; background: white; color: #121F27; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
			.table>tbody>tr>td.contents { }
			.btn { width: 100%; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; margin: 0px; padding: 0px;}
	        button:hover { color: #121F27; }
			#capture{ margin: 0px; width: 100%; height: auto; }
    	</style>
  	</head>
  	<body>
		<jsp:include page="menubar.jsp"/>
  
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">인증신청관리</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	  
	  	<div class="container">
	  		<div class="row">
		  		<div class="col-md-10 col-md-push-1">
					<table class="table">
						<tbody>
		                	<tr>
		                    	<th colspan="2">회사명</th>
		                    </tr>
		                    <tr>
		                        <td colspan="2">${member.member_company}</th>
		                    </tr>
		                    <tr>
		                        <th colspan="2">사진</th>
		                    </tr>
		                    <tr>
		                        <td class="contents" colspan="2"><img id="capture" src="${path}" style="cursor: pointer;"/></td>
		                    </tr>
	                    </tbody>
					</table>
                </div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-push-1">
					<div class="col-md-2 pull-right">
						<button id="back" class="btn btn-default">목록</button>
					</div>
					<div class="col-md-4 col-md-push-4">
						<div class="col-md-6">
	                		<button id="ok" class="btn btn-default">승인</button>
	                	</div>
	                	<div class="col-md-6">
	                		<button id="no" class="btn btn-default">거절</button> 
	                	</div>
	                </div>
				</div>
			</div>
		</div>
	</body>
	<script>
		$("#capture").click(function(){
			window.open("${path}", "이미지", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); 
		});
		
		$("#back").click(function(){
			window.history.back();
		});
		
		$("#ok").click(function(){
			location.href="./memAcceptOk?id=${member.member_id}";
		});
		
		$("#no").click(function(){
			location.href="./reqEmail?id=${member.member_id}";
		});
	</script>
</html>