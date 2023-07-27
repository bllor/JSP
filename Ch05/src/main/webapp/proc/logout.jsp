<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// logout의 할일: 세션 클라이언트 명단에서 데이터를 지우는 일
	
	session.invalidate();
	response.sendRedirect("../2_Session.jsp");

%>

