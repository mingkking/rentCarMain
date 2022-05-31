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
	String password = request.getParameter("password");
	BoardDAO bDAO = new BoardDAO();
	BoardVO bVO = bDAO.updateCheck(num); // 이름 때문에 헷갈릴 수 있음(게시글 num에 대한 패스워드 가져오기 위한 메소드: updateCheck() )

	if(!password.equals(bVO.getPassword())) {
%>
		<script type="text/javascript">
			alert("비번이 일치하지 않습니다.");
			location.href="rentCarMain.jsp?center=boardDeleteCheck.jsp?num=<%=num %>";
		</script>
<% 	
		return ;
	}
	else {
		response.sendRedirect("boardDeletePro.jsp?num=" + num);
	}
%>
</body>
</html>