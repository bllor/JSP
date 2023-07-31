<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<MemberVO> users = new ArrayList<>();
	
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select `uid`,`name`,`hp`,`pos`,`dep` from member where dep in (101,102,103,106,107)");
		
		while(rs.next()){
			MemberVO vo = new MemberVO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setPos(rs.getString(4));
			vo.setDep(rs.getString(5));
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e ){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member목록</title>
	</head>
	<body>
		<h3>Member목록</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/member/register.jsp">Member등록</a>
		<table border ="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>관리</th>
		</tr>
		<%for (MemberVO vo: users) {%>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getHp() %></td>
				<td><%= vo.getPos() %></td>
				<td><%if( vo.getDep().equals("101")){ %>
					영업1부
					<%}else if(vo.getDep().equals("102")){ %>
					영업2부
					<%}else if(vo.getDep().equals("103")){ %>
					영업3부
					<%}else if(vo.getDep().equals("106")){ %>
					경영지원부
					<%}else if(vo.getDep().equals("107")){ %>
					인사부
					<%} %>
				</td>
				<td>
				<a href ="/Ch06/member/modify.jsp?uid=<%=vo.getUid()%>">수정</a>
				<a href ="/Ch06/member/delete.jsp?uid=<%=vo.getUid()%>">삭제</a>
				</td>
			</tr>
		<%} %>
		</table>
		
	</body>
</html>