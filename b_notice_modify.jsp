<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<script language="javascript">
	// 자바 스크립트 시작

	function modifyCheck() {
		var form = document.modifyform;

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
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "1234";

	String title = "";
	String memo = "";
	String image = "";

	int idx = Integer.parseInt(request.getParameter("idx"));

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT notice_title, notice_content, notice_image from notice WHERE notice_seq=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {

			title = rs.getString(1);
			memo = rs.getString(2);
			image = rs.getString(3);
		}

		rs.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


	<form name=modifyform method=post
		action="b_notice_modify_ok.jsp?idx=<%=idx%>">
		<div id="table">
			<div class="row">
				<span class="cell col1"><b>제 목</b></span><span class="cell col2"><input
					type="text" name="title" maxlength="100"
					style="border: 0px; font-size: 25px;" value="<%=title%>"></span>
			</div>
			<div class="row">
				<span class="cell col1" style="vertical-align: middle;"><b>내
						용</b></span><span class="cell col2"><textarea name="memo" cols="30"
						rows="10" style="border: 0px; font-size: 25px;"><%=memo%></textarea></span>
			</div>
			<div class="row">
				<span class="cell col1 " style="vertical-align: middle;"><b>이미지</b></span><span
					class="cell col2"> <%
 	if (image == null) {
 %> <input type="button" value="이미지 첨부"
					style="width: 150; height: 50; font-size: 20px;"
					OnClick="window.location='b_modify_fileup.jsp'"> <%
 	} else {
 %> <img src="./picture/<%=image%>" width="300"><span style="padding-left:3%"><input
					type="button" value="이미지 첨부"
					style="width: 150; height: 50; font-size: 20px;"
					OnClick="window.location='b_modify_fileup.jsp'"></span> <%
 	}
 %></span>
			</div>
		</div>
		<center style="padding-top: 5%;">
			<input type="button" value="수정" OnClick="javascript:modifyCheck();"
				style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
			<input type=button value="취소" OnClick="javascript:history.back(-1)"
				style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
		</center>
	</form>
</body>
</html>