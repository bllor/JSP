<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page import="kr.Farmstory1.dto.TermsDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
TermsDTO dto = UserDAO.getInstance().selectTerms();


%>
<script >
     	window.onload = function(){
     		
     		
     		const chk1 = document.getElementsByName('chk1')[0];
     		const chk2 = document.getElementsByName('chk2')[0];
     		
     		const btnNext = document.querySelector('.btnNext');
     		btnNext.addEventListener('click',function(e){
     			e.preventDefault();
     			
     			
     			if(!chk1.checked){
     				alert('이용약관에 동의하셔야 합니다.');
     				return;
     			}else if(!chk2.checked){
     				alert('개인정보 취급방침에 동의하셔야 합니다.');
     				return;
     			}else{
     				location.href ='/Farmstory1/user/register.jsp';
     			}
     			
     		})
     		
     		
     		
     	};//onload end
     </script>

        <div id="user">
             <main>
                <section class="terms">
                    <table border="1">
                        <caption>사이트이용약관</caption>
                        <tbody>
                            <tr>
                                <td>
                                    <textarea readonly><%=dto.getTerms() %></textarea>
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
                                    <textarea readonly><%=dto.getTerms() %></textarea>
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
                        <a href="/Farmstory1/user/login.jsp" class="btnCancel">취소</a>
                        <a href="#" class="btnNext">다음</a>
                    </div>  
                </section>
            </main>
        </div>
<%@ include file="../_footer.jsp" %>
