<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.EventDAO" %>
<%@ page import="kr.co.hyundai.vo.EventVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board List</title>
</head>
<body>
	<jsp:useBean id="eVO" class="kr.co.hyundai.vo.EventVO">
		<jsp:setProperty name="eVO" property="*"></jsp:setProperty>
	</jsp:useBean>
<%
	EventDAO eDao = new EventDAO();
	eDao.deleteEvent(eVO.getEventNum());
	session.removeAttribute("eventNum");
	response.sendRedirect("rentCarMain.jsp?center=eventMain.jsp");
%>

</body>
</html>