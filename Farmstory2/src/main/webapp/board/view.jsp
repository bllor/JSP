<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
$(function(){
	//댓글 입력
	$('.btnWrite').click(function(e){
		e.preventDefault();
		
		
		const content =$('.commentForm > form> textarea[name=content]').val();
		const parent =$('.commentForm > form> input[name=parent]').val();
		const writer =$('.commentForm > form> input[name=writer]').val();
		const cate =$('.commentForm > form> input[name=cate]').val();
		
		const jsonData ={
				"content": content,
				"parent": parent,
				"writer": writer,
				"cate": cate,
		}
		
		$.ajax({
			url:'/Farmstory2/board/comment.do',
			type:'POST',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				console.log(data);
				
				if(data.no >0){
					$('.commentForm > form >textarea[name=content]').val('');//초기화
					
					//동적화면 생성
					
					const dt = new Date();
					const year = dt.getFullYear().toString().substr(2,4);
					const month = dt.getMonth()+1;
					const date = dt.getDate();
					const now = year+" - "+month+" - "+date;
					
					const article = `<article>
										<form action="#" method="post">
											<span>${sessUser.nick}</span>
											<span>`+now+`</span>
											<textarea readonly>`+content+`</textarea>
											<div>
												<a href ="#" class="del" data-no =`+data.no+`>삭제</a>
												<a href ="#" class="mod" data-no =`+data.no+`>수정</a>
												<a href ="#" class="can">취소</a>
											</div>
										</form>
									</article>`;
					
					$('.commentList').append(article);
				}else{
					alert('댓글 등록이 실패했습니다.');
				}
			}
			
			
		});//ajax end	
		
	});//insert end
	
	
	//댓글 삭제
	$(document).on('click','.del',function(e){
		e.preventDefault();
		
		const no =$(this).data('no');
		const article =$(this).parent().parent().parent();
		
		console.log('delNo :' +no);
		
		const jsonData={
				"kind":"REMOVE",
				"no": no
		};
		
		$.ajax({
			url:'/Farmstory2/board/comment.do',
			type:"GET",
			data: jsonData,
			dataType: 'json',
			success : function(data){
				
				if(data.result>0){
					article.remove();
				}
				
			}
			
		});
		
		
	});//remove end
	
	
	
	//댓글 수정
	$(document).on('click','.mod',function(e){
		e.preventDefault();
		
		const txt = $(this).text();
		
		
		if(txt=='수정'){
			$(this).parent().prev().addClass('modi');
			$(this).parent().prev().attr('readonly',false);
			$(this).parent().prev().focus();
			$(this).text('수정완료');
			$(this).next().show();	
		}else{
			
			if(confirm('정말 수정하시겠습니까?')){
				//수정한다
			const no =$(this).data('no');
			const content = $(this).parent().prev().val();
			
			console.log("no: "+no);
			console.log("modiContent : "+content);
			
			const jsonData={
					"kind":"MODIFY",
					"no":no,
					"content":content
			};
			
			console.log('jsonData : ', jsonData);
			
			$.ajax({
				url:'/Farmstory2/board/comment.do',
				type:'GET',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					console.log(data);
				
					if(data.result > 0){
						
						const dt = new Date();
						const year = dt.getFullYear().toString().substr(2,4);
						const month = dt.getMonth()+1;
						const date = dt.getDate();
						const now = year+" - "+month+" - "+date;
						
						const article =`<article>
								<span class ='nick'>${sessUser.nick}</span>
								<span class ='date'>`+now+`</span>
								<p class='content'>`+content+`</p> 
								<div>
									<a href="#" class='remove' data-no=`+data.no+`>삭제</a>
									<a href="#" class='modify'>수정</a>
								</div>
							</article>`;
					console.log(article);
					
					$('.commentList').append(article);
					
						
					}else{
						alert('댓글 수정이 실패하였습니다.');
					}
						
				}
						
			});
			$(this).parent().prev().removeClass('modi');
			$(this).parent().prev().attr('readonly',true);
			$(this).text('수정');
			$(this).next().hide();
			
			}else{
				//수정하지 않는다
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly',true);
				$(this).text('수정');
				$(this).next().hide();
			}
		}
		
		
	});//modify end
	
	
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
					<a href="${ctxPath }/board/delete.do?group=${group}&cate=${cate}&no=${article.no}" class="btnDelete">삭제</a>
					<a href="${ctxPath }/board/modify.do?group=${group}&cate=${cate}&no=${article.no}" class="btnModify">수정</a>
					<a href="${ctxPath }/board/list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
					
			    
			        </div>
			    
			    <!-- 댓글리스트 -->
			    <section class="commentList">
			        <h3>댓글목록</h3>
			        <c:forEach var ="comment" items="${comments }">
			        <article class="comment">
			        	<form action="#" method="post">
								<span>${comment.nick }</span>
								<span>${comment.rdate}</span>
								<textarea readonly>${comment.content}</textarea>
			             
							<div>
								<a href="#" class="del" data-no=${comment.no}>삭제</a>
			    			    <a href="#" class="mod" data-no=${comment.no}>수정</a>
			        			<a href="#" class="can">취소</a>
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
			        		<input type="hidden" name= "parent" value="${article.no}">
			        		<input type="hidden" name= "writer" value="${sessUser.uid}">
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