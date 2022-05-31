<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.BoardDAO" %>
<%@ page import="kr.co.hyundai.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board Detail</title>
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
	h2{
		background: darkgray;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bDAO = new BoardDAO();
	BoardVO bVO = bDAO.selectOneBoard(num);
	
%>
	<h2 align="center" style="width: 1200px; background: blue; color: white; ">게시판 상세보기</h2>
	<table align="center" border="1" width="1200" style="border-collapse: collapse; border-color: silver;">
		<tr height="50">
			<th width="200" align="center">번호</th>
			<td width="400" align="center"><%=bVO.getNum() %></td>
			<th width="200" align="center">제목</th>
			<td width="400" align="center"><%=bVO.getSubject() %></td>
		</tr>
		<tr height="50">
			<th width="200" align="center">글쓴이</th>
			<td width="400" align="center"><%=bVO.getWriter() %></td>
			<th width="200" align="center">전자우편</th>
			<td width="400" align="center"><%=bVO.getEmail() %></td>
		</tr>
		<tr height="50">
			<th width="200" align="center">작성일</th>
			<td width="400" align="center"><%=bVO.getReg_date() %></td>
			<th width="200" align="center">조회수</th>
			<td width="400" align="center"><%=bVO.getReadCount() %></td>
		</tr>
		<tr height="50">
			<th colspan="4" width="100%" align="center">글 내용</th>
		</tr>
		<tr height="200">
			<td colspan="4" width="100%" align="center"><%=bVO.getContent() %></td>
		</tr>
		<tr height="40px">
			<td align="center" width="300" colspan="4">
				<input type="button" value="게시판 목록" onclick="location.href='rentCarMain.jsp?center=boardList.jsp'" style="width: 20%; background: #f0ffff;">
				<input type="button" value="댓글" onclick="location.href='rentCarMain.jsp?center=boardComment.jsp?num=<%=bVO.getNum() %>&ref=<%=bVO.getRef() %>&re_step=<%=bVO.getRe_step() %>&re_level=<%=bVO.getRe_level() %>&cnt=<%=bVO.getCnt() %>&pno=<%=bVO.getPno() %>'" style="width: 20%; background: #f0ffff;">
				<input type="button" value="게시글 수정" onclick="location.href='rentCarMain.jsp?center=boardUpdateCheck.jsp?num=<%=bVO.getNum() %>'" style="width: 20%; background: #f0ffff;">
				<input type="button" value="게시글 삭제" onclick="location.href='rentCarMain.jsp?center=boardDeleteCheck.jsp?num=<%=bVO.getNum() %>'" style="width: 20%; background: #f0ffff;">
			</td>
		</tr>
	</table>
</body>
</html>