<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>redirect1</title>
	</head>
	<body>
		<h3>redirect1 페이지</h3>
		
		<%
			response.sendRedirect("../1_request.jsp");
			//response를 통해서 이 페이지로 들어왔을 때
			//response.sendredirect를
		%>
		
	</body>
</html>