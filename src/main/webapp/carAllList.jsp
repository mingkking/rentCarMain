<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<%@ page import="kr.co.hyundai.vo.RentCarVO" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
<style type="text/css">
	td{
		background: white;
	}
</style>
</head>
<body>
<%
	Vector<RentCarVO> vec = null;
	RentCarVO rvo = null;
	RentCarDAO rdao = new RentCarDAO();
	vec = rdao.getAllCar();
	
	int totalPage = 0;
	if(vec != null){	
		// totalPage
		totalPage = vec.size()%5==0 ? vec.size()/5 : (vec.size()/5)+1;
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
	int startBoard = ((cPage-1)*5);
	int endBoard = startBoard + 5;
	if(vec != null){
		if(endBoard > vec.size()){
			endBoard = vec.size();
		}
	}
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">전체 자동차(대수: <%=vec.size() %>)</h2>
	<table align="center" width="1400" style="background: #f2f4f7; border-collapse: collapse;" border="1">
		<tr>
			<th>번호</th>
			<th>회사명</th>
			<th>이미지</th>
			<th>이름</th>
			<th>분류</th>
			<th>가격</th>
			<th>최대 인원 수</th>
		</tr>
		<%
			if(vec != null){
				for(int i=startBoard; i<endBoard; i++){
					rvo = vec.get(i);
		%>
					<tr>
						<td align="center" width="200">
							<%=i+1 %>
						</td>
						<td align="center" width="200">
							<%=rvo.getCompany() %>
						</td>
						<td align="center" width="200">
							<a href="rentCarMain.jsp?center=carReserveInfo.jsp?no=<%=rvo.getNo() %>">
								<img alt="<%=rvo.getCarName() %>" src="./images/<%=rvo.getImg() %>" width="200">  
							</a><br>
						</td>
						<td align="center" width="200">
							<%=rvo.getCarName() %>
						</td>
						<td align="center" width="200">
						<%
							String cate = "";
							if(rvo.getCategory() == 1){
								cate = "소형";								
							}
							else if(rvo.getCategory() == 2){
								cate = "중형";								
							}
							else if(rvo.getCategory() == 3){
								cate = "대형";								
							}
						%>
						<%=cate %>
						</td>
						<td align="center" width="200">
							<%=rvo.getPrice() %>원
						</td>
						<td align="center" width="200">
							<%=rvo.getUsePeople() %>
						</td>
					</tr>
		<%
				}
			}
		%>
	</table>
	<br><br>
	<table align="center" border="2px" style="border-collapse: collapse; border-color: silver;">
		<tr>
					<td align="center" width="100"><input type="button" value="이전" onclick="location.href='rentCarMain.jsp?page=<%=cPage-10 %>&center=carAllList.jsp'" style="width: 100px; background: #f0ffff;"></td>
			<%
				for(int i=startPage; i<=endPage; i++){
			%>
					<td align="center" width="100"><a href="rentCarMain.jsp?page=<%=i %>&center=carAllList.jsp"><%=i %></a></td>
			<%
				}
			%>
					<td align="center" width="100"><input type="button" value="다음" onclick="location.href='rentCarMain.jsp?page=<%=cPage+10 %>&center=carAllList.jsp'" style="width: 100px; background: #f0ffff;"></td>
		</tr>
	</table>
</body>
</html>