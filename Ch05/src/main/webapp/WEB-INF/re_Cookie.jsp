<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cookie따라치기</title>
	</head>
	<body>
		<!-- page1 -->
		<form action="page2" method ="post">
			<input type ="text" name = "id" placeholder ="아이디 입력"><br>
			<input type ="password" name = "pw" placeholder ="비밀번호 입력"><br>
			<input type ="submit"  value ="로그인"><br>
		</form>
		
		<!--  page2 -->
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("name");
			String pw = request.getParameter("pw");
			
			//쿠키 생성
			Cookie c1 = new Cookie("cid",id);
							//Cookie("쿠키이름",쿠키값)
			Cookie c2 = new Cookie("cpw",pw);
							
			response.addCookie(c1);
			response.addCookie(c2);
			
		%>
		
		<a href ="page3"></a>
		
		<!--  page3 -->
		
		<h3>쿠키확인</h3>
		
		<%
			//request.getCookies에서 getCookies가 Cookie[]이므로 배열로 받는다.		
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies){
		%>		
			<p>
				쿠키이름: <%=cookie.getName() %>
				쿠키값: <%= cookie.getValue() %>			
			</p>
			
		
		<%		
			}
		
		%>
	
		
	</body>
</html>