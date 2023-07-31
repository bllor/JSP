<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<script >
	window.load=function(){
		
		const btn2 = document.getElementById('btn2');
		btn2.addEventListner('click',function(){
			
			fetch("/Ch06/data/json.jsp")
				.then((response)=>{
					return response.json
				})
			
		}).then((data)=>{
			
			const table = document.getElementByTagName('table')[0];
			
			for(let user of data){
				
				const tr = document.createElement('tr');
				const td1 = document.createElment('td');
				const td2 = document.createElment('td');
				const td3 = document.createElment('td');
				const td4 = document.createElment('td');
				
				td1.innerText = user.uid;
				td2.innerText = uesr.name;
				td3.innerText = user.age;
				td4,innerText = user.hp;
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
				
				table.appendChild(tr);
				
				}//for end
				
				
			}//Then end
		
	})//addEventListner end	
		
		
	};//widow.onload end
	
	
	</script>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<button id ="btn2">데이터 요청</button>
		<table border ="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				<th>핸드폰</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</body>
</html>