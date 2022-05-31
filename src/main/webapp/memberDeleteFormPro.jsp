<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 처리</title>
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
%>
	<jsp:useBean id="mVO" class="kr.co.hyundai.vo.MemberVO">
		<jsp:setProperty name="mVO" property="*"/>
	</jsp:useBean>
<% 	
	mVO.setId(id);
	MemberDAO mDAO = new MemberDAO();
	mDAO.deleteMember(mVO);
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원 삭제 처리</h2>
	<table align="center" border="2px" width="550" style="border-collapse: collapse; border-color: silver;">
		<tr>
			<td colspan="2" align="center"><input type="button" value="회원삭제 완료" onclick="location.href='rentCarMain.jsp?center=memberJoinForm.jsp'" style="width: 50%; background: #f0ffff;"></td>	
		</tr>
	</table>
</body>
</html>