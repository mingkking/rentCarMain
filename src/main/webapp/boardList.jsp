<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.BoardDAO" %>
<%@ page import="kr.co.hyundai.vo.BoardVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board List</title>
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
	
	if(id.equals("guest")){
%>		
		<script>
			alert("로그인 먼저 해주세요");
			location.href = "rentCarMain.jsp"
		</script>
<%	
		return;
	}

	request.setCharacterEncoding("UTF-8");
	BoardDAO bDAO = new BoardDAO();
	Vector<BoardVO> vec = bDAO.selectAllBoard();
	
	int totalPage = 0;
	if(vec != null){	
		// totalPage
		totalPage = vec.size()%10==0 ? vec.size()/10 : (vec.size()/10)+1;
	}
	// currentPage
	int cPage;
	String tPage = request.getParameter("page");
	if(tPage == null || tPage.length() == 0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	// previous btn interlock - page = cPage-10
	if(cPage < 1){
		cPage = 1;
	}
	// next btn interlock - page = cPage+10
	if(cPage > totalPage && totalPage != 0){
		cPage = totalPage;
	}
	// page 100page 를 1~10까지
	int pageIndex = cPage%10==0 ? cPage/10 : (cPage/10)+1;  
	int startPage = 1 + ((pageIndex-1) * 10);
	int endPage = startPage + 9;
	if(endPage > totalPage){
		endPage = totalPage;
	}
	// 게시물 1000개 / 100page
	int startBoard = ((cPage-1)*10);
	int endBoard = startBoard + 10;
	if(vec != null){
		if(endBoard > vec.size()){
			endBoard = vec.size();
		}
	}
		
%>
	<h2 align="center" style="width: 1200px; background: blue; color: white; ">게시판 목록보기</h2>
<%
	if(vec != null){
%>
		<p>총 게시물: <%=vec.size() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 페이지: <%=cPage %>/<%=totalPage %></p>
<%
	}
%>
	
	<table align="center" border="2px" width="1200" style="border-collapse: collapse; border-color: silver;">
		<tr height="50">
			<th width="150" align="center">번호</th>
			<th width="150" align="center">제목</th>
			<th width="150" align="center">글쓴이</th>
			<th width="150" align="center">전자우편</th>
			<th width="150" align="center">작성일</th>
			<th width="150" align="center">조회수</th>
			<th width="150" align="center">글 내용</th>
		</tr>
		<%
			if(vec != null){
				for(int i=startBoard; i<endBoard; i++){
					BoardVO bVO = vec.get(i);
		%>
						<tr height="50">
							<td width="150" align="center"><%=bVO.getNum() %></td>
							<td width="150" align="left">
								<%
									for(int j=1; j<bVO.getRe_step(); j++){
								%>
										&nbsp;&nbsp;
								<%
									}
									if(bVO.getRe_step()>1){
								%>
										re:
								<%
									}
								%>
								<a href="rentCarMain.jsp?center=boardDetail.jsp?num=<%=bVO.getNum() %>"><%=bVO.getSubject() %></a>
							</td>
							<td width="150" align="center"><%=bVO.getWriter() %></td>
							<td width="150" align="center"><%=bVO.getEmail() %></td>
							<td width="150" align="center"><%=bVO.getReg_date() %></td>
							<td width="150" align="center"><%=bVO.getReadCount() %></td>
							<td width="150" align="center"><%=bVO.getContent() %></td>
						</tr>
		<% 		
				}
			}
		%>
		<tr height="40px">
			<td align="center" width="300" colspan="7">
				<input type="button" value="메인화면" onclick="location.href='rentCarMain.jsp'" style="width: 20%; background: #f0ffff;">
				<input type="button" value="글 쓰기" onclick="location.href='rentCarMain.jsp?center=boardWrite.jsp'" style="width: 20%; background: #f0ffff;">
			</td>
		</tr>
	</table>
	<p align="center">페이지당 게시물 10개</p>
	<table align="center" border="2px" style="border-collapse: collapse; border-color: silver;">
		<tr>
					<td align="center" width="100"><input type="button" value="이전" onclick="location.href='rentCarMain.jsp?center=boardList.jsp?page=<%=cPage-10 %>'" style="width: 100px; background: #f0ffff;"></td>
			<%
				for(int i=startPage; i<=endPage; i++){
			%>
					<td align="center" width="100"><a href="rentCarMain.jsp?center=boardList.jsp?page=<%=i %>"><%=i %></a></td>
			<%
				}
			%>
					<td align="center" width="100"><input type="button" value="다음" onclick="location.href='rentCarMain.jsp?center=boardList.jsp?page=<%=cPage+10 %>'" style="width: 100px; background: #f0ffff;"></td>
		</tr>
	</table>
</body>
</html>