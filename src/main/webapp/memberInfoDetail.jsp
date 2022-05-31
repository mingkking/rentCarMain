<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 보기</title>
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
	
	MemberDAO mDAO = new MemberDAO();
	MemberVO mVO = new MemberVO();
	
	mVO = mDAO.selectMemberOne(id);
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원정보 상세 보기</h2>
	<table align="center" border="2px" width="550" style="border-collapse: collapse; border-color: silver;">
		<tr height="40px">
			<th width="150">아이디</th>
			<td width="250"><%=mVO.getId() %></td>
		</tr>
		<tr height="40px">
			<th width="150">전자우편</th>
			<td width="250"><%=mVO.getEmail() %></td>
		</tr>
		<tr height="40px">
			<th width="150">전화번호</th>
			<td width="250"><%=mVO.getTel() %></td>
		</tr>
		<tr height="40px">
			<th width="150">관심분야</th>
			<td width="250">
				<%=mVO.getHobby() %>
			</td>
		</tr>
		<tr height="40px">
			<th width="150">직업</th>
			<td width="250">
				<%=mVO.getJob() %>
			</td>
		</tr>
		<tr height="40px">
			<th width="150">연령대</th>
			<td width="250">
				<%=mVO.getAge() %>
			</td>
		</tr>
		<tr height="40px">
			<th width="150">하고 싶은 말</th>
			<td width="250">
				<%=mVO.getInfo() %>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="회원 전체 목록 보기" onclick="location.href='rentCarMain.jsp?center=memberList.jsp'" style="width: 50%; background: #f0ffff;"></td>	
		</tr>
	</table>	
</body>
</html>