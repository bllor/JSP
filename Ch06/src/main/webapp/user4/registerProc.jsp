<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");

// 	if(gender.equals("1")){
// 		gender="남";
// 	}else{
// 		gender="여";
// 	}
	
	String host="jdbc:mysql://127.0.0.1:3306/userdb";
	String user="root";
	String pass="1234";
	
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt = conn.prepareStatement("insert into `user4` set name=?, gender=?, age=?, addr=?");
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	response.sendRedirect("/Ch06/user4/list.jsp");
	
%>