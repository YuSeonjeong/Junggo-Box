<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false"; //아이피주소와 port와 DB명을 입력합니다.
String id = "root"; // DB USER명
String pass = "1234";
	String password = "";
	
		try{
			
			request.setCharacterEncoding("UTF-8");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String memo = request.getParameter("memo");
		
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
			String sql = "UPDATE notice SET notice_title='" + title+ "' ,notice_content='"+ memo +"' WHERE notice_seq=" + idx;				
			stmt.executeUpdate(sql);

			stmt.close();
			conn.close();
			
	
			%>
			<script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="b_notice_view.jsp?idx=<%=idx%>"
</script>
			<%
 } catch(SQLException e) {
	out.println( e.toString() );
}
%>


