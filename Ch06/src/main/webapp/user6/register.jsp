<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User3 등록</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   	<script >
	
   		$(function(){
   			
   			$('input[type=submit]').click(function(e){
   				//json데이터로 전솧하기 위함
   				e.preventDefault();
   				
   				//입력데이터 가져오기
   				const uid = $('input[name=uid]').val();
   				const name	= $('input[name=name]').val();
   				const hp	= $('input[name=hp]').val();
   				const age	= $('input[name=age]').val();
   				
   				
   				//JSON생성
   				
   				const jsonData ={
   					"uid": uid,
   					"name": name,
   					"hp": hp,
   					"age": age
   						
   				};
   				
   				console.log(jsonData);
   				
   				
   				$.ajax({
   					//post형식의 type으로 전송
   					//url: 서버에서 받을 요청 url
   					//dataType: json형식으로 전송
   					//data:jsonData라는 json객체를 전송
   					//success: 정상적으로 성공할 경우 success함수 호출
   					url:'./registerProc.jsp',
   					type:'post',
   					data:jsonData,
   					dataType:'json',
   					success:function(data){
   					//data는 result값
   					
   					console.log(data);
   					if(data.result	>=	1){
   						alert('데이터가 추가되었습니다.');
   						
   						$('form')[0].reset();//제출버튼이 눌러진 후 form의 내용을 초기화 하는 것.
   					}else{
   						alert('데이터 추가가 실패하였습니다. 아이디 또는 휴대폰 중복인것 같아요.');
   						
   					}
   						
   						
   					}
   				});
   				
   				
   				
   			});
   			
   			
   		});
	</script>
		
	</head>
	<body>
		<h3>User6등록</h3>
		<a href="/Ch06/user6/list.jsp">목록으로</a>
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name ="uid"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name ="name"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name ="hp"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name ="age"></td>
				</tr>
				<tr>
					<td colspan ="2" align = right><input type="submit" value="제출"></td>
				</tr>
			</table>
		</form>
	</body>
</html>