<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.User2VO" %>
<%
	request.setCharacterEncoding("UTF-8");

	String uid =request.getParameter("uid");
	
	
	User2VO vo = new User2VO();
	
	try{
		
		Context initCtx= new InitialContext();
		Context ctx= (Context)initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("select * from `user2` where uid=?");
		psmt.setString(1, uid);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getString(4));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>User2 수정</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user2/list.jsp">User2목록</a>
		
		<form action="/Ch06/user2/modifyProc.jsp" method ="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type ="text" name="uid" readonly="readonly" value="<%=vo.getUid()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type ="text" name="name" value="<%=vo.getName()%>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type ="text" name="hp"  value="<%=vo.getHp()%>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type ="text" name="age"  value="<%=vo.getAge()%>"></td>
				</tr>
				<tr>
					<td colspan ="2" align ="right"><input type ="submit" value ="수정"></td>
				</tr>
			</table>
		</form>
		
		
	</body>
</html>