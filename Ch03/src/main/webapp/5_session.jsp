<%@page import="sub1.UserVo"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_session</title>
		
		<!-- 
			날짜: 2023/07/26
			이름: 최동일
			내용: JSP Session 내장객체 실습하기
			
			session
			- session은 최소 요청부터 마지막 요청까지의 전체 시간 경과
			- 클라이언트에 대응되는 객체, 서버에 기록되는 클라이언트 고유번호
			- 서버(was)는 각 클라이언트에 대한 고유식별번호(SID)를 자동으로 발급
		 -->
	</head>
	<body>
		<h3>5.session 내장객체</h3>
		
		
		<h4>session ID 확인</h4>
		<%= session.getId() %>
		<!-- 
			해당브라우저의 session주소// 브라우저마다 다른 값을 가진다.->id로 식별한다. / 웹서버가 발급해준다.
			WAS가 session을 발급해주면서 session table에 기록을 한다.
			session table에는 id, 최초발급날짜, 리퀘스트 날짜, 유저 객체 등이 저장되어 있다.
			
		
		 -->
		
		<h4>session 값 설정</h4>
		
		<%
		
			UserVo user = new UserVo("a101","김유신","101-1234-1001",25);
			
			
			//session table에 userColumn 컬럼명으로 user객체 저장
			session.setAttribute("userCoulmn", user);
			//여기서 session은 세션컨트롤을 의미
			//2번 째 값이 유저 
		
			
			//session table에 저장된 usercolu,m값을 가져옴
			UserVo userVo = (UserVo) session.getAttribute("userColumn");		
		%>
		<p>
			아이디: <%= userVo.getUid()  %><br>
			이름: <%= userVo.getName()  %><br>
			휴대폰: <%= userVo.getHp()  %><br>
			나이: <%= userVo.getAge()  %><br>
		</p>
		
		
		
		
	</body>
</html>