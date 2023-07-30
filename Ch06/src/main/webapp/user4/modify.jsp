<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User4VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String seq= request.getParameter("seq");
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	User4VO vo = new User4VO();
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn= DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt = conn.prepareStatement("select*from `user4` where seq=?");
		psmt.setString(1, seq);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			
			vo.setSeq(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getString(4));
			vo.setAddr(rs.getString(5));
			
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
		<title>User4수정</title>
	</head>
	<body>
		<h3>User4 수정</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/user4/list.jsp">User4목록</a>
		<form action="/Ch06/user4/modifyProc.jsp">
			<table border="1">
				<tr>
					<td>이름</td>
					<td>
					<input type="hidden" name ="seq" value="<%=vo.getSeq()%>">				
					<input type ="text" name ="name"  value=<%=vo.getName()%>>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					
					<%if(vo.getGender().equals("1")){%>
						<input type ="radio" name ="gender" value="1" checked="checked">남자
						<input type ="radio" name ="gender" value="2" >여자
					<% }else{%>
						<input type ="radio" name ="gender" value="1" >남자
						<input type ="radio" name ="gender" value="2" checked="checked">여자
					<%} %>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type ="text" name ="age"value=<%=vo.getAge()%> ></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type ="text" name ="addr" value=<%=vo.getAddr()%>></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type ="submit" value="수정"></td>
			</table>
		</form>

	</body>
</html>