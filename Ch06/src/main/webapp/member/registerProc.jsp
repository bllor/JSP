<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid= request.getParameter("uid");
	String name= request.getParameter("name");
	String hp= request.getParameter("hp");
	String pos= request.getParameter("pos");
	String dep= request.getParameter("dep");
	String date= request.getParameter("date");
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user ="root";
	String pass ="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt = conn.prepareStatement("insert into `member` values (?,?,?,?,?,?)");
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, pos);
		psmt.setString(5, dep);
		psmt.setString(6, date);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		
	}catch( Exception e){
		e.printStackTrace();
		
	}

	response.sendRedirect("/Ch06/member/list.jsp");
%>