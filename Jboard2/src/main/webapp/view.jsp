<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
 <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script>
//ajax를 사용하는 이유는 통신을 줄이기 위함 -> 통신을 줄이는 것은 비용 절감을 의미함.
//화면갱신없이 댓글목록을 바로 가져옴.
 	$(function(){
 		
 		/*
 		//댓글 삭제
 		$('.remove').click(function(e){
 			e.preventDefault();
 			
 			alert('삭제');
 			
 		});
 		//정적이벤트 연결이라서 foreach가 생성된 후 댓글삭제가 생성됨.
 		//ajax의 동적 화면 생성에서 만들어지는 삭제버튼에는 위의 댓글 삭제 기능이 작동되지 않는다.
 		//그래서 동적 생성 이벤트 방식으로 변환한다.
 		*/
 		
 		//댓글삭제(동적 생성 이벤트 구현)
 		$(document).on('click', '.remove',function(e){
 			
 			e.preventDefault();
 			
 			//alert('삭제'	);
			const no = $(this).data('no');
			const article =$(this).parent().parent();
			
 			console.log('no :'+no);
 			
 			const jsonData={
 					"kind":"REMOVE",
		 			"no": no		
 			};
 			
 			$.ajax({
 				url:"/Jboard2/comment.do",
 				type: 'GET',
 				data: jsonData,
 				dataType: 'json',
 				success: function(data){
 					
 					if(data.result > 0){
 						
 						//화면 처리
 						//for문이라서 여러개의 article이 입력이 되는데 article을 삭제하는 것이 댓글을 삭제하는 것
 						//삭제 버튼의 parent parent가 article
 						//ajax에서는 this 사용못함
 						article.remove();
 						
 						
 						
 						
 					}
 				}
 			});
 			
 			
 		});
 		
 		
 		//댓글 입력
 		$('#btnComment').click(function(e){
 			e.preventDefault();
 			
 			const content = $('#formComment > textarea[name=content]').val();
 			const parent = $('#formComment > input[name=parent]').val();
 			const writer = $('#formComment > input[name=writer]').val();
 			
 			const jsonData ={
 					"content": content,
 					"parent" : parent,
 					"writer" : writer,
 					
 			};
 			
 			$.ajax({
 				url:'/Jboard2/comment.do',
 				type: 'POST',
 				data: jsonData,
 				dataType: 'json',
 				success: function(data){
 					
 					console.log(data);
 					
 					if(data.no >0){
 						
 						$('#formComment > textarea[name=content]').val('');//초기화
 						
 						//동적 화면 생성
 						
 						const dt = new Date();
 						const year = dt.getFullYear().toString().substr(2,4);
 						const month = dt.getMonth()+1;
 						const date = dt.getDate();
 						const now = year+ "-" +month+ "-" +date;
 						
 						
 						const article =`<article>
 											<span class ='nick'>${sessUser.nick}</span>
 											<span class ='date'>`+now+`</span>
 											<p class='content'>`+content+`</p> 
 											<div>
 												<a href="#" class='remove' data-no=`+data.no+`>삭제</a>
 												<a href="#" class='modify'>수정</a>
 											</div>
 										</article>`;
 										
 					$('.commentList').append(article);					
 						
 					}else{
 						alert('댓글이 등록이 실패했습니다.');
 					}
 					
 				}
 				
 			
 			});
 			
 		});
 		
 	});

 </script>
 
        <main id="board">
            <section class="view">
                
                <table border="0">
                    <caption>글보기</caption>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" value="${article.title }" readonly/></td>
                    </tr>
                     <c:if test="${article.file > 0}">
		            <tr>
		                <th>파일</th>
		                <td>
			                <a href="/Jboard2/fileDownload.do?fno=${article.fileDto.fno }">${article.fileDto.ofile }</a>&nbsp;
			                <span>${article.fileDto.download}</span>회 다운로드
			            </td>
		                <!-- a태그라서 파일이 get형태로 넘어감 -->
		            </tr>
		            </c:if>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" readonly>${article.content}</textarea>
                        </td>
                    </tr>                    
                </table>
                
                <div>
                    <a href="/Jboard2/delete.do?no=${article.no}" class="btn btnRemove">삭제</a>
                    <a href="./modify.do?no=${article.no}" class="btn btnModify">수정</a>
                    <a href="./list.do" class="btn btnList">목록</a>
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                
                    <h3>댓글목록</h3>                   
					<c:forEach var="comment" items= "${requestScope.comments}">
                    <article>
                        <span class="nick">${comment.nick}</span>
                        <span class="date">${comment.regDate }</span>
                        <p class="content">${comment.content }</p>                        
                        <div>
                            <a href="#" class="remove" data-no="${comment.no}">삭제</a>
                            <a href="#" class="modify">수정</a>
                            <!-- 
                            a태그는 value 속성의 없으므로 사용자 정의 속성(data-)을 사용한다. 
                            위에서는 data-no로 정의 하였다.
                            data-'변수명'을 입력하면 받을 수 속성으로 사용할 수 있다. 
                            -->
                        </div>
                    </article>
	               </c:forEach>	
                     	<c:if test="${comments.size() == 0}">
			            	<p class="empty">등록된 댓글이 없습니다.</p>
						</c:if>
				</section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form id="formComment" action="#" method="post">
                    	<input type ="hidden" name ="parent" value="${no}">
                    	<input type ="hidden" name ="writer" value="${sessUser.getUid()}">
                        <textarea name="content"></textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" id="btnComment" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>

            </section>
        </main>
<%@ include file="./_footer.jsp" %>
