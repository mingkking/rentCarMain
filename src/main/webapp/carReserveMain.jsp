<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<%@ page import="kr.co.hyundai.vo.RentCarVO" %>
<%@ page import="java.util.Vector" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
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
	Vector<RentCarVO> vec = null;
	RentCarVO rvo = null;
	vec = rdao.getSelectCar();
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">최신 자동차</h2>
	<table align="center" width="1400" style="background: #f2f4f7;">
		<tr>
		<%
			if(vec != null){
				for(int i=0; i<vec.size(); i++){
					rvo = vec.get(i);
		%>
						<td align="center" width="200">
							<a href="rentCarMain.jsp?center=carReserveInfo.jsp?no=<%=rvo.getNo() %>">
								<img alt="<%=rvo.getCarName() %>" src="./images/<%=rvo.getImg() %>">  
							</a><br>
							<%=rvo.getCarName() %>
						</td>
		<%
				}
			}
		%>
		</tr>
	</table>
	<br><br>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">차량 검색하기</h2>
	<form action="rentCarMain.jsp?center=carCategoryList.jsp" method="post">
		<fieldset style="width: 200px; margin: 0 auto;">
			<select name="category" style="width: 50%;">
				<option value="1">소형 자동차</option>
				<option value="2">중형 자동차</option>
				<option value="3">대형 자동차</option>
			</select><br><br>
			<input type="submit" value="검색" style="width: 50%; background-color: #f0ffff;"><br><br>
			<input type="button" value="전체 검색" onclick="location.href='rentCarMain.jsp?center=carAllList.jsp'" style="width: 50%; background-color: #f0ffff;"/>
		</fieldset>
	</form>
</body>
</html>