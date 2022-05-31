<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.BoardDAO" %>
<%@ page import="kr.co.hyundai.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Comment Pro</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="bVO" class="kr.co.hyundai.vo.BoardVO">
		<jsp:setProperty name="bVO" property="*"/>
	</jsp:useBean>
<%
	BoardDAO bDAO = new BoardDAO();
	bDAO.insertComment(bVO);
	response.sendRedirect("rentCarMain.jsp?center=boardList.jsp");
%>
</body>
</html>