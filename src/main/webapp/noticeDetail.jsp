<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.NoticeDAO" %>
<%@ page import="kr.co.hyundai.vo.NoticeVO" %>
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
	String id = (String)session.getAttribute("id");
	if(id == null) {
		id = "guest";
	}
	else {
		id = id;
	}
	
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO nDAO = new NoticeDAO();
	NoticeVO nVO = nDAO.selectOneNotice(num);
	
%>
	<h2 align="center" style="width: 1200px; background: blue; color: white; ">공지 상세보기</h2>
	<table align="center" border="1" width="1200" style="border-collapse: collapse; border-color: silver;">
		<tr height="50">
			<th width="200" align="center">공지번호</th>
			<td width="400" align="center"><%=nVO.getNoticeNum() %></td>
			<th width="200" align="center">공지제목</th>
			<td width="400" align="center"><%=nVO.getNoticeSubject() %></td>
		</tr>
		<tr height="50">
			<th width="200" align="center">공지작성일</th>
			<td width="400" align="center"><%=nVO.getNoticeReg_date() %></td>
			<th width="200" align="center">공지작성자</th>
			<td width="400" align="center"><%=nVO.getNoticeWrite() %></td>
		</tr>
		<tr>
			<th colspan="4" width="300" align="center">공지내용</th>
		</tr>
		<tr>
			<td colspan="4" width="300" align="center"><%=nVO.getNoticeContent() %></td>
		</tr>		
		<tr height="40px">
			<td align="center" width="300" colspan="4">
				<input type="button" value="공지 목록" onclick="location.href='rentCarMain.jsp?center=noticeMain.jsp'" style="width: 20%; background: #f0ffff;">
				<%
					if(id.equals("jumki12")){
					%>
						<input type="button" value="공지 수정" onclick="location.href='rentCarMain.jsp?center=noticeUpdate.jsp?num=<%=nVO.getNoticeNum() %>'" style="width: 20%; background: #f0ffff;">
						<input type="button" value="공지 삭제" onclick="location.href='rentCarMain.jsp?center=noticeDelete.jsp?num=<%=nVO.getNoticeNum() %>'" style="width: 20%; background: #f0ffff;">	
					<%		
					}
				%>
				
			</td>
		</tr>
	</table>
</body>
</html>