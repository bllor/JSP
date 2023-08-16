<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	UserDTO dto =new UserDTO();
	dto.setUid(uid);
	//int result = UserDAO.getInstance();

%>