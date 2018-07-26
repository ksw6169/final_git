<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	 	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
	        /* Custom navigation bar */
	        body { padding-top: 70px; }
	        img { margin-left: 0px; width: 70px; height: 40px; }
	     
	        .main_top { width: 100%; background-size:cover; }
	        .main_bottom { width: 100%; background-size:cover; } */
	        .content { float: left; background: #3C3F41 bottom fixed; background-size:cover; height: 100px; }
	        
	        footer { padding: 40px 0; color: #fff; font-family: "NanumL"; font-size: 12px; background-color: #616161; color: white;}
		</style>
	</head>
	<body>
	    <jsp:include page="menubar.jsp" flush="false"/>
	    
	    <img class="img-fluid main_top img-responsive" src="./resources/image/main_image.png"/>
	    <img class="img-fluid main_bottom img-responsive" src="./resources/image/main_bottom.png"/>
	    
	    <footer class="content">
	        <div class="container">
	            All contents copyright&#169; 2018 상사를바꿔조
	        </div>
	    </footer>
	</body>
	<script>
		var msg = "${msg}";	
		
		if(msg != "") {
			alert(msg);
		}
	</script>
</html>