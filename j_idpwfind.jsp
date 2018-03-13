<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


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
	border-bottom: 3px solid #DEDEDE;
}

.find {
	flex: 1;
			padding-bottom: 2%;
	border-bottom: 8px solid #DEDEDE;
}

.form {
	padding-top: 100px;
	margin-left: 150px;
	color: #263137;
}

.label {
	width: 70%;
	height: 40px;
	border: 1px solid #000000;
	padding-top: 10px;
}
</style>

<body>
<%@include file="junggo.jsp"%>

	<div id="top">
		<div class="join">
			<a href="j_join.jsp"><font color="5C7885">  회원가입</font></a>
		</div>

		<div class="find">
	<font color="263137"> 아이디/비밀번호 찾기</font>

		</div>
	</div>

	아이디/비밀번호 찾ㅈ기

</body>

</html>