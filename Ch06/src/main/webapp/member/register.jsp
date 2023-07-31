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
					<td>직책</td>
					<td>
					<select name="pos">
						<option selected>직책
						<option value="부장">부장
						<option value="차장">차장
						<option value="대리">대리
						<option value="사원">사원
					</select>
					</td>
				</tr>
				<tr>
					<td>부서번호</td>
					<td><input type="text" name="dep" ></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><input type="datetime-local" name="date" ></td>
				</tr>
				<tr >
				<td colspan="2" align="right"><input type="submit" value="전송"></td>
				</tr>
			</table>
		</form>
	</body>
</html>