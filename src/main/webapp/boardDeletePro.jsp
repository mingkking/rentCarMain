<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.BoardDAO" %>
<%@ page import="kr.co.hyundai.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bDAO = new BoardDAO();
	BoardVO bVO = bDAO.selectOneBoard(num);
	bDAO.deleteBoard(num, bVO);
	response.sendRedirect("rentCarMain.jsp?center=boardList.jsp");
%>
</body>
</html>