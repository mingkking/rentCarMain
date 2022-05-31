<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 확인</title>
<style type="text/css">
	#inputCss{
		height: 30px;
		width: 400px;
		border-color: windowframe;
	}
	body{
		width: 1400px;
		margin: 0 auto;
	}
	th{
		background: lightgray;
	}
	td{
		background: white;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password1 = request.getParameter("password1");
	
	MemberDAO mDAO = new MemberDAO();
	MemberVO mVO = new MemberVO();

	mVO = mDAO.selectMemberOne(id);
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">아이디, 비밀번호 확인</h2>
<%	
	try{
		if(!password1.equals(mVO.getPassword1())){
%>		
			<script>
				alert("비번이 일치하지 않습니다.");
				location.href = "rentCarMain.jsp?center=memberUpdateCheckForm.jsp"
			</script>
<%	
			return;
		}
		response.sendRedirect("rentCarMain.jsp?center=memberUpdateForm.jsp?id=" + id);
	} catch(NullPointerException e){
%>
		<script>
			alert("없는 ID 입니다.");
			location.href = "rentCarMain.jsp?center=memberUpdateCheckForm.jsp"
		</script>
<%
	}
%>
	

</body>
</html>