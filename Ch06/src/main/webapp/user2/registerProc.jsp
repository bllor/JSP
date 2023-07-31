<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp= request.getParameter("hp");
	String age = request.getParameter("age");

	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		
// 		Class.forName("com.mysql.cj.jdbc.Driver");
// 		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//데이터베이스커넥션풀 사용
		//JNDI서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
				
		//커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
			 	
		
		PreparedStatement psmt = conn.prepareStatement("insert into `user2` values (?,?,?,?)");
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Ch06/user2/list.jsp");
%>