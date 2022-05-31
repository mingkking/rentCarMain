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
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<h2 align="center" style="width: 600px; background: blue; color: white; ">글 수정 입력</h2>
	<form action="boardUpdatePro.jsp?num=<%=num %>" method="post" align="center">
		<table align="center" border="1" width="600" style="border-collapse: collapse; border-color: skyblue;">
			<tr height="40px">
				<th width="200">수정할 주제</th>
				<td width="400"><input id="inputCss" type="text" name="subject" required style="width: 98%;"></td>
			</tr>
			<tr height="40px">
				<th width="150">수정할 패스워드</th>
				<td width="250"><input id="inputCss" type="password" name="password" placeholder="영문자, 숫자를 입력해주세요." required style="width: 98%;"></td>
			</tr>
			<tr height="40px">
				<th width="150">수정할 글 내용</th>
				<td width="250"><textarea rows="10" cols="40" name="content" style="width: 98%;">주제에 따른 글 내용 기재</textarea></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="submit" value="작성 완료" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="reset" value="취소" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="게시판 목록" onclick="location.href='rentCarMain.jsp?center=boardList.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
		</table>
	</form>
</body>
</html>