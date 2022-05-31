<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.hyundai.dao.RentCarDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
</head>
<body>
	<jsp:useBean id="crvo" class="kr.co.hyundai.vo.CarReserveVO">
		<jsp:setProperty name="crvo" property="*"/>
	</jsp:useBean>
<%
	if(crvo.getDday() == null){
%>
		<script type="text/javascript">
			alert("날짜를 선택해주세요");
			location.href = "rentCarMain.jsp?center=carReserveUpdate.jsp?id=<%=crvo.getId() %>&carRNo=<%=crvo.getCarRNo() %>&img=<%=crvo.getImg() %>";
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
			location.href = "rentCarMain.jsp?center=carReserveUpdate.jsp?id=<%=crvo.getId() %>&carRNo=<%=crvo.getCarRNo() %>&img=<%=crvo.getImg() %>";
		</script>
<%
		return;
	}
	rdao.carReserveUpdate(crvo.getId(), crvo.getCarRNo(), crvo);
%>
	<script type="text/javascript">
			location.href = "rentCarMain.jsp?center=carReserveView.jsp?id=<%=crvo.getId() %>";
	 </script>
</body>
</html>