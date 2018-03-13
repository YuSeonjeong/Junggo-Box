<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	z-index: 10000;
	width: 40%;
	left: 50%;
	margin-left: -20%; /* half of width */
	height: 300px;
	top: 40%;
	margin-top: -150px; /* half of height */
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width':maskWidth,'height':maskHeight});  

		//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 30% 불투명도로 간다.
		$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("slow",0.3);    
		$('.window').show();
	}

	$(document).ready(function(){
		//검은 막 띄우기
		$('.openMask').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});    

		//검은 막을 눌렀을 때
		$('#mask').click(function () {  
		    $(this).hide();  
		    $('.window').hide();  
		});      
	});
	</script>
</head>
<body>
	<div id="mask"></div>
	<div class="window">
		<div style="text-align: center;">
			<a href="upload_g.jsp"> <img src='picture/gyungup.png'
				style="height: 200px; width: outo;" />
			</a> <br></br> <br></br> <a href="upload_j.jsp"> <img
				src='picture/junggoup.png' style="height: 200px; width: outo;" /></a>
		</div>
	</div>
	<!-- a href ="#" : 클릭 이벤트만 실행 -->
	<a href="#" class="openMask"><img src="picture/floating.png"
		style="float: right; padding-right: 5%;" /></a>
</body>
</html>