<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	
	
	try{
		
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		
		PreparedStatement psmt = conn.prepareStatement("delete from `user2` where `uid` =?");
		psmt.setString(1, uid);
		psmt.executeUpdate();
		psmt.close();
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
	
	response.sendRedirect("/Ch06/user2/list.jsp");


%>