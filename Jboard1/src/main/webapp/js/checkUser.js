/**
 * 사용자 중복체크 함수
 */
$(function(){
		//아이디 중복체크
		$('#btnCheckUid').click(function(){
			const uid = $('input[name=uid]').val();
			
			
			if(!uid.match(reUid)){
				$('.resultId').css('color','red').text('유효한 아이디 형식이 아닙니다.');
				isUidOk = false;
				return;//유효하지 않은 아이디를 서버로 보내지 않고 종료
				//밑으로 내려가지 않음
				
				//스크립트에 선언된 변수끼리는 서로 공유할 수 있다.
			}
			
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
						isUidOk = false;
						
					}else{
						$('.resultId').css('color','green').text('사용 가능한 아이디 입니다.');
						isUidOk=true;
					}
					
				}
			});
				
		});//아이디 중복체크 끝
		
		//닉네임 중복 체크
		
		
		$('input[name=nick]').focusout(function(){
			
			const nick = $(this).val();
			//console.log ('nick: '+nick);
			
			if(!nick.match(reNick)){
				$('.resultNick').css('color','red').text('유효한 닉네임이 아닙니다.');
				isNickOk = false;
				return;
		}
			
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
				
				if(data.result >=1){
					$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
					isNickOk = false;
				}else{
					$('.resultNick').css('color','green').text('사용 가능한 닉네임 입니다.');
					isNickOk = true;
				}
				
			});
			
			
		});//닉네임 중복체크 끝
		
		/*
		//이메일 중복체크
		const email = document.getElementsByName('email')[0];
		email.onfocusout = function(){
			
			//입력데이터 가져오기
			const email = this.value;
			
			const resultEmail = document.getElementById('resultEmail');
			if(!email.match(reEmail)){
					resultEmail.innerText='유효한 이메일이 아닙니다.'
					resultEmail.style.color = 'red';
					isEmailOk= false;
					
				}
			
			
			const xhr = new XMLHttpRequest();
			xhr.open('GET','/Jboard1/user/checkEmail.jsp?email='+email);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						const data = JSON.parse(xhr.response);
						console.log('data : '+ data );
						
						if(data.result>=1){
							//$('#resultEmail').css('color','red').text('이미 사용 중인 이메일입니다.');
							resultEmail.innerText = '이미 사용 중인 이메일입니다.';
							resultEmail.style.color='red';
							isEmailOk= false;
							return;
						}else{
							//$('#resultemail').css('color','green').text('사용 가능한 이메일 입니다.');
							resultEmail.innerText = '사용가능한 이메일입니다.';
							resultEmail.style.color='green';
							isEmailOk= true;
						}
						
					}
				}
				
			}//onreadystatechange end
			
		}//email.onfocus end
		*/
		
		document.getElementsByName('email')[0].onfocusout = function(){
		
		const resultEmail = document.getElementById('resultEmail');
		
		// 입력 데이터 가져오기
		const email = this.value;
		
		if(!email.match(reEmail)){
			resultEmail.innerText = '유효한 이메일이 아닙니다.';
			resultEmail.style.color = 'red';
			isEmailOk = false;
			return;
		}

		// 데이터 전송
		const xhr = new XMLHttpRequest();
		xhr.open('GET', '/Farmstory1/user/checkEmail.jsp?email='+email);
		xhr.send();
		
		// 응답 결과
		xhr.onreadystatechange = function(){    				
			if(xhr.readyState == XMLHttpRequest.DONE){						
				if(xhr.status == 200){
					const data = JSON.parse(xhr.response);
					console.log('data : ' + data);
					
					if(data.result >= 1){
						resultEmail.innerText = '이미 사용중인 이메일 입니다.';
						resultEmail.style.color = 'red';
						isEmailOk = false;
					}else{
						resultEmail.innerText = '사용 가능한 이메일 입니다.';
						resultEmail.style.color = 'green';
						isEmailOk = true;
					}
				}
			}    				
		}// onreadystatechange end
	} // 이메일 중복체크 끝
		
		
		//휴대폰 중복체크
		document.getElementsByName('hp')[0].addEventListener('focusout',function(){
			
			const hp = this. value;
			
			const resultHp = document.getElementById('resultHp');
					
			if(!hp.match(reHp)){
						resultHp.innerText = '유효한 번호가 아닙니다.';
						resultHp.style.color='red';
						isHpOk= false;
						return;				
			}
			
			
			const url = '/Jboard1/user/checkHp.jsp?hp='+this.value;
			
			fetch(url)
				.then(response => response.json())
				.then(data =>{
					
					
					
					if(data.result>=1){
						
						resultHp.innerText = '이미 사용 중인 전화번호입니다.';
						resultHp.style.color='red';
						isHpOk= false;
						
					
					}else{
						resultHp.innerText = '사용 가능한 전화번호 입니다.';
						resultHp.style.color ='green';
						isHpOk= true;
					}
					
				});
			
		});
		
		
	});//사용자 개인정보 중복체크 끝
	