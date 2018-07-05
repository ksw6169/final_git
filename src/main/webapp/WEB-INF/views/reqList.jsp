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
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { font-family: "NanumM"; background: #121F27; color: white; border: 1px solid white; height: 25px; line-height: 25px; }
	       	th.center{text-align: center;}
	        td { font-family: "NanumM"; text-align: center; background: #E4EEF0; border: 1px solid white; height: 25px; line-height: 25px; }
	        .table>thead>tr>th { text-align: center; }
	        .paging_button { text-align: center;}
	        .page-link { font-family: "bareun"; }
	        
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
                    <td class="submenubar_name">인증신청관리</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="container">
    	<h1 class="content">대리(회사원) 인증 목록</h1>
        <table class="table table-hover">
            <thead>
             <tr>
               <th class="center">번 호</th>
               <th class="center">ID</th>
               <th class="center">회사명</th>
               <th class="center">회사 캡쳐본</th>
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