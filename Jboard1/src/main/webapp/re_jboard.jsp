<%@page import="kr.co.jboard1.dto.TermsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.apache.catalina.ant.StartTask"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
///////////////////	
//terms
//////////////////

//연결

	TermsDTO vo = new TermsDTO();
	try{
	
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `Terms`");
		
		if(rs.next()){
	vo.setTerms(rs.getString(1));
	vo.setPrivacy(rs.getString(2));
	
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
$(function(){
	
	$('#btnCheckUid').click(function(){
		const uid = $('input[name=uid]').val();
		
		if(!uid.match(reUid){
			$('.resultId').css('color','red').text('유효한 아이디 형식이 아닙니다.');
			isUidOk = false;
		})
		
		const jsonData = {
				"uid":uid
		}

		$.ajax({
			url:"Jboard1/user/checkUid.jsp",
			type:'GET',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				if(data.result>=1){
					$('.resultid').css('color','red').text('이미 사용중인 아이디 입니다.');
					isUidOk= false;
				}else{
					$('.resultUid').css('color','red').text('사용 가능한 아이디 입니다.');
					isUidOk = true;
				}
				
				
			}
		})
		
	});//아이디 중복체크 끝
	
	$('input[name=nick]').function((){
		
		const nick = $('this').val();
		
		if(!nick.match(reNick)){
			$('.resultNick').css('color','red').text('유효한 닉네임이 아닙니다.');
			isNickOk = false;
			return;			
		}
		
		const jsonData = {
				
				"nick":nick
		}
	
		
		$.get('Jboard1/user/checkNick,jsp', jsonData, function(data){
			if(data.result>=1){
				$('.resultNick').css('color','red').text('이미 사용중인 닉네임입니다.');
			}else{
				$('.resultNick').cse('color','green').text('사용 가능한 닉네임입니다.');
				
				
			}
			
		})
		
	})//닉네임 중복 체크 끝
	
	//이메일중복체크(javascript)
	
	const email = document.getElementsByName('email')[0];
	email.onfocusout = function(){
		
		const email = this.value;
		const resultEmail = document.getElemetById('resultEmail');
		if(!email.match(reEmail)){
			resultEmail.innerText = '유효한 이메일이 아닙니다.';
			resultEmail.style.color = 'red';
			isEmailOk = false;
			
			
		}
		
		const xhr = new XMLHttpRequest();
		xhr.open('GET','Jboard1/user/checkEmail.jsp?email='+email);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const data = JSON.parse(xhr.response);
					
					if(data.result>=1){
						resultEmail.innerText = '이미 사용중인 이메일입니다.';
						resultEmail.sytle.color = 'red';
						isEmailOk = false;
						return;
						
					}else{
						resultEmail.innerText = '사용가능한 이메일입니다.';
						resultEmail.style.color = 'green';
						isEmailOk = true;
						
					}
				}
			}
			
		}
		
	}//onfoucusout end
	
	
	
	document.getElementsByname('hp')[0].addEvnetListner('focusout',function(){
		
		const hp = this.value;
		const resultHp = document.getElementById('resultHp');
		
		if(!hp.match(reHp)){
			resultHp.innerText = '유효한 번호가 아닙니다.';
			result.style.color = 'red';
			isHpOk= false;
			return;
		}
		
		
		const url ='/Jboard1/user/checkHp.jsp:hp='this.value;
		
		fetch(url)
			.then(response => response,json())
			.then(data =>{
				
				if(data.result>=1){
					resultHp.innerText ='이미 사용중인 전화번호 입니다.'
					resultHp.style.color='red';
					isHpOk = false;
				}else{
					resultHp.innerText ='사용 가능한 전화번호 입니다.'
					rusultHp.style.color = 'green';
					inHpOk = true;
				}
				
			})
		
	
	})
	
	
	
	
})


</script>
