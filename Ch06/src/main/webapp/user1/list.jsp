<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User1VO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host ="jdbc:mysql://13.209.15.113:3306/userdb";
	String user ="userdb";
	String pass ="1234qweR!";

	List<User1VO> users = new ArrayList<>();
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		Statement stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select *from `user1`");
		
		while(rs.next()){
			User1VO vo = new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getString(4));
			
			users.add(vo);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>User1 목록</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user1/register.jsp">User1등록</a>	
		
		
		<table border ="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<%for(User1VO vo : users) {%>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getHp() %></td>
				<td><%= vo.getAge() %></td>
				<td>
					<a href ="/Ch06/user1/modify.jsp?uid=<%= vo.getUid()%>">수정</a>
					<a href ="/Ch06/user1/delete.jsp?uid=<%= vo.getUid()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		
	</body>
</html>	