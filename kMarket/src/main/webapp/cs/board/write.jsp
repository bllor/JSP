<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp" />
                        <form action="./write.do" method ="post" enctype="multipart/form-data">
                            <input type="hidden" name="cCate" value="10">
                            <input type="hidden" name="writer" value="writer">
                            <table>
                               <tbody>
                               <c:choose>
                               <c:when test="${group eq 'QNA'}">
                               	<tr>
                                    <td>문의유형</td>
                                    <td>
                                        <select name="type">
                                            <option value="0">선택</option>
                                            <option >가입</option>
                                            <option >탈퇴</option>
                                            <option >회원정보</option>
                                            <option >로그인</option>
                                        </select>
                                    </td>
                                </tr>
                               </c:when>
                               </c:choose> 
                                <tr>
                                    <td>문의제목</td>
                                    <td><input type="text" name="title" placeholder="제목을 입력하시오."></td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td>
                                        <textarea name="content" placeholder="내용을 입력하시오."></textarea>
                                    </td>
                                </tr>
                                <tr>
		                            <td>파일</td>
		                            <td>
		                                <input type="file" name="file"/>
		                            </td>
		                        </tr>
                               </tbody>
                            </table>
                            <div>
                                <a href="./list.do" class="btnList">취소하기</a>
                                <input type="submit" class="btnSubmit" value="등록하기">
                            </div>
                        </form>
                    </article>
                </section>
            </div>
        </section>
<%@include file ="../_footer.jsp" %>