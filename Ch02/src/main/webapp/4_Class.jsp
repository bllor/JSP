<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4_Class</title>
	</head>
	<body>
		
		<h3>4.클래스</h3>
		
		<%
			Account kb = new Account("국민은행","101-12-1001","김유신",10000);
			kb.deposit(100000);
			kb.withdraw(20000);
			kb.show(out);
			
			Account wr = new Account("우리은행","101-12-1111","김춘추",1000);
			wr.deposit(10000);
			wr.withdraw(2000);
			wr.show(out);
			
		%>
	</body>
</html>