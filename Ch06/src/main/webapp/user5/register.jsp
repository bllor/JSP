<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User5 register</title>
	</head>
	<body>
		<h3>user5 등록</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user5/list.jsp">User5목록</a>
		<form action="/Ch06/user5/registerProc.jsp" method ="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name ="uid" ></td> 
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name ="name" ></td> 
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="date" name ="birth" ></td> 
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<input type="radio" name ="gender" value="1" >남 
					<input type="radio" name ="gender" value="2">여
					</td> 
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name ="age" ></td> 
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name ="addr" ></td> 
				</tr>
				<tr>
					<td colspan ="2" align ="right"><input type="submit" value="제출"></td>
				</tr>
			</table>
		</form>
	</body>
</html>