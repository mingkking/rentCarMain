<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
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
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<h2 align="center" style="width: 600px; background: blue; color: white; ">글 수정 비밀번호 입력</h2>
	<form action="boardUpdateCheckPro.jsp?num=<%=num %>" method="post" align="center">
		<table align="center" border="1" width="600" style="border-collapse: collapse; border-color: skyblue;">
			<tr height="40px">
				<th width="200">게시글 비밀번호 입력</th>
				<td width="400"><input id="inputCss" type="password" name="password" required autofocus style="width: 98%;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="submit" value="수정 하기" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="reset" value="취소" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="뒤로 가기" onclick="location.href='rentCarMain.jsp?center=boardDetail.jsp?num=<%=num %>'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
		</table>
	</form>
</body>
</html>