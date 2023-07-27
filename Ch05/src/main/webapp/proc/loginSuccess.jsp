<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sessid =(String)session.getAttribute("sessid");
	//getAttribute return타입이 object인데, object는 아무거나 다운 캐스팅이 되므로, string으로 양변다 다운 캐스팅해준다.
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		
		<p>
			<%= sessid%>님 반갑습니다.<br>
			<a href="./logout.jsp">로그아웃</a>
		
		</p>
	</body>
</html>