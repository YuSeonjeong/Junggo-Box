<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
   request.setCharacterEncoding("utf-8"); %>


<%
GregorianCalendar now = new GregorianCalendar();
String date = String.format("%TF",now);
String MEMBER_ID = request.getParameter("MEMBER_ID");
String MEMBER_PW = request.getParameter("MEMBER_PW");
String MEMBER_NM = request.getParameter("MEMBER_NM");
String MEMBER_NNAME = request.getParameter("MEMBER_NNAME");
String MEMBER_PHONE = request.getParameter("MEMBER_PHONE");
String MEMBER_EMAIL = request.getParameter("MEMBER_EMAIL");
String MEMBER_ADDRESS = request.getParameter("MEMBER_ADDRESS");
String MEMBER_PHONEYN = request.getParameter("MEMBER_PHONEYN");
String MEMBER_EMAILYN = request.getParameter("MEMBER_EMAILYN");

	Connection conn = null; // null로 초기화 한다.
	String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술

	String id = "root"; // 사용자 계정

	String pw = "1234"; // 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,id,pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.

   
   int memberSeq=0;
   
   try {   
      String SQL =  "SELECT MAX(MEMBER_SEQ) FROM MEMBER";
      PreparedStatement Ps=conn.prepareStatement(SQL);
      ResultSet rs = Ps.executeQuery();
      
      while(rs.next()){
       memberSeq=rs.getInt("MAX(MEMBER_SEQ)");
          }
      memberSeq+=1;
      
      String sql = "INSERT INTO MEMBER(MEMBER_SEQ,MEMBER_ID,MEMBER_NM,MEMBER_PW,MEMBER_PHONE,MEMBER_EMAIL,MEMBER_PHONEYN,MEMBER_EMAILYN,MEMBER_ADD) VALUES(?,?,?,?,?,?,?,?,?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setInt(1, memberSeq);
     
      pstmt.setString(2, MEMBER_ID);
      pstmt.setString(3, MEMBER_NM);
      pstmt.setString(4, MEMBER_PW);
      pstmt.setString(5, MEMBER_PHONE);
      pstmt.setString(6, MEMBER_EMAIL);
      pstmt.setString(7, MEMBER_PHONEYN);
      pstmt.setString(8, MEMBER_EMAILYN);
      pstmt.setString(9, MEMBER_ADDRESS);
      
      
      pstmt.execute();
      pstmt.close();
      conn.close();
} catch(SQLException e) {
   out.println( e.toString() );}
%>
<script language=javascript>
   location.href="m_mypage_my.jsp"; 

</script>