<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//Java Json 데이터 생성
	String jsonData ="{\"uid\":\"a101\",\"name\":\"홍길동\", \"hp\":\"010-1234-1000\", \"age\":23}";//age는 숫자이므로 ""제거
	
	//json 출력
	out.print(jsonData);

%>