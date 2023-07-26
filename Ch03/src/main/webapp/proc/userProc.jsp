<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 	
	1_request에서 작성된 3개의 항목(이름,나이,아이디)이 이쪽으로 날라옴 ->request객체에 실려서
	여기에서는 폼을 수신할 수 있는 객체가 있어야 함.
	1_request가 프론트, userProc가 백이라고 봄	
 -->
 
 <%
	//수신데이터 인코딩
	request.setCharacterEncoding("UTF-8");
 
 	String uid= request.getParameter("uid");
 	String name= request.getParameter("name");
 	String age= request.getParameter("age");
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title>
	</head>
	<body>
		<h3>사용자 데이터 수신</h3>
		<p>
			아이디 : <%=uid %><br>
			이름 	 : <%=name %><br>
			나이 : <%=age %><br>
		
		</p>
		
		<a href="../1_request.jsp">뒤로가기</a>
	</body>
</html>