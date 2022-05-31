<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<%@ page import="kr.co.hyundai.vo.CarViewVO" %>
<%@ page import="java.util.Vector" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	String id = request.getParameter("id");
	if(id.equals("guest")){
%>		
		<script>
			alert("로그인 먼저 해주세요");
			location.href = "rentCarMain.jsp"
		</script>
<%	
		return;
	}
	
	RentCarDAO rdao = new RentCarDAO();
	Vector<CarViewVO> vec = rdao.getAllReserve(id);
	CarViewVO cvvo = null;
	
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

	<h2 align="center" style="width: 550px; background: blue; color: white; ">차량 예약(개수: 
<% 
		if(vec != null){
%>
			<%=vec.size() %>)
<%
		}
%>
		
	</h2>
	<table align="center" width="1400" style="background: #f2f4f7; border-collapse: collapse;" border="1">
		<tr>
			<th>이미지</th>
			<th>이름</th>
			<th>대여일</th>
			<th>대여기간</th>
			<th>금액</th>
			<th>수량</th>
			<th>보험</th>
			<th>와이파이</th>
			<th>베이비시트</th>
			<th>네비게이션</th>
			<th>예약취소</th>
		</tr>
		<%
			if(vec != null){
				for(int i=startBoard; i<endBoard; i++){
					cvvo = vec.get(i);
		%>
					<tr>
						<td align="center" width="200">
							<img alt="<%=cvvo.getCarName() %>" src="./images/<%=cvvo.getImg() %>" width="200">  
						</td>
						<td align="center" width="200">
							<%=cvvo.getCarName() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getDday() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getDay() %>
						</td>
						<td align="center" width="200">
							<%=(((cvvo.getPrice() / 31) * cvvo.getDay())+ cvvo.getInsurance() + cvvo.getWifi() + cvvo.getBabySeat() + cvvo.getNavi()) * cvvo.getCnt() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getCnt() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getInsurance() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getWifi() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getBabySeat() %>
						</td>
						<td align="center" width="200">
							<%=cvvo.getNavi() %>
						</td>
						<td align="center" width="200">
							<input type="button" value="예약 수정" onclick="location.href='rentCarMain.jsp?center=carReserveUpdate.jsp?id=<%=id %>&carRNo=<%=cvvo.getCarRNo() %>&img=<%=cvvo.getImg() %>'">
							<input type="button" value="예약 취소" onclick="location.href='carReserveCancel.jsp?id=<%=id %>&carRNo=<%=cvvo.getCarRNo() %>'">
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
					<td align="center" width="100"><input type="button" value="이전" onclick="location.href='rentCarMain.jsp?page=<%=cPage-10 %>&center=carReserveView.jsp&id=<%=id %>'" style="width: 100px; background: #f0ffff;"></td>
			<%
				for(int i=startPage; i<=endPage; i++){
			%>
					<td align="center" width="100"><a href="rentCarMain.jsp?page=<%=i %>&center=carReserveView.jsp&id=<%=id %>"><%=i %></a></td>
			<%
				}
			%>
					<td align="center" width="100"><input type="button" value="다음" onclick="location.href='rentCarMain.jsp?page=<%=cPage+10 %>&center=carReserveView.jsp&id=<%=id %>'" style="width: 100px; background: #f0ffff;"></td>
		</tr>
	</table>
</body>
</html>