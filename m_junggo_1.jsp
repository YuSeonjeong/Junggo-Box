<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>중고 판매</title>
<%@include file="junggo.jsp"%>


</head>


<style>
#top {
	display: flex;
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
}

.mypage {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 3px solid #DEDEDE;
}

.jung {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 8px solid #DEDEDE;
}

.gyung {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 3px solid #DEDEDE;
}

#top2 {
	display: flex;
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
}

.menu {
	flex: 1;
	border-right: 1px solid #DEDEDE;
}

.menu2 {
	flex: 1;
}

#table {
	display: table;
	width: 90%;
	padding-left: 3%;
	padding-right: 5%;
	padding-top: 5%;
	padding-right: 5%;
}

.row {
	display: table-row;
}

.cell {
	display: table-cell;
	padding: 2%;
	padding-bottom: 3%;
	border-bottom: 1px solid #DDD;
}

.col1 {
	width: 20%;
}

.col2 {
	vertical-align: middle;
	padding-left: 5%;
	width: 80%;
}

.content {
	padding-left: 3%;
	border-bottom: 1px solid #DDD;
	padding: 3% 5% 3% 5%;
	padding-right: 5%;
}
</style>

<body>

	<div id="top">
		<div class="mypage">
					<a href="m_mypage_my.jsp">	<font color="5C7885">마이페이지</font></a>
		</div>
		<div class="jung">
<font color="263137">중고 판매</font>
		</div>
		<div class="gyung">
			<a href="m_gyung_real.jsp"> <font color="5C7885">경매</font>
			</a>
		</div>

	</div>


	<div id="top2">
		<div class="menu">
			<font color="263137"><b>의류</b></font>
		</div>
		<div class="menu">
			<font color="5C7885">생활/문구</font>
		</div>
		<div class="menu">
			<font color="5C7885">뷰티</font>
		</div>
		<div class="menu">
			<font color="5C7885">도서</font>
		</div>
		<div class="menu">
			<font color="5C7885">디지털/가전 </font>
		</div>
		<div class="menu2">
			<font color="5C7885">티켓/쿠폰 </font>
		</div>
	</div>

	<div style="padding-top: 10%; padding-left: 5%">

		<img src="picture/profile2.png" style="width: 50px;"> 유선정

	</div>
	<div id="table">
		<div class="row">
			<span class="cell col1"><img src="picture/dogclothing.jpg"
				width="400dp"></span> <span class="cell col2"><div>
					<div>강아지 줄무늬티</div>
					<div>10,000원</div>
					<div>수량 : 1</div>
					<div>상태 : 최상</div>
					<div style="padding-top: 5%;">
						<img src="picture/jchat.png" width="70px" style="padding-right: 5%"> <img
							src="picture/jbuy.png" width="70px">
					</div>
				</div></span>
		</div>		
	</div>
	
	
	<div style="padding-top: 10%; padding-left: 5%">

		<img src="picture/profile2.png" style="width: 50px;"> 정이네옷가게

	</div>
	<div id="table">
		<div class="row">
			<span class="cell col1"><img src="picture/cloth.PNG"
				width="400dp"></span> <span class="cell col2"><div>
					<div>22color 무지 반팔티</div>
					<div>8,900원</div>
					<div>수량 : 999</div>
					<div>상태 : 최상</div>
					<div style="padding-top: 5%;">
						<img src="picture/jchat.png" width="70px" style="padding-right: 5%"> <img
							src="picture/jbuy.png" width="70px">
					</div>
				</div></span>
		</div>		
	</div>
	
	<%-- 	
	<div id="table">
		<div class="row">
			<span class="cell col1"><b>글 번호</b></span><span class="cell col2"><%=idx%></span>
		</div>
		<div class="row">
			<span class="cell col1"><b>작성일</b></span><span class="cell col2"><%=sdf.format(date)%></span>
		</div>
		<div class="row">
			<span class="cell col1"><b>제목</b></span> <span class="cell col2"><%=title%></span>
		</div>
	</div>
 --%>



	<%@include file="floating.jsp"%>
</body>
</html>

