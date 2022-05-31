<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<%@ page import="kr.co.hyundai.vo.CarReserveVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<script>
	function doNotReload(){
	    if(    (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
	        || (event.keyCode == 116) )
	    {
	      event.keyCode = 0;
	      event.cancelBubble = true;
	      event.returnValue = false;
	 alert("새로고침 방지");
	    }
	}
	document.onkeydown = doNotReload;
</script>
</head>
<body>
	<jsp:useBean id="crvo" class="kr.co.hyundai.vo.CarReserveVO">
		<jsp:setProperty name="crvo" property="*"/>
	</jsp:useBean>
<%
	
	int price = Integer.parseInt(request.getParameter("price"));
	if(crvo.getDday() == null){
%>
		<script type="text/javascript">
			alert("날짜를 선택해주세요");
			location.href = "rentCarMain.jsp?center=carOptionSelect.jsp?no=<%=crvo.getNo() %>&img=<%=crvo.getImg() %>&cnt=<%=crvo.getCnt() %>&price=<%=price %>";
		</script>
<%
		return;
	}
	RentCarDAO rdao = new RentCarDAO();
	
	int result = rdao.dayCompareTo(crvo);
	if(result == -1){
%>
		<script type="text/javascript">
			alert("현재 날짜보다 작은 날짜는 선택하실 수 없습니다.");
			location.href = "rentCarMain.jsp?center=carOptionSelect.jsp?no=<%=crvo.getNo() %>&img=<%=crvo.getImg() %>&cnt=<%=crvo.getCnt() %>&price=<%=price %>";
		</script>
<%
		return;
	}
	
	String id = (String)session.getAttribute("id");
	crvo.setId(id);
	rdao.setReserveCar(crvo);
	crvo = rdao.oneReserveCar(crvo.getId());
	int totalCarMoney =  (((price / 31) * crvo.getDay() * crvo.getCnt())+ crvo.getInsurance() + crvo.getWifi() + crvo.getBabySeat() + crvo.getNavi());
%>
	<table align="center" width="800px" style="background: #f2f4f7; border-collapse: collapse; height: 800px;" border="1">
		<caption>
			<h2 align="center" style="width: 800px; background: blue; color: white; ">예약 완료</h2>
		</caption>
		<tr>
			<td rowspan="16" align="center" width="200">
					<img alt="" src="./images/<%=crvo.getImg() %>">  
			</td>
			<th align="center" width="200">대여기간 / 비용 / X 대수</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getDay() %> 일 / <%=(price / 31) * crvo.getDay() %> 원 / X <%=crvo.getCnt() %> = <%=(price / 31) * crvo.getDay() * crvo.getCnt() %> 원
				</td>
			</tr>
			<th align="center" width="200">대여날짜</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getDday() %>
				</td>
			</tr>
			<th align="center" width="200">보험 일수 / 비용</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getInsurance() / 10000 %> 일 / <%=crvo.getInsurance() %> 원 
				</td>
			</tr>
			<th align="center" width="200">와이파이 일수 / 비용</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getWifi() / 10000 %> 일 / <%=crvo.getWifi() %> 원 
				</td>
			</tr>
			<th align="center" width="200">베이비시트 일수 / 비용</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getBabySeat() / 10000 %> 일 / <%=crvo.getBabySeat() %> 원 
				</td>
			</tr>
			<th align="center" width="200">네비게이션 일수 / 비용</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getNavi() / 10000 %> 일 / <%=crvo.getNavi() %> 원 
				</td>
			</tr>
			<th align="center" width="200">옵션 총액</th>
			<tr>
				<td align="center" width="200">
					<%=crvo.getInsurance()+crvo.getWifi()+crvo.getBabySeat()+crvo.getNavi() %> 원 
				</td>
			</tr>
			<th align="center" width="200">총 금액(대여기간 렌트비용 + 옵션)</th>
			<tr>
				<td align="center" width="200">
					<%=totalCarMoney %> 원 
				</td>
			</tr>
		</tr>
	</table>
</body>
</html>