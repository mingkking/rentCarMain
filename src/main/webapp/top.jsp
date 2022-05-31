<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대자동차 쇼핑몰(주)</title>
<style type="text/css">
	table{
		border: 1px;
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
%>
	<table width="1400" align="center" border="1" style="border-collapse: collapse;">
		<tr height="100">
			<td colspan="1" width="200" align="center" style="background-color: #F0F8FF;">
				<a href="rentCarMain.jsp">
					<img alt="현대자동차" src="./images/hyundaiLogo2.png" width="100%" height="100">
				</a>
			</td>
			<td  colspan="4" width="200" align="center" style="background-color: #F0F8FF;">
				<font size="15px" style="color: blue; font-weight: 900;">현대 자동차 쇼핑몰(주)</font>
			</td>
			<td  colspan="1" width="200" align="center" style="background-color: white;">
				<a href="rentCarMain.jsp?center=memberJoinForm.jsp">회원가입</a>
			</td>
		</tr>
		<tr height="100"> <!--    -->
			<td width="200" align="center"><a href="rentCarMain.jsp?center=carReserveMain.jsp?id=<%=id %>">예약하기</a></td>
			<td width="200" align="center"><a href="rentCarMain.jsp?center=carReserveView.jsp?id=<%=id %>">예약확인</a></td>
			<td width="200" align="center"><a href="rentCarMain.jsp?center=boardList.jsp">자유게시판</a></td>
			<td width="200" align="center"><a href="rentCarMain.jsp?center=noticeMain.jsp">공지사항</a></td>
			<td width="200" align="center"><a href="rentCarMain.jsp?center=eventMain.jsp">이벤트</a></td>
			<%
				if(id.equals("guest")) {
			%>
					<td width="200" align="center">
						<fieldset style="border: 1px; background: white;">
							<%=id %>님
						</fieldset> 
						<br><a href="rentCarMain.jsp?center=sessionLoginForm.jsp">로그인</a>
								
					</td>
			<%	
				}
				else {
			%>
					<td width="200" align="center">
						<fieldset style="border-color: white; background: white; height: 50px;">
							<%=id %>님<br>
							쿠폰코드: <jsp:include page="coupon.jsp?id=<%=id %>"></jsp:include>
						</fieldset> 
						<br><a href="sessionLogoutPro.jsp">로그아웃</a> 		
					</td> 
			<%		
				}
			%>
		</tr>
	</table>
</body>
</html>