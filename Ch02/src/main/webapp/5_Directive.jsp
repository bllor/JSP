<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info = "copyright bllor.click" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_Directive</title>
	<!-- 
		날짜: 2023/07/25
		이름: 최동일
		내용: JSP 지시자 실습하기
		
		지시자(Directive)
		- JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
		- 스트립트릿, 표현식과 함께 JSP 기본 구성요소
		- page, include, taglib 지시자 등 
	 -->

	</head>
	<body>
		
		
		<h3>5.지시자</h3>
		
		<h4>page 지시자</h4>
		<!--jsp문서 선언하는 역할    -->
		
		<p>
			page copyright : <%= getServletInfo() %>
			<!-- 위에 선언된 인포정보를 가져옴 -->
		</p>
		

		<h4>include 지시자</h4>
		<!-- inc폴더에 있는 파일을 삽입 -->
		<%@  include file="./inc/_header.html" %>
		<%@ include file="./inc/_footer.html" %>
		
	</body>
</html>