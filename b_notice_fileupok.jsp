<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<body> 
<% 

String savePath=application.getRealPath("/picture");     
int sizeLimit = 5 * 1024 * 1024 ;      
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", 
new DefaultFileRenamePolicy());    

File file = multi.getFile("upfile");      
String fileName=file.getName(); 
long fileSize=file.length();

if(fileName == null) {     
   out.print("파일 업로드 되지 않았음 (이유: 파일 사이즈 초과 등)");
} else { 
	

%>


<form action="b_notice_write.jsp" method="post">

파일 이름 <input type="text" name="fileName" value="<%=fileName %>">
   <img src="./image/<%=fileName %>" width="300">
   <input type="submit" value="확인">
   
<% } %>


          
  <script language=javascript>
   self.window.alert("사진 업로드를 완료하였습니다.");
  </script>
</body>
</html>
