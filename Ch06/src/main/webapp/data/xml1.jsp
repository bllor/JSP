<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//contentType은 모든처리가 끝난 후 사용자에게 보내지는 언어를 지정하는 것

	//XML 생성
	String xmlData = "<user>";
		   xmlData +="<uid>a101</uid>";
		   xmlData +="<name>홍길동</name>";
		   xmlData +="<hp>010-1234-1001</hp>";
		   xmlData +="<age>23</age>";
		   xmlData +="</user>";
	
	
	//XML 데이터 출력
	out.print(xmlData);
%>