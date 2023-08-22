<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- uri에 사용되는 jstl/core를 c태그로 사용한다는 뜻  -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>JSTL</title>
	</head>
	<body>
		<h3>스트립트릿</h3>
		<%
			//변수선언
			String str = "hello";
			out.print("<p>str : "+str+"<p>");
			
			int num1 = 1;
			int num2 = 2;
			int num3 = 3;
			
			//조건문
			
			if(num1<num2){
				out.print("<p>num1은 num2보다 작다.</p>");
			}
			
			if(num1>num2){
				out.print("<p>num1은 num2보다 크다.</p>");
			}else if(num2>num3){
				out.print("<p>num2은 num3보다 크다.</p>");
			}else{
				out.print("<p>num3가 가장크다.</p>");
			}
			
			
			
			//반복문
			
			for(int i =1;i<=5;i++){
				out.print("<p>i: "+i+"</p>");
				
			}
			
			int sum =0;
			for(int i =1;i<=10;i++){
				sum+=i;
			}
			out.print("<p>1부터 10까지의 합:"+sum+"</p>");
			
			String[] persons = {"김유신","김춘추","장보고","이순신"};
			for(String person : persons){
				out.print("<p>person : "+person+"</p>");
			}
			
			//자주 쓰는 문자열 처리
			
			String hello = "Hello Korea";
			
			out.print("<p>문자열 길이 : "+hello.length()+"</p>");
			out.print("<p>문자열 자르기 : "+hello.substring(1,5)+"</p>");
			out.print("<p>문자열 교체 : "+hello.replace("korea", "busan")+"</p>");
			out.print("<p>문자열 인덱스 : "+hello.indexOf("e")+"</p>");
			
		%>
		
		<h4>JSTL</h4>
		<!-- 변수선언 -->
		<!-- 
			배우는 이유: jsp에서 스크립트릿문법을 이제는 사용을 하지 않기 때문에
			자바 요소가 사용이 되면 안되므로
		 -->
		<c:set var ="str" value= "hello"/>
		<p>str : ${str }</p>
		
		<c:set var="num1" value="1"/>
		<c:set var="num2" value="2"/>
		<c:set var="num3" value="3"/>

		<!-- 조건문 -->
		<c:if test="${num1 lt num2}">
			<p>num1이 num2보다 작다.</p>
		</c:if>
	
		<c:choose>
			<c:when test="${num1 gt num2 }">
				<p> num1이 num2보다 크다.</p>
			</c:when>
			<c:otherwise>
				<p>num1이 num2보다 작다.</p>
			</c:otherwise>
		</c:choose>
		
		<!-- 반복문 -->
		<c:forEach var="i" begin ="1" end ="5">
			<p>i: ${i }</p>
		</c:forEach>
		
		<c:set var= "sum" value="0"/>
		<c:forEach var="k" begin ="1" end ="10">
			<c:set var= "sum" value="${sum+k }"/>
		</c:forEach>
			<p>1부터 10까지의 합 : ${sum }</p>
		
		<c:set var ="persons">김유신,김춘추,장보고,강감찬,이순신</c:set>
		<c:forEach var="person" items="${persons}">
			<p>person :  ${person }</p>
		</c:forEach>
		
		<!-- 자주 쓰는 문자열 처리 -->
		
		<c:set var ="hello" value ="Hello JSTL"/>
		<p> 문자열 길이 : ${f:length(hello) }</p>
		<p> 문자열 자르기 : ${f:substring(hello,6,11) }</p>
		<p> 문자열 교체 : ${f:replace(hello,"JSTL","BUSAN") }</p>
		<p> 문자열 인덱스 : ${f:indexOf(hello,"e") }</p>
		
	</body>
</html>