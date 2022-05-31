<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
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
	<h2 align="center" style="width: 550px; background: blue; color: white; ">회원 가입</h2>
	<form action="rentCarMain.jsp?center=memberJoinFormPro.jsp" method="post" align="center">
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
				<th width="150">패스워드 확인</th>
				<td width="250"><input id="inputCss" type="password" name="password2" maxlength="20" placeholder="위의 패스워드와 동일하게 입력해 주세요." required></td>
			</tr>
			<tr height="40px">
				<th width="150">전자우편</th>
				<td width="250"><input id="inputCss" type="email" name="email" maxlength="30" placeholder="aaa@aaa.com 양식으로 입력해 주세요." required></td>
			</tr>
			<tr height="40px">
				<th width="150">전화번호</th>
				<td width="250"><input id="inputCss" type="tel" name="tel" maxlength="20" placeholder="010-1111-2222양식으로 입력해 주세요." required></td>
			</tr>
			<tr height="40px">
				<th width="150">관심분야</th>
				<td width="250">
					<input type="checkbox" name="hobby" value="등산">등산
					<input type="checkbox" name="hobby" value="영화">영화
					<input type="checkbox" name="hobby" value="게임">게임
					<input type="checkbox" name="hobby" value="드라마">드라마
					<input type="checkbox" name="hobby" value="바다">바다
				</td>
			</tr>
			<tr height="40px">
				<th width="150">직업</th>
				<td width="250">
					<select name="job" maxlength="20">
						<option value="교수">교수</option>
						<option value="교사">교사</option>
						<option value="공무원">공무원</option>
						<option value="회사원" selected="selected">회사원</option>
						<option value="전문직">전문직</option>
						<option value="여행가이드">여행가이드</option>
					</select>
				</td>
			</tr>
			<tr height="40px">
				<th width="150">연령대</th>
				<td width="250">
					<input type="radio" name="age" value="10">10대
					<input type="radio" name="age" value="20" checked="checked">20대
					<input type="radio" name="age" value="30">30대
					<input type="radio" name="age" value="40">40대
					<input type="radio" name="age" value="50">50대
					<input type="radio" name="age" value="60">60대
				</td>
			</tr>
			<tr height="40px">
				<th width="150">하고 싶은 말</th>
				<td width="250">
					<textarea rows="7" cols="50" name="info" maxlength="120"></textarea>
				</td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="submit" value="회원가입" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><input type="reset" value="취소" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원 전체 목록 보기" onclick="location.href='rentCarMain.jsp?center=memberList.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원정보 수정" onclick="location.href='rentCarMain.jsp?center=memberUpdateCheckForm.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원정보 삭제" onclick="location.href='rentCarMain.jsp?center=memberDeleteCheckForm.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="메인 화면" onclick="location.href='rentCarMain.jsp'" style="width: 50%; background: #f0ffff;"></td>
			</tr>
		</table>
	</form>
</body>
</html>