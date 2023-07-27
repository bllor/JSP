<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//데이터 값만 받을 것이므로 스크립트립만 열었음

	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//전송 데이터 수신
	String id =request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	//전송데이터를 수신하여 DB에 select를 날려서 확인함.- 이건 내일
	
	//회원여부 확인
	if(pw.equals("1234")){
		//회원일 경우 -> 세션기록을 해야함
		
		//자동 로그인 처리(자동로그인 체크박스 체크했으면 auto==1이됨)
		if(auto!=null){
			Cookie autocookie = new Cookie("cid",id);
			autocookie.setMaxAge(60*3);
			response.addCookie(autocookie);
			
		}
		
		session.setAttribute("sessid", id );
		response.sendRedirect("./loginSuccess.jsp");
	
	}else{
		//회원이 아닐 경우
		response.sendRedirect("./loginForm.jsp");
		
	}

%>

