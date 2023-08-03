/**
 * 사용자 중복체크 함수
 */
$(function(){
		//아이디 중복체크
		$('#btnCheckUid').click(function(){
			const uid = $('input[name=uid]').val();
			const jsonData ={
					"uid":uid
			};
			
			$.ajax({
				url:'/Jboard1/user/checkUid.jsp',
				type:'GET',
				data:jsonData,
				dataType:'json',
				success:function(data){
					
					if(data.result>=1){
						$('.resultId').css('color','red').text('이미 사용중인 아이디 입니다.');
					}else{
						$('.resultId').css('color','green').text('사용 가능한 아이디 입니다.');
					}
					
				}
			});
				
		});//아이디 중복체크 끝
		
		//닉네임 중복 체크
		$('input[name=nick]').focusout(function(){
			
			const nick = $(this).val();
			//console.log ('nick: '+nick);
			
			const jsonData ={
					"nick": nick
			};
			
			/*
			ajax를 사용해도 되지만 get을 사용해도 된다.
			$.ajax({
				//url:'./checkNick.jsp?=nick'=nick;json을 생성하지 않고 이렇게 처리를 해도된다.
				url:'./checkNick.jsp',
				type: 'GET',
				data: 
			
			});*/
			
			
			//데이터 전송
			$.get('/Jboard1/user/checkNick.jsp', jsonData, function(data){
				//get방식으로 사용했으므로 주소 뒤에 nick=입력한 별명 으로 보내짐
				console.log(data);
				if(data.result >=1){
					$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
				}else{
					$('.resultNick').css('color','green').text('사용 가능한 닉네임 입니다.');
				}
				
			});
			
			
		});//닉네임 중복체크 끝
		
		//이메일 중복체크
		const email = document.getElementsByName('email')[0];
		email.onfocusout = function(){
			
			//입력데이터 가져오기
			const email = this.value;
			console.log("email:"+email);
			
			
			const xhr = new XMLHttpRequest();
			xhr.open('GET','/Jboard1/user/checkEmail.jsp?email='+email);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						const data = JSON.parse(xhr.response);
						console.log('data : '+ data );
						const resultEmail = document.getElementById('resultEmail');
						if(data.result>=1){
							//$('#resultEmail').css('color','red').text('이미 사용 중인 이메일입니다.');
							resultEmail.innerText = '이미 사용 중인 이메일입니다.';
							resultEmail.style.color='red';
						}else{
							//$('#resultemail').css('color','green').text('사용 가능한 이메일 입니다.');
							resultEmail.innerText = '사용가능한 이메일입니다.';
							resultEmail.style.color='green';
						}
						
					}
				}
				
			}//onreadystatechange end
			
		}//email.onfocus end
		
		document.getElementsByName('hp')[0].addEventListener('focusout',function(){
			
			const url = '/Jboard1/user/checkHp.jsp?hp='+this.value;
			
			fetch(url)
				.then(response => response.json())
				.then(data =>{
					
					console.log(data);
					const resultHp = document.getElementById('resultHp');
					
					if(data.result>=1){
						
						resultHp.innerText = '이미 사용 중인 전화번호입니다.';
						resultHp.style.color='red';
					
					}else{
						resultHp.innerText = '사용 가능한 전화번호 입니다.';
						resultHp.style.color ='green';
						
					}
					
				});
			
		});
		
		
	});//사용자 개인정보 중복체크 끝
	