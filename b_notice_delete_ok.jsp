<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false";
	String id = "root";
	String pass = "1234";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "DELETE FROM notice WHERE notice_seq=" + idx;
		stmt.executeUpdate(sql);
%>
<script language=javascript>
	self.window.alert("해당 글을 삭제하였습니다.");
	location.href = "b_notice_list.jsp?";
</script>

<%
		stmt.close();
		conn.close();

	} catch (SQLException e) {
		out.println(e.toString());
	}
%>