<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.GregorianCalendar" %>
<%
	request.setCharacterEncoding("UTF-8");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false";
String id = "root";
String pass = "1234";

	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	String image = request.getParameter("fileName");
	

	int max=0;
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(notice_seq) FROM notice";
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
			max=rs.getInt(1);
		} 
		 max+=1;
		 
		sql = "INSERT INTO notice(notice_seq,notice_title,notice_content,notice_image) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,max);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setString(4, image);
		max++;
		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();

} catch(SQLException e) {
	out.println( e.toString() );
	}
	
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="b_notice_list.jsp";
  </script>