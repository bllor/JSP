//폼데이터 검증 상태 변수

let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;

//데이터 검증에 사용하는 정규표현식
const reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[`~!@#$%^&\\(\\)|-_=+`]).{5,16}$/;
const reName = /^[가-힣]{2,10} $/;
const reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.])?[0-9a-zA-Z]@[0-9A-Za-z]([-_\.]?[0-9a-zA-z])*\[a-zA-Z{2,3}]$/i;
const reHp = /^01(?0|1|[6-9])-(?:\d{4})-\d{4}$/;


//유효성 검사
//여기서는 비밀번호와 이름의 유효성검사만 진행하는데
//아이디와 닉네임, 전화번호, email은 db에 있는 것과 대조해봐야 하므로 조회할 수 없다.
$(function(){
	
	//아이디 검사
	$('input[name=uid]').keydown(function(){
		$('.uidResult').text('');
		isUidOk = false;
	});
	
	//비밀번호 검사
	
	$('input[name=pass2]').focusout(function(){
		
		const pass1 = $('input[name=pass1]').val();
		const pass2 = $('input[name=pass2]').val();
		
		if(pass1 == pass2){
			if(pass2.match(rePass)){
				$('.passResult').css('color','green').text('사용할 수 있는 비밀 번호 입니다.');
				isPassOk = True;
			}else{
				$('.passResult').css('color','red').text('사용할 수 없는 비밀번호 입니다.');
				isPassOk = false;
			}
		}else{
			$('.passResult').css('color','red').text('비밀번호가 일치하지 않습니다.');
			ispisPassOk = false;
		}
		
	});
	
	
	//이름 검사
	$('input[name=name]').focusout(function(){
		const name = $(this).val();
		
		if(name.match(reName)){
			$('.nameResult').text();
			isNameOk = true;
		}else{
			$('.nameResult').css('color','red').text('사용할 수 없는 이름입니다.');
			isNameOk = false;
		}
	});
	
	//별명검사
	$('input[name=nick]').keydown(function(){
		
		$('.nicResult').text();
		isNickOk = false;
		
	});
	
	
	
	//이메일 검사
	$('input[name=email]').keydown(function(){
		
		$('.emailResult').text();
		isEmailOk = false;
	});
	
});//function end