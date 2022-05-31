<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session을 이용한 로그인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password1 = request.getParameter("password1");
	
	MemberDAO mDAO = new MemberDAO();
	MemberVO mVO = new MemberVO();

	mVO = mDAO.selectMemberOne(id);
	try{
		if(!password1.equals(mVO.getPassword1())){
%>		
			<script>
				alert("비번이 일치하지 않습니다.");
				location.href = "rentCarMain.jsp?center=sessionLoginForm.jsp"
			</script>
<%	
			return;
		}
		session.setAttribute("id", id);
		session.setAttribute("password1", password1);
		session.setMaxInactiveInterval(60*60*24*365);
		response.sendRedirect("rentCarMain.jsp");
	}catch(NullPointerException e){
%>
			<script>
				alert("없는 ID 입니다.");
				location.href = "rentCarMain.jsp?center=sessionLoginForm.jsp"
			</script>
<%
	}
%>
</body>
</html>