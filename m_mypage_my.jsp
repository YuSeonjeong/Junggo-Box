<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>


</head>
<style>
#top {
	display: flex;
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
}

.mypage {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 8px solid #DEDEDE;
}

.jung {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 3px solid #DEDEDE;
}

.gyung {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 3px solid #DEDEDE;

}

.my {
	flex: 1;
	border-right: 1px solid #DEDEDE;
		
}

.sale {
	flex: 1;
	border-right: 1px solid #DEDEDE;
}

.review {
	flex: 1;
}

#top3 {
	padding-top: 5%;
	text-align: center;

}
</style>

<body>


	<%
		String id = "";

		//로그인 완료시 id를 session으로 받아옴
		id = (String) session.getAttribute("member_id");

		//id가 있으면 db연결
		if (id == null) {
	%>
	<script type="text/javascript">
		alert("로그인을 해주세요.");
		location.href = "j_login.jsp";
	</script>
	<%
		}
		//로그인 ok
		else {
	%>
	<%@include file="junggo.jsp"%>
	<%
		Class.forName("com.mysql.jdbc.Driver");

			try {
				Connection conn = null; // null로 초기화 한다.

				PreparedStatement pstmt = null;
				ResultSet rs = null;

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false", "root", "1234"); // DriverManager 객체로부터 Connection 객체를 얻어온다.

				//member 테이블에서 정보를 받아와 출력  	
				String sql = "SELECT member_id,member_nm,member_photo FROM member Where member_id=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					String member_id = rs.getString(1);
					String member_nm = rs.getString(2);
					String member_photo = rs.getString(3);
	%>


	<div id="top">
		<div class="mypage">
			<font color="263137">마이페이지</font>
		</div>
				<div class="jung">
			<a href="m_junggo_1.jsp"> <font color="5C7885">중고 판매</font></a>
		</div>
		<div class="gyung">
			<a href="m_gyung_real.jsp"> <font color="5C7885">경매</font>
			</a>
		</div>

	</div>

	<div id="top">
		<div class="my">
			<font color="263137">나의 정보</font>
		</div>
		<div class="sale">
			<font color="5C7885">판매 상품</font>
		</div>
		<div class="sale">
		<font color="5C7885">경매 상품</font>
		</div>
		<div class="review"> <font color="5C7885">후기 </font>
		</div>
	</div>


	
	<p style="text-align: center; padding-top: 50px;">
		<img src="<%=member_photo%>" width=300 height=300></img>
	<p style="text-align: center; padding-top: 50px;">
		<%=member_id%><br><%=member_nm%>
		<br><br><br><a href="j_logout_ok.jsp"><font color="red">로그아웃</font></a>
	</p>


	<div id="top3">
		<a href="m_mypage_profile.jsp"> <img src="picture/menu_1.PNG"
			style="height: 150px; width: outo; 	padding-right: 3%;">
		</a> <img src="picture/menu_2.PNG" style="height: 150px; width: outo;	padding-right: 3%; ">
		<img src="picture/menu_3.PNG" style="height: 150px; width: outo;	padding-right: 3%;">
		<img src="picture/menu_4.PNG" style="height: 150px; width: outo;">
	</div>
	<br></br>
	<%
		}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				out.println(e.toString());
			}
		}
	%>

	<%@include file="floating.jsp"%>
</body>
</html>

