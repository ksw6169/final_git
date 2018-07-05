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
	        .submenubar_header { font-family: "fallM"; margin-left: 40px; width: 500px; height: 50px; display: inline-block; margin-top: 30px; float: left; }
	        td.submenubar_name {font-family:"fallM"; font-size: 30px; color: #121F27; background-color: #E4EEF0; border: 1px solid #E4EEF0; }
	        .submenubar_detail { font-size: 10px; margin-left: 5px; }
	        .submenubar_description{ font-size:10px; height:15px; margin-top:10px; }
			.submenubar_button,.submenubar_button_last{width:130px;height:50px; line-height:50px; color:#fff; font-family:fallM; font-size:15px; text-align:center; 
				margin-top:25px; float:right; background-color:#121F27; cursor:pointer; }
			.submenubar_button{ margin-right:10px; }
			.submenubar_button_last{ margin-right:100px; }
		
		
			.star-input>.input,
            .star-input>.input>label:hover,
            .star-input>.input>input:focus+label,
            .star-input>.input>input:checked+label{ display: inline-block;vertical-align:middle;background:url('./resources/image/grade_img.png')no-repeat;}
			
			.star-input{display:inline-block; white-space:nowrap;width:200px;height:40px;padding:25px; margin-top: -15px; line-height:30px;}
			
			.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
			
			.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
			
			star-input>.input.focus{outline:1px dotted #ddd;}
			
			.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
			
			.star-input>.input>label:hover,
            .star-input>.input>input:focus+label,
            .star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
			
			.star-input>.input>label:hover~label{background-image: none;}
			
            .star-input>.input>label[for*="p1"]{width:30px;z-index:5;}
			.star-input>.input>label[for*="p2"]{width:60px;z-index:4;}
			.star-input>.input>label[for*="p3"]{width:90px;z-index:3;}
			.star-input>.input>label[for*="p4"]{width:120px;z-index:2;}
			.star-input>.input>label[for*="p5"]{width:150px;z-index:1;}
            
			.star-input>output{color: #121F27; font-size:18px; text-align:right; vertical-align:middle; display: none; }
			
			.content {
				font-family: "bareun";
				text-align: center;
				margin-bottom: 30px;
				color: white;
			}

			.comWrite_header {
			  font-family: "bareun";
			  color: #121F27;
			  background-color: white;
			  width: 200px;
			  height: 50px;
			  line-height: 50px;
			  font-size: 25px;
			  text-align: center;
			  margin: 20px 0 0 5px;
			  border: 0px;
			  display: inline-block;
			  vertical-align: middle;
			}

			.clear {
				clear: both;
			}

			.comWrite {
				background: #121F27;
				text-align: center;
				height: 450px;
				margin-top: 20px;
			}

			.comment {
				border: 0.25px solid #A9A9A9;
				background: #E4EEF0;
				text-align: center;
				font-family: fallB;
				font-size: 25px;
				color: black;
				height: 50px;
				line-height: 50px;
				width=100%;
			}

			.input_comWrite {
				text-align: center;	
			}

			.comment_header {
				width: 100%;
				text-align: center;
				color: black;
				font-family: fallB;
				font-size: 25px;
				background-color: #E4EEF0;
			}

			input[type='text'] {
				height: 150px;
			}

			button.pull-right {
			  width: 75px;
			  height: 30px;
			  line-height: 30px;
			  vertical-align: top;
			  font-family: "bareun";
			  border: 0px;
			  color: #fff;
			  background-color: #121F27;
			  font-size: 13px;
			  cursor: pointer;
			}

			.comWrite_btn {
				width: 200px;
				height: 30px;
				line-height: 30px;
				font-size: 16px;
				margin: 0px 0 0 0px;
				border: 0px;
				background-color: #FF8000;
				color: white;
				font-family: "bareun";
			}

			.button_group {
				text-align: center;
				margin-top: 10px;
			}

			div.col-md-6.col-md-offset-3.comWrite {
				margin-top: 150px; 
			}

		</style>
  	</head>
	<body>
		<jsp:include page="menubar.jsp" flush="false"/>
	
	    <div class="submenubar_background">
	        <div class="submenubar_header">
	            <table>
	                <tr>
	                    <td class="submenubar_name">기업평가</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	
		<div class="col-md-6 col-md-offset-3 comWrite">
			<div class="input_comWrite">
				<h1 class="content">기업평가</h1>
				<span class="comWrite_header">주당 야근 횟수</span>
				<span class="comWrite_header">
					<span class="star-input" id="row1">
						<span class="input">
							<input type="radio" name="star1" value="1" id="row1p1">
							<label for="row1p1">1</label>
							<input type="radio" name="star1" value="2" id="row1p2">
							<label for="row1p2">2</label>
							<input type="radio" name="star1" value="3" id="row1p3">
							<label for="row1p3">3</label>
							<input type="radio" name="star1" value="4" id="row1p4">
							<label for="row1p4">4</label>
							<input type="radio" name="star1" value="5" id="row1p5">
							<label for="row1p5">5</label>
						</span>
						<output for="row1"><b>0</b>점</output>						
					</span>
				</span>
				<div class="clear"></div>

				<span class="comWrite_header">휴식시간</span>
				<span class="comWrite_header">
					<span class="star-input" id="row2">
						<span class="input">
							<input type="radio" name="star2" value="1" id="row2p1">
							<label for="row2p1">1</label>
							<input type="radio" name="star2" value="2" id="row2p2">
							<label for="row2p2">2</label>
							<input type="radio" name="star2" value="3" id="row2p3">
							<label for="row2p3">3</label>
							<input type="radio" name="star2" value="4" id="row2p4">
							<label for="row2p4">4</label>
							<input type="radio" name="star2" value="5" id="row2p5">
							<label for="row2p5">5</label>
						</span>
						<output for="row2"><b>0</b>점</output>
					</span>
				</span>
				<div class="clear"></div>

				<span class="comWrite_header">인턴채용</span>
				<span class="comWrite_header">
					<span class="star-input" id="row3">
						<span class="input">
							<input type="radio" name="star3" value="1" id="row3p1">
							<label for="row3p1">1</label>
							<input type="radio" name="star3" value="2" id="row3p2">
							<label for="row3p2">2</label>
							<input type="radio" name="star3" value="3" id="row3p3">
							<label for="row3p3">3</label>
							<input type="radio" name="star3" value="4" id="row3p4">
							<label for="row3p4">4</label>
							<input type="radio" name="star3" value="5" id="row3p5">
							<label for="row3p5">5</label>
						</span>
						<output for="row3"><b>0</b>점</output>
					</span>
				</span>
				<div class="clear"></div>

				<span class="comWrite_header">연차사용압력</span>
				<span class="comWrite_header">
					<span class="star-input" id="row4">
						<span class="input">
							<input name="star4" type="radio" value="1" id="row4p1">
							<label for="row4p1">1</label>
							<input name="star4" type="radio" value="2" id="row4p2">
							<label for="row4p2">2</label>
							<input name="star4" type="radio" value="3" id="row4p3">
							<label for="row4p3">3</label>
							<input name="star4" type="radio" value="4" id="row4p4">
							<label for="row4p4">4</label>
							<input name="star4" type="radio" value="5" id="row4p5">
							<label for="row4p5">5</label>
						</span>
						<output for="row4"><b>0</b>점</output>
					</span>
				</span>
				<div class="clear"></div>
			</div>
		</div>
		<div class="col-md-6 col-md-offset-3 comment">코멘트</div>
		<textarea class="col-md-6 col-md-offset-3" rows="8"></textarea>
		<br/>
		<div class="col-md-6 col-md-offset-3 button_group">
			<button class="pull-right">이전</button><br/>
		</div>
		<div class="col-md-6 col-md-offset-3 button_group">
            <button class="comWrite_btn">기업평가 완료</button>
		</div>
	</body>
    <script src="./resources/js/star.js"></script>
	<script>
	</script>
</html>