<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="./_header.jsp" %>
 <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
        <main id="board">
            <section class="list">                
                <form action="#">
                    <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                    <input type="submit" value="검색">
                </form>
                
                <table border="0">
                    <caption>글목록</caption>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                     <c:forEach var="article" items="${requestScope.articles }">
	                     
	                     <tr>
	                       	<td>${pageStartNum = pageStartNum - 1}</td>
	                        <td><a href="./view.do?no=${article.getNo()}">${article.getTitle() }[${ article.comment}]</a></td>
	                        <td>${article.getNick() }</td>
	                        <td>${article.getRegDate() }</td>
	                       	<td>${article.getHit() }</td>
	                    </tr>
                    </c:forEach>
                </table>

                <div class="page">
        	<c:if test="${pageGroupStart > 1}">
            	<a href="/Jboard2/list.do?pg=${pageGroupStart - 1}&search=${search}" class="prev">이전</a>
            </c:if>
            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
            	<a href="/Jboard2/list.do?pg=${i}&search=${search}" class="num ${currentPage == i?'current':'off'}">${i}</a>
            </c:forEach>
            <c:if test="${pageGroupEnd < lastPageNum}">
            	<a href="/Jboard2/list.do?pg=${pageGroupEnd + 1}&search=${search}" class="next">다음</a>
            </c:if>
        </div>
        <a href="./write.do" class="btn btnWrite">글쓰기</a>
                
            </section>
        </main>
<%@ include file="./_footer.jsp" %>
 