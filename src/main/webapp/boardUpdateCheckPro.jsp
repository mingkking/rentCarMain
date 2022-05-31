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
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String password = request.getParameter("password");
	BoardDAO bDAO = new BoardDAO();
	BoardVO bVO = bDAO.updateCheck(num);

	if(!password.equals(bVO.getPassword())) {
%>
		<script type="text/javascript">
			alert("비번이 일치하지 않습니다.");
			location.href="rentCarMain.jsp?center=boardUpdateCheck.jsp?num=<%=num %>";
		</script>
<% 	
		return ;
	}
	else {
		response.sendRedirect("rentCarMain.jsp?center=boardUpdate.jsp?num=" + num);
	}
%>
</body>
</html>