<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>requestFile</title>
	</head>
	<body>
		
		<h3>requestFile</h3>
		
		<%
		
			response.setHeader("Content-Type","application/octet-stream" );
			//request의 header를 바꿈 -> 응답되는 결과를 클라이언트에게 알려줌
			//html이면 브라우저가 출력할거고, 파일이면 브라우저에 다운로드가 된다.
			//header를 통해 파일로 조작가능
			//page contentType을 application/octet-stream로 변환하여 다운로드가 됨.
		%>
		
	</body>
</html>