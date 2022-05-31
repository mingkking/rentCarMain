<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<%@ page import="kr.co.hyundai.vo.RentCarVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
<style type="text/css">
	td{
		background-color: white;
	}
</style>
</head>
<body>
<% 
	int no = Integer.parseInt(request.getParameter("no"));
	RentCarVO rvo = null;	
	RentCarDAO rdao = new RentCarDAO();
	rvo = rdao.getOneCar(no);
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
<div>
	<form action="rentCarMain.jsp?center=carOptionSelect.jsp" method="post">
		<table align="center" width="800px" style="background: #f2f4f7; border-collapse: collapse; height: 800px;" border="1">
			<caption>
				<h2 align="center" style="width: 800px; background: blue; color: white; "><%=rvo.getCarName() %> 차량</h2>
			</caption>
			<tr>
				<td rowspan="10" align="center" width="200">
						<img alt="<%=rvo.getCarName() %>" src="./images/<%=rvo.getImg() %>">  
				</td>
				<th align="center" width="200">차량명</th>
				<tr>
					<td align="center" width="200"><%=rvo.getCarName() %></td>
				</tr>
				<th align="center" width="200">자동차 수량</th>
				<tr>
					<td align="center" width="200">
						<select name="cnt">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>
				<th align="center" width="200">자동차 분류</th>
				<tr>
					<td align="center" width="200"><%=cate %></td>
				</tr>
				<th align="center" width="200">대여가격</th>
				<tr>
					<td align="center" width="200"><%=rvo.getPrice() %></td>
				</tr>
				<th align="center" width="200">제조회사</th>
				<tr>
					<td align="center" width="200"><%=rvo.getCompany() %></td>
				</tr>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="no" value="<%=rvo.getNo() %>">
					<input type="hidden" name="img" value="<%=rvo.getImg() %>">
					<input type="hidden" name="price" value="<%=rvo.getPrice() %>">
					<input type="submit" value="옵션선택" style="width: 200px; background: #f0ffff;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<font size="5" style="color: blue; font-weight: 900;">자동차 정보 보기</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<font size="3" style="font-weight: 900;"><%=rvo.getInfo() %></font>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>