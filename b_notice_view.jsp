<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="junggo.jsp"%>

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
<%
	int adminchk = 0;

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "1234";
	int idx = Integer.parseInt(request.getParameter("idx"));
	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT notice_title, notice_content,notice_image, notice_file,notice_date, notice_hit FROM notice WHERE NOTICE_SEQ="
				+ idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String title = rs.getString(1);
			String content = rs.getString(2);
			String image = rs.getString(3);
			String file = rs.getString(4);
				Timestamp date = rs.getTimestamp(5);
			int hit = rs.getInt(6);
			hit++;
%>

<script language="JavaScript">
function del() {
    var Del = confirm("삭제 하시겠습니까?")
        if (Del == true)
        {
            location.href="b_notice_delete_ok.jsp?idx=<%=idx%>"
        } else {
            alert("취소 되었습니다.")
                }
}

</script>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
</head>
<body>

	<div id="top" style="text-align: center;">
		<b>공 지 사 항</b>
	</div>


<%
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	<div id="table">
		<div class="row">
			<span class="cell col1"><b>글 번호</b></span><span class="cell col2"><%=idx%></span>
		</div>
		<div class="row">
			<span class="cell col1"><b>작성일</b></span><span class="cell col2"><%=sdf.format(date)%></span>
		</div>
		<div class="row">
			<span class="cell col1"><b>제목</b></span> <span class="cell col2"><%=title%></span>
		</div>
	</div>

	<div class="content">

		<%
			if (image != null) {
		%>
		<div class="row">
			<img src="./picture/<%=image%>" width="300dp">
		</div>

		<%
			}
		%>


		<div style="padding-top: 3%"><%=content%>
		</div>
	</div>


	<%
		rs.close();

				String sqlAdmin = "select admin_id from admin where admin_id=?";

				//로그인 완료시 id를 session으로 받아옴

				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sqlAdmin);
				pstmt.setString(1, (String) session.getAttribute("member_id"));
				rs = pstmt.executeQuery();

				if (rs.next()) {
					adminchk = 1;
				}
				
				
				 	sql = "UPDATE notice SET notice_hit=" + hit + " where notice_seq=" +idx;
				 	stmt.executeUpdate(sql);
				 	rs.close();
				 	stmt.close();
				 	conn.close();
					 	} 
					}catch(SQLException e) {
				}

		if (adminchk == 1) {
	%>
	<center style="padding-top: 5%;">

		<input type=button value="목록"
			OnClick="window.location='b_notice_list.jsp'"
			style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
		<input type=button value="수정"
			OnClick="window.location='b_notice_modify.jsp?idx=<%=idx%>'"
			style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
		<input type=button value="삭제"
		 onclick="del()" style="font-size: 20px; height: 40px; width: 10%; border: 1px solid #5C7885;">
	</center>
	<%
		} else{
	%>
		<center style="padding-top: 5%;">

		<input type=button value="목록"
			OnClick="window.location='b_notice_list.jsp'"
			style="fontsize: 50px; height: 40px; width: 10%; border: 1px solid #5C7885;">
	</center>
	
	<%} %>




</body>



</html>

