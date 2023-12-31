<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

        <main id="board">
            <section class="modify">

                <form action="/Jboard2/modify.do" method ="POST">
                    <table border="0">
                    <input type="hidden" name ="no" value="${article.no}"/>
                     <caption>글수정</caption>
                        <tr>
                            <th>제목</th>
                            <td>
                            <input type="text" name="title" value="${article.title }">
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content">${article.content }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                                <input type="file" name="file" value="${article.fileDto.ofile}"/>
                            </td>
                        </tr>
                    </table>
                    
                    <div>
                        <a href="./view.do?no=${article.no}" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
<%@ include file="./_footer.jsp" %>







