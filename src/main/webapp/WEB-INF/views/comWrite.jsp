<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <html>
        <head>
	        <script>
				divCheck();
				function divCheck(){
			    	var loginId = "${sessionScope.loginId}";
			    	var loginDiv ="${sessionScope.member_div}";
			
			    	if(loginId != null && loginDiv == "인턴"){
			    		alert("해당 게시판 권한이 없습니다.");
			    		location.href=document.referrer;
			    	}
			    }
			</script>
        
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <style>
                /* submenubar css */
                .submenubar_header,td.submenubar_name{font-family:fallM}
                .star-input,.star-input>.input{display:inline-block;white-space:nowrap}
                .submenubar_background{position:absolute;width:100%;height:100px;background-color:#E4EEF0}
                .submenubar_header{margin-left:40px;width:500px;height:50px;display:inline-block;margin-top:30px;float:left}
                td.submenubar_name{font-size:30px;color:#121F27;background-color:#E4EEF0;border:1px solid #E4EEF0}
                .submenubar_detail{font-size:10px;margin-left:5px}
                .submenubar_description{font-size:10px;height:15px;margin-top:10px}
                .submenubar_button,.submenubar_button_last{width:130px;height:50px;line-height:50px;color:#fff;font-family:fallM;font-size:15px;text-align:center;margin-top:25px;float:right;background-color:#121F27;cursor:pointer}
                .comWrite_header,.content{font-family:bareun}
                .submenubar_button{margin-right:10px}
                .submenubar_button_last{margin-right:100px}
                
                .star-input>.input,.star-input>.input>input:checked+label,.star-input>.input>input:focus+label,.star-input>.input>label:hover{display:inline-block;vertical-align:middle;background:url(resources/image/grade_img.png) no-repeat}
                .star-input{width:200px;height:40px;padding:25px;margin-top:-15px;line-height:30px}
                .star-input>.input{width:150px;background-size:150px;height:28px;overflow:hidden;position:relative}
                .star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0}
                .star-input>.input.focus{outline:#ddd dotted 1px}
                .star-input>.input>label{width:30px;height:0;padding:28px 0 0;overflow:hidden;float:left;cursor:pointer;position:absolute;top:0;left:0}
                .star-input>.input>input:checked+label,.star-input>.input>input:focus+label,.star-input>.input>label:hover{background-size:150px;background-position:0 bottom}.star-input>.input>label:hover~label{background-image:none}
                .star-input>.input>label[for*=p1]{width:30px;z-index:5}
                .star-input>.input>label[for*=p2]{width:60px;z-index:4}
                .star-input>.input>label[for*=p3]{width:90px;z-index:3}
                .star-input>.input>label[for*=p4]{width:120px;z-index:2}
                .star-input>.input>label[for*=p5]{width:150px;z-index:1}
                .star-input>output{color:#121F27;font-size:18px;text-align:right;vertical-align:middle;display:none}
                .content{text-align:center;margin-bottom:30px;color:#fff}
                .comWrite_header{color:#121F27;background-color:#fff;width:200px;height:50px;line-height:50px;font-size:25px;text-align:center;margin:20px 0 0 5px;border:0;display:inline-block;vertical-align:middle}
                .comment,.comment_header{color:#000;font-family:fallB;font-size:25px;text-align:center}
                .clear{clear:both}
                .comWrite{background:#121F27;text-align:center;height:450px;margin-top:20px}
                .comment{border:.25px solid #A9A9A9;background:#E4EEF0;height:50px;line-height:50px}
                .input_comWrite{text-align:center}
                .comment_header{width:100%;background-color:#E4EEF0}
                input[type=text]{height:150px}
                .comWrite_btn,button.pull-right,input[type=button].pull-right{height:30px;line-height:30px;border:0;color:#fff;font-family:bareun}
                button.pull-right,input[type=button].pull-right{width:75px;vertical-align:top;background-color:#121F27;font-size:13px;cursor:pointer}
                .comWrite_btn{width:200px;font-size:16px;margin:0 0 50px;background-color:#FF8000}
                .button_group{text-align:center;margin-top:10px}
                div.col-md-6.col-md-offset-3.comWrite{margin-top:150px}
            </style>
        </head>
        <body>
            <jsp:include page="menubar.jsp" flush="false" />

            <div class="submenubar_background">
                <div class="submenubar_header">
                    <table>
                        <tr>
                            <td class="submenubar_name">기업평가</td>
                        </tr>
                    </table>
                </div>
            </div>

            <form action="./evalWrite" method="post">
                <div class="col-md-6 col-md-offset-3 comWrite">
                    <div class="input_comWrite">
                        <h1 class="content">기업평가</h1>
                        <input type="hidden" name="company_no" value="${company_no}"/>
                        <span class="comWrite_header">주당 야근 횟수</span>
                        <span class="comWrite_header"> <span class="star-input" id="row1">
					<span class="input"> 
						<input type="radio" name="evaluation_night" value="1" id="row1p1"> <label for="row1p1">1</label> 
						<input type="radio" name="evaluation_night" value="2" id="row1p2"> <label for="row1p2">2</label> 
						<input type="radio" name="evaluation_night" value="3" id="row1p3"> <label for="row1p3">3</label> 
						<input type="radio" name="evaluation_night" value="4" id="row1p4"> <label	for="row1p4">4</label> 
						<input type="radio" name="evaluation_night" value="5" id="row1p5"> <label for="row1p5">5</label>
					</span> <output for="row1">
							<b>0</b>점
						</output>
                        </span>
                        </span>
                        <div class="clear"></div>

                        <span class="comWrite_header">휴식시간</span> 
                        <span class="comWrite_header"> <span class="star-input" id="row2">
					<span class="input"> 
						<input type="radio" name="evaluation_rest" value="1" id="row2p1"> <label for="row2p1">1</label> 
						<input type="radio" name="evaluation_rest" value="2" id="row2p2"> <label for="row2p2">2</label> 
						<input type="radio" name="evaluation_rest" value="3" id="row2p3"> <label for="row2p3">3</label> 
						<input type="radio" name="evaluation_rest" value="4" id="row2p4"> <label for="row2p4">4</label> 
						<input type="radio" name="evaluation_rest" value="5" id="row2p5"> <label for="row2p5">5</label>
					</span> <output for="row2">
							<b>0</b>점
						</output>
                        </span>
                        </span>
                        <div class="clear"></div>

                        <span class="comWrite_header">인턴채용</span> 
                        <span class="comWrite_header"> <span class="star-input" id="row3">
					<span class="input"> 
						<input type="radio" name="evaluation_intern" value="1" id="row3p1"> <label for="row3p1">1</label> 
						<input type="radio" name="evaluation_intern" value="2" id="row3p2"> <label for="row3p2">2</label> 
						<input type="radio" name="evaluation_intern" value="3" id="row3p3"> <label for="row3p3">3</label> 
						<input type="radio" name="evaluation_intern" value="4" id="row3p4"> <label for="row3p4">4</label> 
						<input type="radio" name="evaluation_intern" value="5" id="row3p5"> <label for="row3p5">5</label>
					</span> <output for="row3">
							<b>0</b>점
						</output>
                        </span>
                        </span>
                        <div class="clear"></div>

                        <span class="comWrite_header">연차사용압력</span> 
                        <span class="comWrite_header"> <span class="star-input" id="row4">
					<span class="input"> 
						<input name="evaluation_vacation" type="radio" value="1" id="row4p1"> <label for="row4p1">1</label> 
						<input name="evaluation_vacation" type="radio" value="2" id="row4p2"> <label for="row4p2">2</label> 
						<input name="evaluation_vacation" type="radio" value="3" id="row4p3"> <label for="row4p3">3</label> 
						<input name="evaluation_vacation" type="radio" value="4" id="row4p4"> <label for="row4p4">4</label> 
						<input name="evaluation_vacation" type="radio" value="5" id="row4p5"> <label for="row4p5">5</label>
					</span> <output for="row4">
							<b>0</b>점
						</output>
                        </span>
                        </span>
                        <div class="clear"></div>
                    </div>
                </div>
	            <div class="col-md-6 col-md-offset-3 comment">코멘트</div>
	            <textarea id="comment_content" class="col-md-6 col-md-offset-3" name="evaluation_comment" rows="8"></textarea>
	            <br />
	            <div class="col-md-6 col-md-offset-3 button_group">
	                <input type="button" onclick="before()" class="pull-right" value="이전"/>
	                <br />
	            </div>
	            <div class="col-md-6 col-md-offset-3 button_group">
	                <button class="comWrite_btn">기업평가 완료</button>
	            </div>
	            </form>
	            
	            <!-- 기업평가 유의사항 Modal -->
	            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10%;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel" style="font-family: bareun; padding-left: 10px;"><b style="color: #FF8000;">기업평가</b> 유의사항</h4>
				      </div>
				      <div class="modal-body">
			      		<h3 style="font-family: bareun; font-size: 18px; text-align: center;">별을 높게 책정할수록 긍정적 평가입니다.</h3>
			      		<h3 style="font-family: bareun; font-size: 18px; text-align: center;">(예: 주당 야근 횟수 <b style="color: red;">★★★★★</b> - 주당 야근 횟수가 적음)</h3>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: bareun;">닫기</button>
				      </div>
				    </div> <!-- 모달 콘텐츠 -->
				  </div> <!-- 모달 다이얼로그 -->
				</div> <!-- 모달 전체 윈도우 -->
        </body>
        <script src="./resources/js/star.js"></script>
        <script>
        	$(document).ready(function() {
        		$("#myModal").modal();	
        	});
        	
	        $("#comment_content").on('keyup',function(){
				if($(this).val().length > 300) {
		        	$(this).val($(this).val().substring(0, 300));
		        	alert("글자수를 초과하셨습니다 !");
		        }
	        });
				
	        evalCheck("${company_no}");
	        
	        $("#row1p1").attr('checked', true);
	    	$("#row2p1").attr('checked', true);
	    	$("#row3p1").attr('checked', true);
	    	$("#row4p1").attr('checked', true);
	    	
	    	function before(){
	    		location.href=document.referrer;
	    	}
	    	
	    	//${company_no}
	    	function evalCheck(company_no){
	        	var chk={};
	        	chk.url="./evalCheck";
	        	chk.type="GET";
	        	chk.dataType="JSON";
	        	chk.error=function(e){console.log(e)};
	        	chk.data={"company_no":company_no};
	        	chk.success=function(data){
	                   if(data.success){
	                	   console.log("기업평가 작성 가능");
	                   }else{
	                	   alert(data.msg);
	                	   before();
	                	   }
	                };
	                $.ajax(chk);
	        }
	</script>
</html>