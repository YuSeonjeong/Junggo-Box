<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body style="background-color: #efefef">



		<div align="center" style="padding-top: 100px">
			<img src='picture/logo.png' style="height: 120px; width: outo;" />
		</div>

		<div align="center"
			style="padding-left: 10%; padding-right: 10%; padding-top: 5%">


			<form name="login" action="j_login_ok.jsp" method="post">
				<font color="5C7885">
					<div>
						<input type="text" name="id" size="80" placeholder="아이디"
							style="height: 40px; width: 60%;" />
					</div>
					<div style="padding-top: 2%">
						<input type="password" name="pwd" size="80" placeholder="비밀번호"
							style="height: 40px; width: 60%;" />
					</div>
					<div style="padding-top: 2%">
						<input type="submit" value="로그인" size="80" style="fontsize:50px; height: 40px; width: 60%; border: 1px solid #5C7885;"/>
					</div> <br> <br> <br>
				</font> <a href="j_join.jsp">회원가입 </a> | <a href="j_idpwfind.jsp">아이디/비밀번호
						찾기 </a>
			</form>
		</div>

	</div>
</body>
</html>
