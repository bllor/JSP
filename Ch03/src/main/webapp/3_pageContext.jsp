<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- 
		
			날짜: 2023/07/25
			이름: 최동일
			내용: pageContext 내장객체 실습하기
			
			pageContext
			- 요청에 대한 최종 대상인 JSP 파일 객체
			- JSP 파일 하나당 하나의 pageContext 객체가 생성
			- 주요기능은 페이지 흐름제어(include, forward)기능 제공
			
			forward
			- 서버 자원 내에서 페이지를 요청하는 기능
			- 최초 요청에 대한 주소 반영 * redirect는 최종 요청에 대한 주소 반영
		 -->
	</head>
	<body>
		<!--  
		
			request의 요청의 대상이 되는 객체가 pageContext객체 
			response로 내보내질 객체도 pageContext
			최초 요청된 주소가 반영됨.
			같은 서버자원만 요청이 가능 다른 서버자원은 요청이 불가능하다.
			
		-->
		<h3>3.pageContext 내장객체</h3>
		
		
		<h4>include</h4>
		<%
			pageContext.include("./inc/_header.html");
			pageContext.include("./inc/_footer.html");
			
		%>
		
		<h4>forward</h4>
		<a href ="./proc/forward1.jsp ">포워드 페이지 요청1</a>
		<a href ="./proc/forward2.jsp ">포워드 페이지 요청2</a>
		
		
		
		<h4>forward</h4>
		
	</body>
</html>