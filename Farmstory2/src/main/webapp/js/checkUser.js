/**
 * 사용자 개인정보 중복 체크
*/


$(function(){

	//아이디 중복체크
	
	$('#btnCheckUid').click(function(){
		
		const uid = $('input[name=uid]').val();
		
		if(!uid.match(reUid)){
			$('.resultId').css('color','red').text('유효한 아이디가 아닙니다.');
			isUidOk = false;
			return;
		}
		
		const jsonData ={
			"uid":uid
		};
		
		$.ajax({
			url:'/Farmstory2/user/checkUid.do',
			type:'GET',
			data: jsonData,
			dataType: 'json',
			success:function(data){
				if(data.result >= 1){
					$('.resultId').css('color','red').text('이미 사용 중인 아이디입니다.');
					isUidOk = false;
					
				}else{
					$('.resultId').css('color','green').text('사용가능한 아이디 입니다.');
					isUidOk = true;
				}
				
			}
			
		});
		
	});
	
	
	//닉네임 중복체크
	$('input[name=nick]').focusout(function(){
		
		//입력 데이터 가져오기
		const nick = $(this).val();
		
		if(!nick.match(reNick)){
			$('.resultNick').css('color','red').text('유효한 닉네임이 아닙니다.');
			isNickOk= false;
			return;
		}
		
		//json생성
		const jsonData ={
			"nick":nick
		};
		
		//데이터 전송
		$.get('/Farmstory2/user/checkNick.do',jsonData, function(data){
			if(data.result>1){
				$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
				isNickOk = false;
			}else{
				$('.resultNick').css('color','green').text('사용 가능한 닉네임입니다.');
				isNickOk = true;
			}
			
		});//닉네임 중복 체크 끝
		
	});
});