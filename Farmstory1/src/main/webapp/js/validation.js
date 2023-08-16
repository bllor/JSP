/**
 * 유효성 검사
 */
//폼 데이터 검증 결과 상태변수
		let isUidOk		= false;
		let isPassOk 	= false;
		let isNameOk 	= false;
		let isNickOk	= false;
		let isEmailOk 	= false;
		let isHpOk 		= false;
	
		let reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;//영어소문자로 시작하며 소문자와 숫자를 섞어서 사용하고 최소 5글자에서 19글자.
		let rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
		let reName  = /^[가-힣]{2,10}$/ 
		let reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
		let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		let reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
		
		
		//유효성 검증(vaildation)	
		$(function(){
			
			//아이디검사 <-js에서 처리
			$('input[name=uid]').keydown(function(){
				$('.resultId').text('');
				isUidOk = false;
			});
			
			//비밀번호검사			
			
			$('input[name=pass2]').focusout(function(){
				
				const pass1 = $('input[name=pass1]').val();
				const pass2 = $('input[name=pass2]').val();
				
				if(pass1 == pass2){
					isPassOk = true;
				}
					/*if(pass1.match(rePass)){
						$('.resultPass').css('color','green').text('사용할 수 있는 비밀번호입니다.');
						isPassOk = true;
					}else{
						$('.resultPass').css('color','red').text('비밀번호는 숫자, 영문, 특수문자 조합 5자리 이상이여야 합니다.');
						isPassOk = false;
					}
				}else{
					$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
					isPassOk = false;
				}
				*/
				
			});
			
			//이름검사			
			$('input[name=name]').focusout(function(){
				
				const name = $(this).val();
				
				if(name.match(reName)){
					$('.resultName').text('');
					isNameOk= true;
				}else{
					$('.resultName').css('color','red').text('유효하지 않은 이름입니다.');
					isNameOk= false;
				}
				
			});
			
			
			
			//별명검사-js에서 처리			
			
			//이메일검사			
			
			
			
			//휴대폰검사			
			/*$('input[name=hp]').focusout(function(){
				
				const email = $(this).val();
				
				if(hp.match(reHp)){
					$('.resultHp').css('color','green').text('');
					isHpOk= true;
				}else{
					$('.resultHp').css('color','red').text('유효하지 않은 번호입니다.');
					isHpOk= false;
				}
			});*/
			
			
			
			//최종전송
			//서버로 바로 제출되는 것을 막아야함 -> 유효성을 검증해야 하므로
			$('#formUser').submit(function(){
				//return false;이렇게 해놓으면 preventDefault할 때 처럼 전송이 되지 않는다. 
				//return true일 경우 폼 전송 시작
				
				if(!isUidOk){
				alert('아이디를 확인 하십시오.');
				return false;
				}
				if(!isPassOk){
					alert('비밀번호를 확인 하십시오.');					
					return false;
					}
				if(!isNameOk){
					alert('이름을 확인 하십시오.');
					return false;
					}
				if(!isNickOk){
					alert('닉네임을 확인 하십시오.');
					return false;
					}
				if(!isEmailOk){
					alert('이메일을 확인 하십시오.');					
					return false;
					}
				if(!isHpOk){
					alert('전화번호를 확인 하십시오.');					
					return false;
					}
				
				return true;//모든 if를 다 통과해야지 true가 된다.
				
				
			});
			
			
			//유효성 검증 끝 
		});