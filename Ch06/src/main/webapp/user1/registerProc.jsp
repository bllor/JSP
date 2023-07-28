<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//전송 데이터 수신
	String uid 	=request.getParameter("uid");
	String name	=request.getParameter("name");
	String hp 	=request.getParameter("hp");
	String age	=request.getParameter("age");
	
	
	//데이터 베이스 처리
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user ="root";
	String pass ="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt =conn.prepareStatement("Insert into `user1` values (?,?,?,?)");
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		//전송데이터가 문자로 넘어오므로 age가 문자열로 넘어옴
		//숫자로 만들어줄 수 있지만 귀찮아서 놔둠
		//sql에 문자로 들어가나 숫자로 들어가나 똑같기 때문에 문자열로 넣음
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	
	response.sendRedirect("/Ch06/user1/list.jsp");
	

%>