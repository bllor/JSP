<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	 request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name= request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("update `user2` set `name`=? , `hp`=?, `age`=? where `uid` =?");
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch( Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Ch06/user2/list.jsp");
	
%>