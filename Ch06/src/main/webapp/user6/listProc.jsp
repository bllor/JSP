<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	//request.setCharacterEncoding("UTF-8");
	
	//String uid = request.getParameter("uid");
	//String name= request.getParameter("name");
	//String hp = request.getParameter("hp");
	//String age = request.getParameter("age");
	//데이터를 가져오는 것이므로 getparameter로 받을 필요가 없다.
	
	List<User2VO> users = new ArrayList<>();
	
	
	
	String host ="jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		Context initctx = new InitialContext();
		Context ctx = (Context)initctx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user6`");
		
		while(rs.next()){
			User2VO vo = new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getString(4));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
//	데이터가 users에 들어가는데 users를 json으로 변경해줘야함.
	Gson gson= new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);

%>