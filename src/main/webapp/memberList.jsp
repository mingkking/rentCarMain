<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.MemberDAO" %>
<%@ page import="kr.co.hyundai.vo.MemberVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록 보기</title>
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
	MemberDAO mDAO = new MemberDAO();
	ArrayList<MemberVO> arr = mDAO.selectMemberAll();
	
	int totalPage = 0;
	if(arr != null){	
		// totalPage
		totalPage = arr.size()%10==0 ? arr.size()/10 : (arr.size()/10)+1;
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
	if(arr != null){
		if(endBoard > arr.size()){
			endBoard = arr.size();
		}
	}
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원전체 목록보기</h2>
	<table border="1" style="width: 100%; text-align: center;">
		<tr height="50">
			<th width="150" align="center">번호</th>
			<th width="150" align="center">아이디</th>
			<th width="150" align="center">전자우편</th>
			<th width="150" align="center">전화번호</th>
			<th width="150" align="center">관심분야</th>
			<th width="150" align="center">직업</th>
			<th width="150" align="center">연령대</th>
			<th width="150" align="center">하고 싶은 말</th>
		</tr>
<%
		if(arr != null){
			for(int i=startBoard; i<endBoard; i++){
		
		
%>
		<tr height="50">
			<td width="150" align="center"><%=arr.get(i).getNum() %></td>
			<td width="150" align="center"><a href="rentCarMain.jsp?center=memberInfoDetail.jsp?id=<%=arr.get(i).getId() %>"><%=arr.get(i).getId() %></a></td>
			<td width="150" align="center"><%=arr.get(i).getEmail() %></td>
			<td width="150" align="center"><%=arr.get(i).getTel() %></td>
			<td width="150" align="center"><%=arr.get(i).getHobby() %></td>
			<td width="150" align="center"><%=arr.get(i).getJob() %></td>
			<td width="150" align="center"><%=arr.get(i).getAge() %></td>
			<td width="150" align="center"><%=arr.get(i).getInfo() %></td>
		</tr>
<% 
			}
		}
%>
		<tr>
			<td colspan="8" align="center"><input type="button" value="회원 관리" onclick="location.href='rentCarMain.jsp?center=memberJoinForm.jsp'" style="width: 25%; background: #f0ffff;"></td>	
		</tr>
	</table>
	<p align="center">페이지당 게시물 10개</p>
	<table align="center" border="2px" style="border-collapse: collapse; border-color: silver;">
		<tr>
					<td align="center" width="100"><input type="button" value="이전" onclick="location.href='rentCarMain.jsp?center=memberList.jsp?page=<%=cPage-10 %>'" style="width: 100px; background: #f0ffff;"></td>
			<%
				for(int i=startPage; i<=endPage; i++){
			%>
					<td align="center" width="100"><a href="rentCarMain.jsp?center=memberList.jsp?page=<%=i %>"><%=i %></a></td>
			<%
				}
			%>
					<td align="center" width="100"><input type="button" value="다음" onclick="location.href='rentCarMain.jsp?center=memberList.jsp?page=<%=cPage+10 %>'" style="width: 100px; background: #f0ffff;"></td>
		</tr>
	</table>
</body>
</html>