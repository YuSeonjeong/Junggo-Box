<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script language="javascript">
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;
		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}

		form.submit();
	}

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<style>
#top {
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
	border-bottom: 1px solid #DEDEDE;
	padding-bottom: 3%;
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
	<%@include file="junggo.jsp"%>

	<div id="top" style="text-align: center;">
		<b>공 지 사 항</b>
	</div>

	<%
		String fileName = request.getParameter("fileName");
	%>

	<form name=writeform method=post action="b_notice_write_ok.jsp">

		<div id="table">
			<div class="row">
				<span class="cell col1"><b>제 목</b></span><span class="cell col2"><input
					name="title" maxlength="100" style="border: 0px; font-size: 25px;"></span>
			</div>
			<div class="row">
				<span class="cell col1" style="vertical-align: middle;"><b>내
						용</b></span><span class="cell col2"><textarea name="memo" cols="30"
						rows="10" style="border: 0px; font-size: 25px;"></textarea></span>
			</div>
			<div class="row">
				<span class="cell col1 " style="vertical-align: middle;"><b>이미지</b></span><span
					class="cell col2"> <%if(fileName==null) {%> <input
					type="button" value="이미지 첨부" name="image"
					style="width: 150; height: 50; font-size: 20px;"
					OnClick="window.location='b_notice_fileup.jsp'"> <%} else{ %>
					<img src="./image/<%=fileName%>" width="200"><br><%=fileName%>

					<%} %></span>
			</div>
		</div>

		<center style="padding-top: 5%;">
			<input type=button value="등록" OnClick="javascript:writeCheck();"
				style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
			<input type=button value="취소" OnClick="javascript:history.back(-1)"
				style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
		</center>


	</form>
</body>
</html>