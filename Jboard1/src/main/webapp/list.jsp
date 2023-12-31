<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	
	
	//DAO 객체 생성
	ArticleDAO dao = new ArticleDAO();
	
	//페이지 관련 변수
	int start = 0;
	int currentPage =1;
	int total = 0;
	int lastPageNum =0;
	int pageGroupCurrent=1;
	int pageGroupStart =1 ;
	int pageGroupEnd =0;
	int pageStartNum =0;
	//현재 페이지 계산
	//total을 가지고 마지막 페이지 번호를 알아낼 것.
	if(pg != null){
		//pg는 밑에서 다음 페이지를 누를 때 날라옴
		//처음 list.jsp파일이 뜰 때는 0 ->currentPage=0;
		currentPage = Integer.parseInt(pg);
		//pg는 String 이기때문에 Integer.parseInt로 변경
	}
	
	//Limit 시작값 계산
	 start = (currentPage-1)*10;
	

	//전체 게시물 갯수 조회
	total = dao.selectCountTotal();
	
	//페이지 번호 계산
	if(total%10==0){
		lastPageNum= (total / 10);
	}else{
		lastPageNum=(total / 10) + 1;
	}
	
	//페이지 그룹 계산
	//currentPage가 1~10이면 pageGroupCurrent가 1
	//currentPage가 11~20이면 pageGroupCurrent가 2

	pageGroupCurrent = (int)Math.ceil(currentPage/10.0);
	pageGroupStart = (pageGroupCurrent-1)*10+1;
	pageGroupEnd = pageGroupCurrent*10;
	
	if(pageGroupEnd>lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	//페이지 시작번호 계산
	pageStartNum = total-start;
	
	
	//현재 페이지 게시물 조회
	List<ArticleDTO> articles =dao.selectArticles(start);
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
                                <%
                                for(ArticleDTO article : articles){
                                %>
                                <tr>
                                   <td><%= pageStartNum--%></td> 
                                   <td><a href="/Jboard1/view.jsp?no=<%=article.getNo() %>"><%=article.getTitle() %></a>&nbsp;[<%=article.getComment() %>]</td> 
                                   <td><%= article.getNick()%></td> 
                                   <td><%= article.getRdate() %></td> 
                                   <td><%= article.getHit() %></td> 
                                </tr>
                                <%} %>
                            </tbody>
                    </table>
                </article>
                <div class="paging">
                	
                	<%if(pageGroupStart>1){ %>
                    <a href="/Jboard1/list.jsp?pg=<%=pageGroupStart-1 %>" class="prev">이전</a>
                    <%} %>
                    <%for (int i =pageGroupStart; i<=pageGroupEnd;i++){ %>
                    <a href="/Jboard1/list.jsp?pg=<%=i %>" class="num <%=(currentPage == i)?"current":""  %>"><%= i %></a>
                    <%} %>
                    
                    <%if(pageGroupEnd<lastPageNum){ %>
                    <a href="/Jboard1/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
                	<%} %>
                	 
                </div>
                <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>
            </section>
        </main>
<%@ include file ="./_footer.jsp" %>      
