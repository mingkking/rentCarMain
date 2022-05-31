<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
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
	String id2 = (String)session.getAttribute("id");
	if(id2 == null){
		id2 = "guest";
	}
	if(!id2.equals("guest")){
%>		
		<script>
			alert("로그인 상태에서 회원가입 불가능");
			location.href = "rentCarMain.jsp?center=memberJoinForm.jsp"
		</script>
<%	
		return;
	}
	
	String id = request.getParameter("id");
	request.setCharacterEncoding("UTF-8");

	String hobby[] = request.getParameterValues("hobby");
	String textHobby = "";
	if(hobby != null) {
		for(int i=0; i<hobby.length; i++){
			textHobby = textHobby + hobby[i] + " ";
		}	
	}
	else{
		textHobby = "없음";
	}
%>
	<jsp:useBean id="mVO" class="kr.co.hyundai.vo.MemberVO">
		<jsp:setProperty name="mVO" property="*"/>
	</jsp:useBean>
<%
	MemberDAO mDAO = new MemberDAO();
	
	if(!mVO.getPassword1().equals(mVO.getPassword2())){
%>		
		<script>
			alert("비번이 일치하지 않습니다.");
			location.href = "rentCarMain.jsp?center=memberJoinForm.jsp"
		</script>
<%	
		return;
	} 

	mVO.setHobby(textHobby);
	int result = mDAO.insertMember(mVO);
	if(result == 0){
%>
		<script>
			alert("회원가입 실패.");
			location.href = "rentCarMain.jsp?center=memberJoinForm.jsp"
		</script>
<%		
		return;
	}
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원가입 처리</h2>
	<table align="center" border="2px" width="550" style="border-collapse: collapse; border-color: silver;">
		<tr>
			<td width="150">아이디</td>
			<td width="250"><%=mVO.getId() %></td>
		</tr>
		<tr>
			<td width="150">전자우편</td>
			<td width="250"><%=mVO.getEmail() %></td>
		</tr>
		<tr>
			<td width="150">전화번호</td>
			<td width="250"><%=mVO.getTel() %></td>
		</tr>
		<tr height="40px">
			<td width="150">관심분야</td>
			<td width="250">
				<%=mVO.getHobby() %>
			</td>
		</tr>
		<tr height="40px">
			<td width="150">직업</td>
			<td width="250">
				<%=mVO.getJob() %>
			</td>
		</tr>
		<tr height="40px">
			<td width="150">연령대</td>
			<td width="250">
				<%=mVO.getAge() %>
			</td>
		</tr>
		<tr height="40px">
			<td width="150">하고 싶은 말</td>
			<td width="250">
				<%=mVO.getInfo() %>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="회원가입 완료" onclick="location.href='rentCarMain.jsp?center=memberJoinForm.jsp'" style="width: 50%; background: #f0ffff;"></td>	
		</tr>
	</table>
</body>
</html>