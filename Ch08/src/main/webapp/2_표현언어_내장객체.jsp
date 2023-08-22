<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>2_표현언어_내장객체</title>
		</head>
		<body>
			<h3>2.표현언어 내장객체</h3>
			<!-- 페이지를 불러올 때 공백이 있을 경우 %20을 넣음 -->
		<%
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
		%>
		
		<p>
			pageScope name :${name}<br>
			requestScope name :${requestScope.name}<br>
			sessionScope name :${sessionScope.name}<br>
			applicationScope name :${applicationScope.name}<br>
			<!-- 
				scope를 통해서 어떤 내장 객체가 사용되는지 알 수 있다.
			 -->
			
		
		</p>
		
		</body>
	</html>