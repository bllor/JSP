<%@page import="kr.co.jboard1.vo.UserVO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//로그인을 했을 경우, 로그인 페이지로 가지 않고, 글목록 페이지로 갈 수 있게 처리를 해줌

	//현재 로그인 여부 확인
	UserVO sessUser = (UserVO)session.getAttribute("sessUser");

	if(sessUser==null){
		
		pageContext.forward("./user/login.jsp");
		//forward를 사용할 경우 서버경로를 사용하지 못하고 상대 경로만 사용할 수 있다.
		
	}else{
		pageContext.forward("./list.jsp");
		
	}



%>		