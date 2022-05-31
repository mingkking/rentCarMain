<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Comment</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
		id = "guest";
	}
	else {
		id = id;
	}
	
	if(id.equals("guest")){
%>		
		<script>
			alert("로그인 먼저 해주세요");
			location.href = "rentCarMain.jsp"
		</script>
<%	
		return;
	}
	
	MemberDAO mdao = new MemberDAO();
	MemberVO mvo = mdao.selectMemberOne(id);

	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int pno = Integer.parseInt(request.getParameter("pno"));
%>
	<h2 align="center" style="width: 600px; background: blue; color: white; ">게시글 댓글 쓰기</h2>
	<form action="boardCommentPro.jsp" method="post" align="center">
		<table align="center" border="1" width="600" style="border-collapse: collapse; border-color: skyblue;">
			<tr height="40px">
				<th width="200">번호</th>
				<td width="400"><%=num %></td>
			</tr>
			<tr height="40px">
				<th width="200">작성자</th>
				<td width="400"><%=id %></td>
			</tr>
			<tr height="40px">
				<th width="200">전자우편</th>
				<td width="400"><%=mvo.getEmail() %></td>
			</tr>
			<tr height="40px">
				<th width="200">댓글 제목</th>
				<td width="400"><input id="inputCss" type="text" name="subject" placeholder="댓글 제목은 자율적으로 입력해주세요." required style="width: 98%; height: 30px;"></td>
			</tr>
			<tr height="40px">
				<th width="150">패스워드</th>
				<td width="250"><input id="inputCss" type="password" name="password" placeholder="영문자, 숫자를 입력해주세요." required style="width: 98%; height: 30px;"></td>
			</tr>
			<tr height="40px">
				<th width="150">댓글 내용</th>
				<td width="250"><textarea rows="10" cols="40" name="content" style="width: 98%;">댓글 내용</textarea></td>
			</tr>
			<tr height="40px">
				<td colspan="2">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="hidden" name="cnt" value="<%=cnt %>">
					<input type="hidden" name="pno" value="<%=pno %>">
					<input type="hidden" name="writer" value="<%=id %>">
					<input type="hidden" name="email" value="<%=mvo.getEmail() %>">
					<input type="submit" value="작성 완료" style="width: 50%; background: #f0ffff;">
				</td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="reset" value="취소" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="뒤로 가기" onclick="location.href='rentCarMain.jsp?center=boardDetail.jsp?num=<%=num %>'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
		</table>
	</form>
</body>
</html>