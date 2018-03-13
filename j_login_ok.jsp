<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.sql.*"%>


<%
     Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");

     PreparedStatement pstmt=null;
     ResultSet rs=null;
     PreparedStatement pstmt2=null;
     ResultSet rs2=null;
     String id = request.getParameter("id");
     String pwd = request.getParameter("pwd");

     String sql="select member_id, member_pw from member where member_id=? and member_pw=?";
     String sql2="select admin_id, admin_pw from admin where admin_id=? and admin_pw=?";


try
  {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false","root","1234"); // DriverManager 객체로부터 Connection 객체를 얻어온다.
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,id);
      pstmt.setString(2,pwd);
      rs=pstmt.executeQuery();
      
      pstmt2 = conn.prepareStatement(sql2);
      pstmt2.setString(1,id);
      pstmt2.setString(2,pwd);
      rs2=pstmt2.executeQuery();
      
if(rs.next()||rs2.next())
   {
	
     session.setAttribute("member_id", id);
     response.sendRedirect("m_mypage_my.jsp");
     %> 

     <%
   }



else
  {
%>
<script>

alert("ID & PASSWORD를 다시 확인하세요.");
history.go(-1);
 

</script>

  <%
   }

pstmt.close();
pstmt2.close();
conn.close();

  }catch(Exception ex){out.print("error 2 : " + ex);}
 %>
 