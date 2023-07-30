<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.User4VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	
	List<User4VO> users = new ArrayList<>();
	
	
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user4`");
		
		while(rs.next()){
			User4VO vo = new User4VO();
			
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getString(4));
			vo.setAddr(rs.getString(5));
			vo.setSeq(rs.getString(1));
			
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
		<title>User4::list</title>
	</head>
	<body>
		<h3>user4목록</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user4/register.jsp">User4등록</a>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<% for(User4VO vo: users) {%>
			<tr>
				<td><%= vo.getSeq() %></td>
				<td><%= vo.getName() %></td>
				<td><% if(vo.getGender().equals("1")){%>
					남자
					<%}else{ %>
					여자
				<%} %>
				</td>
				<td><%= vo.getAge()%></td>
				<td><%= vo.getAddr()%></td>
				<td>
					<a href= "/Ch06/user4/modify.jsp?seq=<%=vo.getSeq() %>">수정</a>
					<a href= "/Ch06/user4/delete.jsp?seq=<%=vo.getSeq() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		
	</body>
</html>