//이메일 인증

$(function(){
	
	
	let preventDoubleClick = false;
	
	$('#btnEmailCode').click(function(){
		
		const name = $('input[name=name]').val();
		const email = $('input[name=email]').val();
		
		
		const jsonData ={
			"name":name,
			"email":email
		};
		
		if(preventDoubleClick){
			return;
		}
		
		preventDoubleClick = true;
		$('.resultEmail').text('인증코드 전송 중입니다. 잠시만 기다려주세요.');
		$('.resultEmailForId').text('인증코드 전송 중입니다. 잠시만 기다려주세요.');
		
		
		setTimeout(function(){
			
			$.ajax({
				url: '/Jboard2/user/authEmail.do',
				type: 'GET',
				data: 'json',
				success: function(data){
					console.log(data);
				
					if(data.result>0){
						$('.resultEmail').css('color','red').text('이미 사용 중인 이메일입니다.');
						isEmailOk= false;
						
						if(data.status>0){
							$('.resultEmailForId').css('color','green').text('이메일을 확인한 후 인증 코드를 입력하시오.');
							$('input[name=auth]').prop('disabled',false);	
							
						}else{
							$('.resultEmailForId').css('color','red').text('인증코드 전송이 실패했습니다. 잠시 후 다시 시도하십시오.');
							
							
						}
						
					}else{
						
						
					}
					
				}
				
			})
			
		});//timeout end
		
		
		
	});//click end
	
	
});