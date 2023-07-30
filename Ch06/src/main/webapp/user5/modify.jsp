<%@page import="vo.User5VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user ="root";
	String pass ="1234";

	User5VO vo = new User5VO();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("select * from user5 where uid=?");
		psmt.setString(1, uid);
		ResultSet rs= psmt.executeQuery();
		
		while(rs.next()){
			vo.setUid(rs.getString(1));	
			vo.setName(rs.getString(2));	
			vo.setBirth(rs.getString(3));	
			vo.setGender(rs.getString(4));	
			vo.setAge(rs.getString(5));	
			vo.setAddr(rs.getString(6));	
		}
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User5 수정</title>
		
	</head>
	<body>
		<h3>User5 수정</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user5/list.jsp">목록으로</a>
		
		<form action="/Ch06/user5/modifyProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name = "uid" readonly="readonly" value="<%=vo.getUid()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=vo.getName()%>"></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" name="birth" value="<%=vo.getBirth()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<%if (vo.getGender().equals("1")){ %>
					<input type="radio" name="gender" value="1" checked="checked">남
					<input type="radio" name="gender" value="2" >여
					<%}else {%>
					<input type="radio" name="gender" value="1" >남
					<input type="radio" name="gender" value="2" checked="checked">여											
					<%} %>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%=vo.getAge()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%=vo.getAddr()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value ="전송"></td>
				</tr>
			</table>
		</form>
		
		
	</body>
</html>