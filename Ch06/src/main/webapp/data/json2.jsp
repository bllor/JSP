<%@page import="com.google.gson.Gson"%>
<%@page import="vo.User2VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2VO> users = new ArrayList<>();	


	try{
		
		Context initctx = new InitialContext();
		Context ctx =(Context) initctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		Statement stmt =conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from `user2`");
		
		while(rs.next()){
			User2VO user = new User2VO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getString(4));
			
			users.add(user);
		}
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e ){
		e.printStackTrace();
	}
	
	//json출력 - gson 라이브러리를 이용한 출력
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);
	

%>