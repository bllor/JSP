<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script >
	$(function(){
		
		$('.btnNext').click(function(){
			
			const chk1 = $('input[name=chk1]').is(':checked');
			const chk2 = $('input[name=chk2]').is(':checked');
			
			if(!chk1){
				alert('사이트 이용약관에 동의체크 하시기 바랍니다.');
				retrun false;
			}
			
			if(!chk2){
				alert('개인정보 취급방침 약관에 동의체크 하시기 바랍니다.');
				return false;
				
			}
			
			return true;
		});//btnNextClose
		
	});     	

</script>
        <div id="user">
            <main>
                <section class="terms">
                    <table border="1">
                        <caption>사이트이용약관</caption>
                        <tbody>
                            <tr>
                                <td>
                                    <textarea readonly>${dto.terms }</textarea>
                                    <p>
                                        <label>
                                            <input type="checkbox" name="chk1">동의합니다.
                                        </label>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>  
                    <table border="1">
                        <caption>개인정보 취급방침</caption>
                        <tbody>
                            <tr>
                                <td>
                                    <textarea readonly>${dto.privacy}</textarea>
                                    <p>
                                        <label>
                                            <input type="checkbox" name="chk2">동의합니다.
                                        </label>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <a href="${ctxPath}/user/login.do" class="btnCancel">취소</a>
                        <a href="${ctxPath}/user/register.do" class="btnNext">다음</a>
                    </div>  
                </section>
            </main>
        </div>
<%@ include file="../_footer.jsp" %>
        