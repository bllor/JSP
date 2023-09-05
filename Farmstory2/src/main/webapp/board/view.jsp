<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
$(function(){
	//댓글 입력
	$('.btnWrite').click(function(e){
		e.preventDefault();
		
		alert('댓글입력');
		
	});//insert end
	
});

</script>
<jsp:include page="./_aside${group}.jsp"/>
			<section class="view">
			    <h3>글보기</h3>
			    <table>
			        <tr>
			            <td>제목</td>
			            <td><input type="text" name="title" value="${article.title }" readonly/></td>
			        </tr>
			        <tr>
			        	<c:if test="${article.file>0}">
			            <td>첨부파일</td>
			            <td>
			                <a href="${ctxPath}/board/fileDownload.do?fno=${article.fileDto.fno}">${article.fileDto.ofile }</a>
			                <span>${article.fileDto.download }회 다운로드</span>
			            </td>
			            </c:if>
			        </tr>
			        <tr>
			            <td>내용</td>
			            <td>
			                <textarea name="content" readonly>${article.content }</textarea>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <a href="#" class="btnDelete">삭제</a>
			        <a href="#" class="btnModify">수정</a>
			        <a href="#" class="btnList">목록</a>
			    </div>
			    
			    <!-- 댓글리스트 -->
			    <section class="commentList">
			        <h3>댓글목록</h3>
			        <c:forEach var ="comment" items="${comments }">
			        <article class="comment">
			        	<form action="#" method="post">
							<span>
								<span>${comment.nick }</span>
								<span>${comment.rdate}</span>
							</span>
							<textarea name="comment" readonly>${comment.content}</textarea>
			             
							<div>
								<a href="#" class="del">삭제</a>
								<a href="./list.do?group=${group}&cate=${cate}" class="can">취소</a>
								<a href="./modify.do?group=${group}&cate=${cate}" class="mod">수정</a>
							</div>                
			            </form>
			        </article>
			        </c:forEach>
			        <c:if test="${comments.size()==0}">  
			        <p class="empty">등록된 댓글이 없습니다.</p>
			    	</c:if>
			    </section>
			
			    <!-- 댓글입력폼 -->
			    <section class="commentForm">
			        <h3>댓글쓰기</h3>
			        <form action="${ctxPath }/board/comment.do" method="post">
			        		<input type="hidden" name= "no" value="${article.no}">
			        		<input type="hidden" name= "uid" value="${sessUser.uid}">
			        		<input type="hidden" name = "group" value="${group}">
			        		<input type="hidden" name = "cate" value="${cate}">
			            <textarea name="content"></textarea>
			            <div>
			                <a href="#" class="btnCancel">취소</a>
			                <input type="submit" class="btnWrite" value="작성완료"/>
			            </div>
			        </form>
			    </section>
			</section>
			<!-- 내용 끝 -->
        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>