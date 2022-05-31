<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.BoardDAO" %>
<%@ page import="kr.co.hyundai.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWritePro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
%>
	<jsp:useBean id="bVO" class="kr.co.hyundai.vo.BoardVO">
		<jsp:setProperty name="bVO" property="*"></jsp:setProperty>
	</jsp:useBean>
<%
	BoardDAO bDAO = new BoardDAO();
	bDAO.updateBoard(num, bVO);
	response.sendRedirect("rentCarMain.jsp?center=boardDetail.jsp?num=" + num);
%>
</body>
</html>