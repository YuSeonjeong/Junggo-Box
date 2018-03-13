<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


</head>

<script type="text/javascript">
	function formCheck() {

		var MEMBER_NM = document.getElementById('MEMBER_NM');
		var MEMBER_ID = document.getElementById('MEMBER_ID');
		var MEMBER_PW = document.getElementById('MEMBER_PW');
		var MEMBER_PW_check = document.getElementById('MEMBER_PW_check');
		var MEMBER_PHONE = document.getElementById('MEMBER_PHONE');
		var MEMBER_PHONEYN = document.getElementById('MEMBER_PHONEYN');
		var MEMBER_EMAIL = document.getElementById('MEMBER_EMAIL');
		var MEMBER_EMAILYN = document.getElementById('MEMBER_EMAILYN');
		var MEMBER_ADDRESS = document.getElementById('MEMBER_ADDRESS');

		if (MEMBER_ID.value == '' || MEMBER_ID.value == null) {

			alert('ID를 입력하세요');

			focus.MEMBER_ID;

			return false;

		}

		if (MEMBER_PW.value == '' || MEMBER_PW.value == null) {

			alert('비밀번호를 입력하세요');

			focus.MEMBER_PW;

			return false;

		}

		if (MEMBER_PW_check.value == '' || MEMBER_PW_check.value == null) {

			alert('비밀번호확인란을 입력하세요');
			focus.MEMBER_PW_check;

			return false;

		}
		if (MEMBER_NM.value == '' || MEMBER_NM.value == null) {

			alert('이름을 입력하세요');

			focus.MEMBER_NM;

			return false;

		}

		if (MEMBER_PHONE.value == '' || MEMBER_PHONE.value == null) {

			alert('핸드폰 번호를 입력하세요');

			focus.MEMBER_PHONE;

			return false;

		}

		if (MEMBER_PHONEYN.value == '' || MEMBER_PHONEYN.value == null) {

			alert('SMS수신 여부를 입력하세요');

			focus.MEMBER_PHONEYN;

			return false;

		}

		if (MEMBER_EMAIL.value == '' || MEMBER_EMAIL.value == null) {

			alert('이메일을 입력하세요');

			focus.MEMBER_EMAIL;

			return false;

		}

		if (MEMBER_EMAILYN.value == '' || MEMBER_EMAILYN.value == null) {

			alert('이메일 수신 여부를 입력하세요');

			focus.MEMBER_EMAILYN;

			return false;

		}

		if (MEMBER_ADDRESS.value == '' || MEMBER_ADDRESS.value == null) {

			alert('주소를 입력하세요');

			focus.MEMBER_ADDRESS;

			return false;

		}

		/*비밀번호와 비밀번호확인란 같은지 확인*/

		if (MEMBER_PW.value != MEMBER_PW_check.value) {

			alert("비밀번호와 비밀번호 확인란이 다릅니다.");

			focus.passowrd;

			return false;

		}

		save();

	}

	function save() {

		var str3 = document.getElementById('join');

		str3.submit();

		alert("가입이 완료되었습니다.")

		// location.href="db.jsp";      

	}

	function idCheck(id) {
		wx = 300;
		wy = 150;
		sx = screen.width;
		sy = screen.hight;
		x = (sx - wx) / 2;
		y = (sy - wy) / 2;
		if (id == "") {
			window.alert("아이디를 입력해 주세요");
		} else {
			url = "j_join_idcheck.jsp?id=" + id;
			wr = window.open(url, "아이디검색", "width=300,height=150");
			wr.moveTo(x, y);
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>
<%@include file="junggo.jsp"%>

</head>

</head>


<style>
#top {
	display: flex;
	padding-top: 3%;
	width: 100%;
	height: auto;
	text-align: center;
}

.join {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 8px solid #DEDEDE;
}

.find {
	flex: 1;
	padding-bottom: 2%;
	border-bottom: 3px solid #DEDEDE;
}

form {
	padding-top: 8%;
	margin: auto;
}

.label {
	width: 70%;
	height: 40px;
	border: 1px solid #828282;
	padding-top: 10px;
}

#table {
	display: table;
	padding-left: 15%;
	padding-top: 5%;
	padding-right: 15%;
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
	width: 40%;
}

.col2 {
	width: 70%;
}
</style>

<body>

	<div id="top">
		<div class="join">
			<font color="263137"> 회원가입 </font>
		</div>

		<div class="find">
			<a href="j_idpwfind.jsp"> <font color="5C7885"> 아이디/비밀번호
					찾기</font>

			</a>
		</div>
	</div>

	<form action="j_join_okdb.jsp" method="post" id="join">

		<div id="table">
			<div class="row">
				<span class="cell col1">아이디</span> <span class="cell col2"><span><input
						type="text" id="MEMBER_ID" name=MEMBER_ID maxlength="10"
						style="border: 0px; font-size: 25px; width: 60%;"></span><span
					style="padding-left: 3%;"><input type="button" value="중복확인"
						style="height: 44px;"
						onClick="JavaScript:idCheck(this.form.MEMBER_ID.value)"></span></span>
			</div>
			<div class="row">
				<span class="cell col1">비밀번호</span> <span class="cell col2"><input
					type="password" id="MEMBER_PW" name=MEMBER_PW maxlength="15"
					style="border: 0px; font-size: 25px; width: 80%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">비밀번호 확인</span> <span class="cell col2"><input
					type="password" id="MEMBER_PW_check" maxlength="15"
					style="border: 0px; font-size: 25px; width: 80%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">이름</span> <span class="cell col2"><input
					type="text" size=80 id="MEMBER_NM" name=MEMBER_NM maxlength="15"
					style="border: 0px; font-size: 25px; width: 80%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">휴대폰 번호</span> <span class="cell col2"><input
					type="text" size=80 id="MEMBER_PHONE" name=MEMBER_PHONE
					placeholder="-제외 하고 입력해주세요."
					style="border: 0px; font-size: 25px; width: 90%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">이메일 주소</span> <span class="cell col2"><input
					type="text" id="MEMBER_EMAIL" size=80 name=MEMBER_EMAIL
					style="border: 0px; font-size: 25px; width: 80%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">주소</span> <span class="cell col2"><input
					type="text" id="MEMBER_ADDRESS" size=80 name=MEMBER_ADDRESS
					style="border: 0px; font-size: 25px; width: 80%;"></span>
			</div>
			<div class="row">
				<span class="cell col1">SMS 수신여부</span> <span class="cell col2"><input
					type="radio" name="MEMBER_PHONEYN" id="MEMBER_PHONEYN" value="Y">받음
					<input name="MEMBER_PHONEYN" id="MEMBER_PHONEYN" type="radio"
					value="N" style="border: #DEDEDE">받지 않음</span>
			</div>
			<div class="row">
				<span class="cell col1">EMAIL 수신여부</span> <span class="cell col2"><input
					type="radio" name="MEMBER_EMAILYN" id="MEMBER_EMAILYN" value="Y">받음
					<input name="MEMBER_EMAILYN" id="MEMBER_EMAILYN" type="radio"
					value="N">받지않음</span>
			</div>
		</div>
		<br><br>
		<div align="center">
			<input type="button" id="join" name="join" value="회원 가입" size=150
				onclick="javascript:formCheck();"
				style="fontsize: 50px; height: 40px; width: 35%; border: 1px solid #5C7885;" />
			<input type="reset" value="삭제"
				style="fontsize: 50px; height: 40px; width: 35%; border: 1px solid #5C7885;">

		</div>

	</form>

</body>

</html>