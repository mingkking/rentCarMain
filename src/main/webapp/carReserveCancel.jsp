<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	int carRNo = Integer.parseInt(request.getParameter("carRNo"));
	RentCarDAO rdao = new RentCarDAO();
	rdao.carReserveRemove(id, carRNo);
	response.sendRedirect("rentCarMain.jsp?center=carReserveView.jsp&id=" + id);
%>
</body>
</html>