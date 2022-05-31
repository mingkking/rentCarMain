<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session을 이용한 로그아웃</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(!id.equals(null)) {
		session.setAttribute("id", null);
		session.setAttribute("password1", null);
	}
	response.sendRedirect("rentCarMain.jsp");
%>
</body>
</html>