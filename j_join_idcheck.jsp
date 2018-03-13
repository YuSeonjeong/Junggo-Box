<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복체크</title>
</head>
<style>
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');

body, table, div, p {
	font-family: 'Nanum Gothic';
}
</style>

<%
	String id = request.getParameter("id");
%>
<br>
<center>
	<b><%=id%> </b>

	<%
		Connection conn = null; // null로 초기화 한다.

		Class.forName("com.mysql.jdbc.Driver");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select member_id from member where member_id=?";

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false", "root", "1234"); 
			// DriverManager 객체로부터 Connection 객체를 얻어온다.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				out.println("는 이미 존재하는 ID 입니다.<BR>사용 할 수 없습니다.");
			} else {
				out.println("는 사용 가능한 ID 입니다.");
			}
			pstmt.execute();
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			out.print("error 2 : " + ex);
		}
	%>
	<BR>
	<BR>
	<a href="JavaScript: window.close()">닫기</a>

</center>
</body>