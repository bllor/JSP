<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String no =request.getParameter("no");

	ArticleDAO dao = new ArticleDAO();

	
	//원글조회
	ArticleDTO dto =dao.selectArticle(no);

	//댓글 조회
	List<ArticleDTO>comments = dao.selectComments(no);
%>
<script>
	$(function(){
		
		
		
		
		//댓글수정
		$('.mod').click(function(e){
			e.preventDefault();
			
			const txt =$(this).text();
			//this는 내가 선택한 그 .mod를 말한다.
			if(txt=='수정'){
				//수정모드
				$(this).parent().prev().addClass('modi');
				$(this).parent().prev().attr('readonly',false);
				$(this).parent().prev().focus();//입력창에 커서를 띄움
				$(this).text('수정완료');
				$(this).prev().show();
				//this가 mod이고, prev는 can을가리키는데 show를 함으로써 display none이 되어있던 것이 나온다.
				}else{
				//수정완료 클릭
				
				if(confirm('정말 수정하시겠습니까?')){
					$(this).closest('form').submit();
				}else{
					$(this).parent().prev().val(comment);
				}
				
				
				//수정 데이터 전송
				//$(this).parent().parent()==$(this).closest('form') this에 가장 근접한 form태그를 선택.
				
				
				//수정모드 해제
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly',true);
				$(this).text('수정');
				$(this).prev().hide();
				
				
			}
			
			//댓글수정취소
			//취소를 누르기 전 데이터를 가지고 있을 변수가 필요하다.
			//이것때문에 다시 db에서 조회하기에는 비효율적이다.
			//view.jsp로 링크 이동하는 방법도 가능
			/*
			$('.can').click(function(e){
				e.preventDefault();
				
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly',true);
				$(this).hide();
				$(this).next().text('수정');
				
				
			});
			*/
			
			
		});
		
		
		//댓글삭제
		$('.del').click(function(){
			
			const result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				return true;
			}else{
				return false;		
			}
		});
		
		
		//댓글쓰기 취소-js
		/*
		const commentContent = document.querySelector('form > textarea[name=content]');
		const btnCancel = document.querySelector('.btnCancel');
		btnCancel.onclick = function(e){
			e.preventDefault();
			commentContent.value ='';
			
		};
		*/
		
		//댓글쓰기 취소-jquery
		
		$('.btnCancel').click(function(e){
			e.preventDefault();
			$('form> textarea[name=comment]').val(' ');
			
		});
		
		
		
		//원글삭제 jQuery
		/*
		$('.btnDelete').click(function(){
			
			const result = confirm('정말 삭제 하시겠습니까?');
			if(result){
				return true;
			}else{
				return false;
			}
		
		});
		*/
		
		//원글삭제
													
	const btnDelete = document.getElementsByClassName('btnDelete');
	//const btnDelete = document.getElementsByClassName('btnDelete')[0];
		
	btnDelete.onclick = function(){
		
			if(confirm('정말삭제하시겠습니까?')){
				return true;
				
			}else{
				return false;
			}
		}
	
	/*
	btnDelete.onclick = function(){
		if(confirm('정말 삭제 하시겠습니까?')){
			return true;
		}else{
			return false;					
		}
	}
	*/
	
	
	});

</script>
        <main>
            <section class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value=<%=dto.getTitle() %> readonly></td>
                    </tr>
                    <%if(dto.getFile()>0){ %>
                    
                    <tr>
                        <td>첨부파일</td>
                        <td>
                            <a href="#">2020년 상반기 매출자료.xls</a>
                            <span>7회 다운로드</span>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly><%=dto.getContent() %></textarea>            
                        </td>
                    </tr>
                </table>
                <div>
                	<%if(sessUser.getUid().equals(dto.getWriter())){ %>
                    <a href="/Jboard1/delete.jsp?no=<%=no %>" class="btnDelete">삭제</a>
                    <a href="/Jboard1/modify.jsp?no=<%=no %>" class="btnModify">수정</a>
                    <%} %>
                    <a href="/Jboard1/list.jsp" class="btnList">목록</a>
                </div>
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <%for(ArticleDTO comment : comments){ %>
                    <article class="comment">
                    	<form action="/Jboard1/proc/commentUpdate.jsp?no=<%=comment.getNo() %>&parent=<%=dto.getNo() %>" method = "post">
	                        <span>
	                            <span><%= comment.getNick() %></span>
	                            <span><%= comment.getRdate() %></span>                        
	                        </span>
	                        <textarea name="comment" readonly><%= comment.getContent() %></textarea>
	                        
	                        <%if(sessUser.getUid().equals(comment.getWriter())){ %>
	                        <div>
	                            <a href="/Jboard1/proc/commentDelete.jsp?no=<%=comment.getNo()%>&parent=<%=comment.getParent() %>" class= "del">삭제</a>
	                            
	                            <a href="/Jboard1/view.jsp?no=<%=no %>" class= "can">취소</a>
	                            
	                            <a href="#" class= "mod">수정</a>
	                        </div>
	                        <%} %>
                        </form>
                    </article>
               		<%} %>
                    <%if(comments.isEmpty()) {//comment.size()로 해도됨.%>
                    <p class="empty">
                        등록된 댓글이 없습니다.
                    </p>
                    <%} %>
                </section>

                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="/Jboard1/proc/commentProc.jsp" method="post">
                        <input type ="hidden" name ="parent" value="<%= no %>">
                        <input type ="hidden" name ="writer" value="<%= sessUser.getUid() %>">
                        
                        
                        <textarea name="content"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>
            </section>
        </main>
<%@ include file ="./_footer.jsp" %>