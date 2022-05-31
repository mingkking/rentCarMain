<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board List</title>
</head>
<body>
<%
	String id = request.getParameter("id");	
	int eventCode = Integer.parseInt(request.getParameter("num"));
	
	MemberVO mVo = new MemberVO();
	MemberDAO mDao = new MemberDAO();
	mVo.setId(id);
	mVo.setEventCode(eventCode);
	mDao.insertEventCode(mVo);
	response.sendRedirect("rentCarMain.jsp");
%>
</body>
</html>