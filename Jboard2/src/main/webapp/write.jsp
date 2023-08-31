<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main id="board">
            <section class="write">

                <form action="/Jboard2/write.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="writer" value="${sessUser.uid }"/>
                    <table border="0">
                        <caption>글쓰기</caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                                <input type="file" name="file"/>
                            </td>
                        </tr>
                    </table>
                    
                    <div>
                        <a href="./list.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                        <!-- 
                        	여러개의 파일을 업로드 하기 위한 방법 multiple 속성이용  multiple ="multiple"
                        	한 번 생각해보기
                        -->
                    </div>
                </form>

            </section>
        </main>
<%@ include file="./_footer.jsp" %>
