<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항</title>
</head>
<body>

	<%@include file="junggo.jsp"%>

	<style>
#top {
	display: flex;
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
		border-bottom: 1px solid #DEDEDE;
	padding-bottom: 3%;
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
	width: 95%;
	padding-left: 3%;
	padding-right: 5%;
	padding-top: 5%;
	text-align: center;
}

.row {
	display: table-row;
}

.cell {
	display: table-cell;
	padding: 2%;
	padding-bottom: 3%;
	border-bottom: 1px solid #DDD;
	border-top: 1px solid #DDD;
}

.cell2 {
	display: table-cell;
	padding: 2%;
	padding-bottom: 3%;
	border-bottom: 1px solid #DDD;
}

.col1 {
	width: 15%;
}

.col2 {
	width: 35%;
}

.col3 {
	width: 35%;
}

.col4 {
	width: 15%;
}
</style>
<body>


	<div id="top">
		<div class="menu">
			<font color="263137"><b>공지 사항</b></font>
		</div>
		<div class="menu">
			<font color="5C7885">Q&A</font>
		</div>
		<div class="menu2">
			<font color="5C7885">FAQ</font>
		</div>
	</div>

	<%
	int adminchk=0;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false"; //아이피주소와 port와 DB명을 입력합니다.
		String id = "root"; // DB USER명
		String pass = "1234";
		int total = 0;

		try {
			Connection conn = DriverManager.getConnection(url, id, pass);
			Statement stmt = conn.createStatement();

			String sqlCount = "SELECT COUNT(*) FROM notice";
			ResultSet rs = stmt.executeQuery(sqlCount);

			if (rs.next()) {
				total = rs.getInt(1);
			}

			rs.close();

			String sqlAdmin = "select admin_id from admin where admin_id=?";

			//로그인 완료시 id를 session으로 받아옴

			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(sqlAdmin);
			pstmt.setString(1, (String) session.getAttribute("member_id"));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				adminchk=1;
			}
			rs.close();
	%>
	<br>
	<br>
	<p align="left" style="padding-left: 5%">
		<font color="5C7885"> 총게시물 : <%=total%> 개
		</font>
	</p>
	<%
		String sqlList = "SELECT NOTICE_SEQ,NOTICE_TITLE,NOTICE_DATE,NOTICE_HIT from NOTICE order by NOTICE_SEQ desc";
			rs = stmt.executeQuery(sqlList);
	%>
	<font color="263137">
		<div id="table">
			<div class="row">
				<span class="cell col1">글 번호</span> <span class="cell col2">제
					목</span> <span class="cell col3">작성일</span> <span class="cell col4">조회수</span>

			</div>
		</div> <%
 	if (total == 0) {
 %>
		<div id="table">
			<div class="row">
				<span class="cell2 ">등록된 글이 없습니다.</span>
			</div>
		</div> <%
 	} else {

 			//포멧 변경
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

 			while (rs.next()) {
 				int idx = rs.getInt(1);
 				String title = rs.getString(2);
 				Timestamp date = rs.getTimestamp(3);
 				int hit = rs.getInt(4);
 %>

		<div id="table">
			<div class="row">
				<span class="cell2 col1"><%=idx%></span> <span class="cell2 col2"><a
					href="b_notice_view.jsp?idx=<%=idx%>"><%=title%></a></span> <span
					class="cell2 col3"><%=sdf.format(date)%></span> <span
					class="cell2 col4"><%=hit%></span>

			</div>
		</div> <%
 	}
 		}
 		rs.close();
 		stmt.close();
 		conn.close();
 	} catch (SQLException e) {
 		out.println(e.toString());
 	}
 %>
	</font>
	</table>
	</br></br>
	<%if(adminchk==1){%>
	<center>
		<input type=button value="글쓰기"
			OnClick="window.location='b_notice_write.jsp'" style="font-size: 20px; height: 40px; width: 30%; border: 1px solid #5C7885;">
	</center>
	 <%}%>
</body>
</html>