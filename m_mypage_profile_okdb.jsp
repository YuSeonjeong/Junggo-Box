<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String idid = "";
	idid = (String) session.getAttribute("member_id");
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("MEMBER_PW");
	String name = request.getParameter("MEMBER_NAME");
	String phone = request.getParameter("MEMBER_PHONE");
	String add = request.getParameter("MEMBER_ADD");
	String acnum = request.getParameter("MEMBER_ACNUM");
	String email = request.getParameter("MEMBER_EMAIL");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;

	String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false";
	String user = "root";
	String pass = "1234";
	try {

		con = DriverManager.getConnection(url, user, pass);
		PreparedStatement pstmt = null;
		String sql = "";

		sql = "update member set member_nm=?, member_pw=?, member_phone=?, member_add=?, member_email=?, member_acnum=? where member_id=?";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pw);
		pstmt.setString(3, phone);
		pstmt.setString(4, add);
		pstmt.setString(5, email);
		pstmt.setString(6, acnum);
		pstmt.setString(7, idid);
		pstmt.executeUpdate();

		
		pstmt.close();
		con.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
%>
<script language=javascript>
	self.window.alert("프로필이 수정되었습니다.");
	location.href = "m_mypage_my.jsp";
</script>


