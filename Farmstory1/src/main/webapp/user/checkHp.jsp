<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//데이터 수신
	request.setCharacterEncoding("UTF-8");
	String hp = request.getParameter("hp");
	
	// DB 조회
	int result = UserDAO.getInstance().selectCountUid(hp);
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);

%>