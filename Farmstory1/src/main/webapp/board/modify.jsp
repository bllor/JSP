<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no);
	
	
	pageContext.include("./_aside"+group+".jsp");
	
%>
<section class="modify">
    <h3>글수정</h3>
    <article>
        <form action="/Farmstory1/board/proc/updateProc.jsp" method="post">
        	<input type="hidden" name="no" value="<%=no%>">
        	<input type="hidden" name="group" value="<%=group%>">
        	<input type="hidden" name="cate" value="<%=cate%>">
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= dto.getTitle() %>" /></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"><%=dto.getContent() %></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="file"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory1/board/view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%=dto.getNo()%>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="수정완료">
            </div>
        </form>
    </article>
</section>
<!-- 내용 끝 -->

        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>