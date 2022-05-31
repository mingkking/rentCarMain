<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.NoticeDAO" %>
<%@ page import="kr.co.hyundai.vo.NoticeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWritePro</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="nVO" class="kr.co.hyundai.vo.NoticeVO">
		<jsp:setProperty name="nVO" property="*"></jsp:setProperty>
	</jsp:useBean>
<%
	NoticeDAO nDAO = new NoticeDAO();
	nDAO.insertNotice(nVO);
	response.sendRedirect("rentCarMain.jsp?center=noticeMain.jsp");
%>
</body>
</html>