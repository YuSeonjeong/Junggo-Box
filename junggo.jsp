<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<title>main</title>

<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');

a:link {
	color: #000000;
	text-decoration: none
}

a:visited {
	color: #000000;
	text-decoration: none
}

a:active {
	color: #000000;
	text-decoration: none
}

a:hover {
	color: #000000;
	text-decoration: underline
}

body, table, div, p {
	font-family: 'Nanum Gothic';
}

#topbar {
	background-color: #8DA1A8;
	height: 80px;
	width: 100%;
}

.d1 {
	float: left;
}

.d3 {
	float: right;
}

#layerPop {
	width: 98%;
	height: outo;
	position: absolute;
	display: none;
	background-color: #efefef;
}

.container {
	padding-top: 5%;
	width: 100%;
	height: 100px;
	border-bottom: solid;
	border-bottom-color: white;
}

.profile {
	padding-left: 5%;
	width: 20%;
	height: 80px;
	float: left;
	width: 20%;
}

.name {
	width: 50%;
	height: 40px;
}

.id {
	width: 50%;
	height: 40px;
}

.close {
	padding-right: 5%;
	width: 20%;
	height: 80px;
	float: right;
}

.list {
	padding-top: 5%;
	width: 100%;
	height: auto;
	text-align: center;
	padding-bottom: 5%;
}

.notice {
	float: left;
	padding-left: 13%;
}

.qna {
	padding-left: 15%;
	float: left;
}

.faq {
	padding-rigth: 10%;
}

.login {
	width: 33%;
	float: left;
	padding-left: 10%;
	position: absolute;
}
</style>
<script type="text/javascript">
	//레이어 팝업 열기
	function openLayer(IdName, tpos, lpos) {
		var pop = document.getElementById(IdName);
		pop.style.display = "block";
		pop.style.top = tpos + "px";
		pop.style.left = lpos + "px";
	}

	//레이어 팝업 닫기
	function closeLayer(IdName) {
		var pop = document.getElementById(IdName);
		pop.style.display = "none";
	}
</script>
<body>
	<font size="5dp">
		<div id="topbar">
			<div class="d1">


				<a href="#" onclick="openLayer('layerPop')"> <img
					src='picture/my_1.png' style="height: 80px; width: outo;" /></a>

			</div>
			<div class="d3">
				<img src='picture/my_3.png' style="height: 80px; width: outo;" /> <img
					src='picture/my_4.png' style="height: 80px; width: outo;" />
			</div>

			<div align="center">
				<img src='picture/my_2.png'
					style="height: 80px; width: outo; margin-top: 5px; margin-left: 5%" />
			</div>

		</div>
		<div id="layerPop">

			<%
				String idid = "";

				//로그인 완료시 id를 session으로 받아옴
				idid = (String) session.getAttribute("member_id");

				//id가 있으면 db연결
				if (idid != null) {
					Class.forName("com.mysql.jdbc.Driver");

					try {
						Connection conn = null; // null로 초기화 한다.

						PreparedStatement pstmt = null;
						ResultSet rs = null;

						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?autoReconnect=true&useSSL=false", "root", "1234"); // DriverManager 객체로부터 Connection 객체를 얻어온다.

						//member 테이블에서 정보를 받아와 출력  	
						String sql = "SELECT member_id,member_nm,member_photo FROM member Where member_id=?";

						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, idid);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							String member_id = rs.getString(1);
							String member_nm = rs.getString(2);
							String member_photo = rs.getString(3);
			%>

			<div class="container">
				<div class="profile">

					<a href="m_mypage_my.jsp"><img src="<%=member_photo%>"
						style="height: 80px; width: 80px;" /></a>

				</div>
				<div class="close">
					<a href="#" onclick="closeLayer('layerPop')" class="close"><img
						src="picture/close.png"
						style="float: right; padding-right: 5%; height: 60px; width: outo;" /></a>
				</div>
				<div class="name">
					<a href="m_mypage_my.jsp"><%=member_nm%></a>
				</div>
				<div class="id">
					<font size="5dp"><a href="m_mypage_my.jsp"><%=member_id%></a></font>
				</div>

			</div>
			<div class="list">
				<div class="notice">
					<a href="b_notice_list.jsp"><img src="picture/noticebt.png"
						style="height: 120px; width: outo;" /></a>
				</div>

				<div class="qna">
					<img src="picture/qnabt.png" style="height: 120px; width: outo;" />
				</div>
				<div class="faq">
					<a href="b_faq_list.jsp"><img src="picture/faqbt.png"
						style="height: 120px; width: outo;" /></a>
				</div>

			</div>
			<%
				}
						rs.close();
						pstmt.close();
						conn.close();
					} catch (SQLException e) {
						out.println(e.toString());
					}
				}
				//로그인 상태가 아닐 때(session으로 id값을 받지 못했을 때)
				else {
			%>
			<div class="container">
				<div class="login">
					<a href="j_login.jsp">로그인을 해주세요</a>
				</div>
				<div class="close">
					<a href="#" onclick="closeLayer('layerPop')" class="close"><img
						src="picture/close.png"
						style="float: right; padding-right: 5%; height: 60px; width: outo;" /></a>
				</div>
			</div>
			<div class="list">
				<div class="notice">
					<a href="b_notice_list.jsp"><img src="picture/noticebt.png"
						style="height: 120px; width: outo;" /></a>
				</div>

				<div class="qna">
					<img src="picture/qnabt.png" style="height: 120px; width: outo;" />
				</div>
				<div class="faq">
					<a href="b_faq_list.jsp"><img src="picture/faqbt.png"
						style="height: 120px; width: outo;" /></a>
				</div>

			</div>

			<%
				}
			%>

		</div>
</body>