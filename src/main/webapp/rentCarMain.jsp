<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
<style type="text/css">
	table{
		border: 1px;
	}
</style>
</head>
<body style="width: 1400px; margin: 0 auto;">
<%
	String center = request.getParameter("center");
	if(center == null){
		center = "center.jsp";
	}
%>
	<table border="1" style="border-color: skyblue; border-collapse: collapse; width: 1400px; margin: 0 auto; ">
		<tr height="200">
			<td align="center">
				<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr height="1000">
			<td align="center">
					<jsp:include page="<%=center %>"></jsp:include>
			</td>
		</tr>
		<tr height="200">
			<td align="center">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>