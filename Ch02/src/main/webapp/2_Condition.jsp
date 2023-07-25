<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>조건문</title>
		<!-- 
			날짜: 2023/07/24
			이름: 최동일
			내용: JSP 스크립트릿 조건문 실습하기
		 -->
	
	</head>
	<body>
		<h3>2.Condition</h3>
		
		<h4>if</h4>
		<%
			int var1 =1;
			int var2 =2;
			int var3 =3;
			int var4 =4;
			
			if(var1>0){
				out.println("<p>var1은 0보다 크다.</p>");
			}
		
		%>


		<h4>if~ else</h4>
		
		<%
			int v1 =1 , v2=2;
		
			if(v1>v2){
				
		%>
		
			<p>v1이 v2보다 크다.</p>
		
		<%
			}else{
				
		%>	
			
				<p>v1이 v2보다 작다.</p>
		
		<%
			}
		%>
		
		<%
			if(v1>v2){
				out.println("<p>v1이 v2보다 크다.</p>");
			}else{
				out.println("<p>v1이 v2보다 작다.</p>");
			}
		%>
		

		<h4>if~ else if~ else</h4>
		
		<%	int n1 =1, n2=2, n3=3 ,n4 =4;%>
		
		<%if(n1>n2){ %>
		<p>n1이 n2보다 크다.</p>
		<%}else if(n2>n3){ %>
		<p>n2가 n3보다 크다.</p>
		<%}else if(n3>n4){ %>
		<p>n3가 n4보다 크다.</p>
		<%}else { %>
		<p>n4가 가장크다.</p>
		<%} %>
		
		
		
		
	
		
	</body>
</html>