<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member Register</title>
	</head>
	<body>
		<h3>member 등록</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/member/list.jsp">member목록</a>
		
		<form action="/Ch06/member/registerProc.jsp" method ="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" ></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" ></td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
					<select name="pos">
						<option value="사원" selected="selected">사원
						<option value="대리">대리
						<option value="차장">차장
						<option value="부장">부장
					</select>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name ="dep">
							<option value="101" selected="selected">영업1부
							<option value="102">영업2부
							<option value="103">영업3부
							<option value="107">인사부
							<option value="106">경영지원부
						</select>
					</td>
				</tr>
				<tr>
				<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</body>
</html>