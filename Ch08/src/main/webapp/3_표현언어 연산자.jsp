<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_표현언어 연산자</title>
	</head>
	<body>
		<h3>표현언어 연산자</h3>
		<%
			int num1 = 1;
			int num2 = 2;
		
			String str1 = null;
			String str2 = "";
			String str3 = "Hello";
			
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			request.setAttribute("str1", str1);
			request.setAttribute("str2", str2);
			request.setAttribute("str3", str3);
		%>
		
		num1+num2 = ${num1+num2}<br>
		num1-num2 = ${num1-num2}<br>
		num1*num2 = ${num1*num2}<br>
		num1/num2 = ${num1/num2}<br>
		num1%num2 = ${num1%num2}<br><br>
		
		num1 > num2 =${num1>num2 }<br>
		num1 < num2 =${num1<num2 }<br>
		num1 >=num2 =${num1>=num2 }<br>
		num1 <=num2 =${num1<=num2 }<br>
		num1 ==num2 =${num1==num2 }<br>
		num1 !=num2 =${num1!=num2 }<br><br>
		
		
		<!-- 비교연산키워드 -->
		num1 > num2 =${num1 gt num2 }<br>
		num1 < num2 =${num1 lt num2 }<br>
		num1 >=num2 =${num1 ge num2 }<br>
		num1 <=num2 =${num1 le num2 }<br>
		num1 ==num2 =${num1 eq num2 }<br>
		num1 !=num2 =${num1 ne num2 }<br><br>

		empty str1 = ${empty str1 }<br> <!-- null은 empty가 아니다. -->
		empty str2 = ${empty str2 }<br>
		empty str3 = ${empty str3 }<br>
		str2 eq "Hello" =${str2 eq "Hello" }<br>
		str3 eq "Hello" =${str3 eq "Hello" }<br>
		
		
	</body>
</html>