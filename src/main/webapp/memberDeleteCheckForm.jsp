<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 입력</title>
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
	<h2 align="center" style="width: 550px; background: blue; color: white; ">아이디, 비밀번호 입력</h2>
	<form action="memberDeleteCheckFormPro.jsp" method="post" align="center">
		<table align="center" border="2px" width="550" style="border-collapse: collapse; border-color: silver;">
			<tr height="40px">
				<th width="150">아이디</th>
				<td width="250"><input id="inputCss" type="text" name="id" maxlength="20" placeholder="ID를 입력하세요." required autofocus></td>
			</tr>
			<tr height="40px">
				<th width="150">패스워드</th>
				<td width="250"><input id="inputCss" type="password" name="password1" maxlength="20" placeholder="패스워드는 영문자, 숫자, 특수문자 8~15자리로 입력해주세요." required></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="입력 완료" style="width: 50%; background: #f0ffff;"></td>	
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원 관리" onclick="location.href='rentCarMain.jsp?center=memberJoinForm.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
		</table>
	</form>
</body>
</html>