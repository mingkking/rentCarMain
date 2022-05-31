<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 화면</title>
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
	String id = request.getParameter("id");
%>
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원 삭제 화면</h2>
	<form action="rentCarMain.jsp?center=memberDeleteFormPro.jsp?id=<%=id %>" method="post" align="center">
		<table align="center" border="2px" width="550" style="border-collapse: collapse; border-color: silver;">
			<tr height="40px">
				<td colspan="2"><input type="submit" value="회원 삭제" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원 관리" onclick="location.href='memberJoinForm.jsp'" style="width: 50%; background: #f0ffff;"></td>	
			</tr>
		</table>
	</form>
</body>
</html>