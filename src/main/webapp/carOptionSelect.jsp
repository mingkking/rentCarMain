<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String img = request.getParameter("img");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int price = Integer.parseInt(request.getParameter("price"));
	/* 예약 정보 다루기
	- 대여일자: 과거의 날짜로 예약 불가능
	- 대여기간: 1일, 2일, 7일, 14일, .... 1달, 2달, 리스: 12개월
	- 보험적용: 1일 1만원, 비적용
	- 와이파이: 1일 2만원, 비적용
	- 베이비시트: 1일 3만원, 비적용
	- 네비게이션: 1일 5천원, 비적용 */
%>
<div>
	<form action="rentCarMain.jsp?center=carReserveResult.jsp" method="post">
		<table align="center" width="800px" style="background: #f2f4f7; border-collapse: collapse; height: 800px;" border="1">
			<caption>
				<h2 align="center" style="width: 800px; background: blue; color: white; ">옵션 선택</h2>
			</caption>
			<tr>
				<td rowspan="13" align="center" width="200">
						<img alt="" src="./images/<%=img %>">  
				</td>
				<th align="center" width="200">대여 기간</th>
				<tr>
					<td align="center" width="200">
						<select name="day">
							<option value="1">1일</option>
							<option value="7">7일</option>
							<option value="14">2주</option>
							<option value="31">1달</option>
							<option value="365">1년</option>
						</select>
					</td>
				</tr>
				<th align="center" width="200">대여일</th>
				<tr>
					<td align="center" width="200">
						<input type="datetime-local" name="dday" size="10">
					</td>
				</tr>
				<th align="center" width="200">보험 적용(1일 1만원)</th>
				<tr>
					<td align="center" width="200">
						<select name="insurance">
							<option value="10000">1일</option>
							<option value="70000">7일</option>
							<option value="140000">2주</option>
							<option value="310000">1달</option>
							<option value="3650000">1년</option>
							<option value="0">비적용</option>
						</select>
					</td>
				</tr>
				<th align="center" width="200">와이파이(1일 1만원)</th>
				<tr>
					<td align="center" width="200">
						<select name="wifi">
							<option value="10000">1일</option>
							<option value="70000">7일</option>
							<option value="140000">2주</option>
							<option value="310000">1달</option>
							<option value="3650000">1년</option>
							<option value="0">비적용</option>
						</select>
					</td>
				</tr>
				<th align="center" width="200">베이비시트(1일 1만원)</th>
				<tr>
					<td align="center" width="200">
						<select name="babySeat">
							<option value="10000">1일</option>
							<option value="70000">7일</option>
							<option value="140000">2주</option>
							<option value="310000">1달</option>
							<option value="3650000">1년</option>
							<option value="0">비적용</option>
						</select>
					</td>
				</tr>
				<th align="center" width="200">네비게이션(1일 1만원)</th>
				<tr>
					<td align="center" width="200">
						<select name="navi">
							<option value="10000">1일</option>
							<option value="70000">7일</option>
							<option value="140000">2주</option>
							<option value="310000">1달</option>
							<option value="3650000">1년</option>
							<option value="0">비적용</option>
						</select>
					</td>
				</tr>
				<td align="center" width="200">
					<input type="hidden" name="no" value="<%=no %>">
					<input type="hidden" name="img" value="<%=img %>">
					<input type="hidden" name="cnt" value="<%=cnt %>">
					<input type="hidden" name="price" value="<%=price %>">
					<input type="submit" value="선택완료" style="width: 200px; background: #f0ffff;">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>