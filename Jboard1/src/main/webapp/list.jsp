<%@page import="kr.co.jboard1.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<%
ArticleDAO dao = new ArticleDAO();
List<ArticleVO> articles =dao.selectArticles();

/*	
try{
		
		
		
		for(ArticleVO article : articles){
			article.setNo(articles.get(1));
			article.setParent(articles.get(2));
			article.setNo(articles.get(3));
			article.setNo(articles.get(4));
			article.setNo(articles.get(5));
			article.setNo(articles.get(6));
			article.setNo(articles.get(7));
			article.setNo(articles.get(8));
			article.setNo(articles.get(9));
			article.setNo(articles.get(10));
			article.setNo(articles.get(11));
		}밑에서 처리해야함
		
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
*/

%>
        <main>
          <section id="board" class="list">
                <h3>글목록</h3>
                <article>
                    <table >
                            <tbody>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>날짜</th>
                                    <th>조회</th>
                                </tr>
                                <% for(ArticleVO article : articles){ %>
                                <tr>
                                   <td><%= article.getNo() %></td> 
                                   <td><a href=#><%=article.getTitle() %></a>&nbsp;[<%=article.getComment() %>]</td> 
                                   <td><%= article.getNick()%></td> 
                                   <td><%= article.getRdate() %></td> 
                                   <td><%= article.getHit() %></td> 
                                </tr>
                                <%} %>
                            </tbody>
                    </table>
                </article>
                <div class="paging">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num current">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="next">다음</a>
                </div>
                <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>
            </section>
        </main>
<%@ include file ="./_footer.jsp" %>      
