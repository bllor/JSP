<%@page import="kr.co.jboard1.dto.TermsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
TermsDTO dto = new TermsDTO();
try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Terms`");
		
		if(rs.next()){
			dto.setTerms(rs.getString(1));
			dto.setPrivacy(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>약관</title>
        <!--
            날짜:2023/08/02
            이름:최동일
            내용:게시판 프로젝트1
        -->
        <link rel="stylesheet" href="../css/style.css">
     
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
     				location.href ='/Jboard1/user/register.jsp';
     			}
     			
     		})
     		
     		
     		
     	};//onload end
     </script>
     
    </head>
    <body>
        <div id = "container">
            <header>
                <h3>Board System v1.0</h3>
            </header>
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
                                    <textarea readonly><%= dto.getPrivacy() %></textarea>
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
                        <a href="./login.html" class="btnCancel">취소</a>
                        <a href="#" class="btnNext">다음</a>
                    </div>  
                </section>
            </main>
            <footer>
                <p>ⓒCopyright by 최동일.com</p>
            </footer>
        </div>
    </body>
</html>