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
			.submenubar_detail{font-size:10px;margin-left:5px;}
			.submenubar_description{font-size:10px;height:15px;margin-top:10px;}
			.submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;
				margin-top:25px;float:right;background-color:#121F27;cursor:pointer;}
			.submenubar_button{margin-right:10px;}
			.submenubar_button_last{margin-right:100px;}
			
			
	        .btn { width: 120px; height: 40px; background-color: #FF8000; border: none; vertical-align: middle; color:#fff; font-family: "fallB"; text-align: center; display: inline-block; font-size: 12px; }    
	        button:hover { color: #121F27; }
	        /* board_detail css */
	        .content { font-family: "bareun"; text-align: center; margin-bottom: 50px; }
	        th { width: 250px; font-family: "fallM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        td { font-family: "NanumM"; text-align: center; background: #121F27; color: white; border: 1px solid #E4EEF0; height: 25px; line-height: 25px; }
	        .table>tbody>tr>th { text-align: center; }
	        .button-group { margin-top: 15px;}
	        .subject { text-align: left; color: white; background-color: #848484; }
			.contents { color: #121F27; background-color: #FFFFFF; height: 350px; line-height: 100px; text-align: left; } 
	        .detail_div { margin-top: 50px;}
	        .table_div { background-color: #E4EEF0; padding: 50px; text-align: center;}
			
			.button_group {
				width: 100px;
				height: 37.5px;
				background-color: white;
				color: #121F27;
				border: 0.25px solid #DDDDDD;
			}
			
			.container {
				margin-top: 100px; 
			}
   	 	</style>
  </head>
  <body>
  <jsp:include page="menubar.jsp" flush="false"/>
  
  <div class="submenubar_background">
        <div class="submenubar_header">
            <table>
                <tr>
                    <td class="submenubar_name">쪽지함</td>
                </tr>
            </table>
        </div>
        <span class="submenubar_button_last">보낸 쪽지함</span>
        <span class="submenubar_button">받은 쪽지함</span>
    </div>
  
  <div class="container">
        <div class="detail_div">
            <div class="table_div">
                <table class="table">
                     <tr>
                       <th>보낸사람</th>
                       <td class="subject">user111</td>
                     </tr>
                     <tr>
                       <th colspan="2">내용</th>
                     </tr>
                     <tr>
                       <td class="contents" colspan="2">안녕하세요. 관리자님!!!</td>
                     </tr>
                </table>
            </div>    
            <div class="button-group">
                <button class="btn btn-default pull-right">목록</button>
                <button class="btn btn-default pull-right">답장</button>       
            </div>
        </div>
    </div>
</body>
	<script>
	</script>
</html>