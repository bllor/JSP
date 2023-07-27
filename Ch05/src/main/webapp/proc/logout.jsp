<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// logout의 할일: 세션 클라이언트 명단에서 데이터를 지우는 일
	
	//세션해제
	session.invalidate();
	
	//쿠키해제
	Cookie cookie = new Cookie("cid",null);
	cookie.setMaxAge(0);//유통기한이 0이므로 들어오면 지운다.
	response.addCookie(cookie);
	
	//리다이렉트
	response.sendRedirect("./loginForm.jsp");

%>

