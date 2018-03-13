<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>프로필관리</title>

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

.menu {
	flex: 1;
	border-right: 1px solid #DEDEDE;
}

.menu2 {
	flex: 1;
}

.photo {
	text-align: center;
	padding-top: 15%;
}

#table {
	display: table;
	padding-left: 20%;
	padding-top: 5%;
	padding-right: 20%;
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
	width: 50%;
}

.col2 {
	padding-left: 20%;
	width: 50%;
}

</style>

<body>
	<font color="#808080">

		<div id="top">
			<div class="menu">
				<font color="263137"><b>프로필 관리</b></font>
			</div>
			<div class="menu">
				<font color="5C7885">채팅 관리</font>
			</div>
			<div class="menu">
				<font color="5C7885">관심 상점</font>
			</div>
			<div class="menu2">
				<font color="5C7885">관심 상품 </font>
			</div>
		</div> <%
 	String id = "";

 	id = (String) session.getAttribute("member_id");

 	if (id != null) {
 		Class.forName("com.mysql.jdbc.Driver");

 		try {
 			Connection conn = null; // null로 초기화 한다.

 			PreparedStatement pstmt = null;
 			ResultSet rs = null;

 			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false", "root", "1234"); // DriverManager 객체로부터 Connection 객체를 얻어온다.

 			String sql = "SELECT member_id,member_pw,member_nm,member_phone,member_add,member_acnum,member_email,member_photo FROM member Where member_id=?";

 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, id);
 			rs = pstmt.executeQuery();

 			if (rs.next()) {
 				String member_id = rs.getString(1);
 				String member_pw = rs.getString(2);
 				String member_nm = rs.getString(3);
 				String member_phone = rs.getString(4);
 				String member_add = rs.getString(5);
 				String member_acnum = rs.getString(6);
 				String member_email = rs.getString(7);
 				String member_photo = rs.getString(8);
 %>


		<div class="photo">
			<img src="<%=member_photo%>" width=200 height=200></img>
		</div>


		<form action="m_mypage_profile_okdb.jsp" method="post" id="join">

			<div id="table">
				<div class="row">
					<span class="cell col1">아이디</span> <span class="cell col2"><input
						type="text" id="MEMBER_ID" name=MEMBER_ID maxlength="15"
						value="<%=member_id%> " readonly="readonly"
						style="border: 0px; font-size: 25px;"></span>
				</div>
				<div class="row">
					<span class="cell col1">비밀번호</span> <span class="cell col2"><input
						type="password" id="MEMBER_PW" name=MEMBER_PW maxlength="15"
						value="<%=member_pw%>" style="border: 0px; font-size: 25px;"></span>
				</div>
				<div class="row">
					<span class="cell col1">이름</span> <span class="cell col2"><input
						type="text" id="MEMBER_NAME" name=MEMBER_NAME maxlength="15"
						value="<%=member_nm%>" style="border: 0px; font-size: 25px;"></span>
				</div>

				<div class="row">
					<span class="cell col1">핸드폰 번호</span> <span class="cell col2"><input
						type="text" id="MEMBER_PHONE" name=MEMBER_PHONE maxlength="15"
						value="<%=member_phone%>" style="border: 0px; font-size: 25px;"></span>
				</div>
								<div class="row">
					<span class="cell col1">이메일</span> <span class="cell col2"><input
						type="text" id="MEMBER_EMAIL" name=MEMBER_EMAIL maxlength="15"
						value="<%=member_email%>" style="border: 0px; font-size: 25px;"></span>
				</div>
				<div class="row">
					<span class="cell col1">주소</span> <span class="cell col2"><input
						type="text" id="MEMBER_ADD" name=MEMBER_ADD
						value="<%=member_add%>" style="border: 0px; font-size: 25px;"></span>
				</div>
				<div class="row">
					<span class="cell col1">계좌 번호</span>
					<%
						if (member_acnum == null) {
					%>
					<span class="cell col2"><input type="text" id="MEMBER_ACNUM"
						name=MEMBER_ACNUM style="border: 0px; font-size: 25px;"></span>
					<%
						} else {
					%>
					<span class="cell col2"><input type="text" id="MEMBER_ACNUM"
						name=MEMBER_ACNUM value="<%=member_acnum%>"
						style="border: 0px; font-size: 25px;"></span>
					<%
						}
					%>
				</div>
			</div>			<br><br><br>
						<div style="padding-left: 20%;">
				<input type="button" id="join" name="join" value="프로필 수정" size=150
					onclick="form.submit();"
					style="fontsize: 50px; height: 40px; width: 35%; border: 1px solid #5C7885;" />
				<input type="reset" value="삭제"
					style="fontsize: 50px; height: 40px; width: 35%; border: 1px solid #5C7885;">

			</div>
		</form>
		</font>
</body>

<%
	}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			out.println(e.toString());
		}
	} else {
%>

<p style="text-align: center; padding-top: 100px;">
	<br> <br> 로그인을 해주세요 <br> <br> <a href="j_login.jsp">로그인</a>
</p>
<%
	}
%>

<br><br>
<%@include file="floating.jsp"%>

</body>
</html>

