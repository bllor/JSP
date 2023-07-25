<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_request</title>
	
	<!-- 
		날짜: 2023/07/25
		이름: 최동일
		내용: JSP request 내장객체 실습하기
		
		request내장객체
		- 클라이언트 요청 정보를 갖는 객체
		- 클라이언트 전송 데이터를 수신하는 기능 제공(getParameter)
		
		Get방식
		- 기본 데이터 전송 방식 
		- 전송 데이터가 주소에 노출
		
		Post방식
		- 전송 데이터가 요청 객체(request) body에 삽입되어 전송되는 방식
		- 전송 데이터가 노출 안됨
		 
	 -->
	</head>
	
	<body>
		<h3>1.request 내장객체</h3>
	
		<h4>사용자 입력</h4>
		<!-- 	리퀘스트를 내보낼 때 action을 사용
				전송하기 버튼을 누르면 action의 경로로 form이 제출됨				
		 -->
		<form action="./proc/userProc.jsp" method="get">
			<input type ="text" name ="uid" placeholder ="아이디입력"/><br>
			<input type ="text" name ="name" placeholder ="이름 입력"/><br>
			<input type ="text" name ="age" placeholder ="나이 입력"/><br>
			<input type ="submit" value ="전송하기"/>
		
		</form>
		
		<h4>회원가입</h4>
		
		<!-- 
			취미에서 모두 다 선택될 수 있으므로 보낼 데이터는 최대 11개
			데이터는 get으로 보내면 정보가 노출되므로 post로 하는 것이 좋다.
			웹페이지에서 검사에 들어가서 network -> payload를보면 정보가 간 것을 볼 수 있다.
			form으로 보내면 한글 데이터가 깨지므로 윗부분에 인코딩을 해준다.
			register부분에 request.setCharacterEncoding("UTF-8");인코딩
			취미는 여러개 보내면 HOBBY가 계속 나와서 getparameterValues로 전송
			getparameterValues는 배열로 만들고, for로 돌려서 출력
			
		 -->
		<form action="./proc/registerProc.jsp" method="post">
		
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" placeholder= "아이디입력" ></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass" placeholder= "비밀번호입력" ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder= "이름입력" ></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth" placeholder= "생년월일 선택" ></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<label><input type="radio" name="gender" value="1"/>남</label>
					<label><input type="radio" name="gender" value="2"/>여</label>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
						<label><input type="checkbox" name="hobby" value="독서"/>독서하기</label>
						<label><input type="checkbox" name="hobby" value="영화"/>영화보기</label>
						<label><input type="checkbox" name="hobby" value="운동"/>운동하기</label>
						<label><input type="checkbox" name="hobby" value="게임"/>게임하기</label>
						
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입"/>
					</td>
				</tr>				
				
				
				
			</table>
		
		</form>
	
		<h4>클라이언트 정보 </h4>
		<p>
			헤더정보:<%= request.getHeader("User-Agent") %><br>
			프로토콜:<%= request.getProtocol()%><br>
			서버이름:<%= request.getServerName()%><br>
			요청주소:<%= request.getRequestURL()%><br>
			요청경로:<%= request.getRequestURI()%><br>
			IP주소:<%= request.getRemoteAddr()%><br>
			
		</p>
	
	
	
	</body>
</html>