<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.MemberVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	MemberVO vo = new MemberVO();
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("select uid, name, hp, pos, dep from `member` where uid= ?");
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setPos(rs.getString(4));
			vo.setDep(rs.getString(5));
			
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member수정</title>
	</head>
	<body>
		<h3>Member 수정</h3>
		<a href ="/Ch06/1_JDBC실습.jsp">처음으로</a>
		<a href ="/Ch06/member/list.jsp">목록으로</a>
			<form action ="/Ch06/member/modifyProc.jsp">
				<table border="1">
					<tr>
						<td>아이디</td>
						<td><input type = "text" name ="uid" readonly="readonly" value ="<%=vo.getUid()%>"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type = "text" name ="name" value ="<%=vo.getName()%>"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type = "text" name ="hp" value ="<%=vo.getHp()%>"></td>
					</tr>
					<tr>
						<td>직책</td>
						<td>
							<select name ="pos">
								<option value ="사원" selected="selected">사원
								<option value ="대리" >대리
								<option value ="차장" >차장
								<option value ="부장" >부장
							</select>
						</td>
					</tr>
					<tr>
						<td>부서</td>
						<td>
							<select name ="dep">
								<option value ="101" selected="selected">영업1부
								<option value ="102">영업2부
								<option value ="103">영업3부
								<option value ="107">인사부
								<option value ="106">경영지원부
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type = "submit" value ="전송"></td>
					</tr>
				</table>	
			</form>
		
	</body>
</html>