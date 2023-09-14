<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
                        <form action="./write.do" method ="post" enctype="multipart/form-data">
                            <input type="hidden" name="group" value="${group }">
                            <input type="hidden" name="type" value="${type }">
                            <input type="hidden" name="cate" value="10">
                            <input type="hidden" name="writer" value="writer">
                            <table>
                               <tbody>
                               <c:choose>
                               <c:when test="${group eq 'notice'}">
                               	<tr>
                                    <td>공지유형</td>
                                    <td>
                                        <select name="cate">
                                            <option >선택</option>
                                            <option value="1">고객서비스</option>
                                            <option value="2">안전거래</option>
                                            <option value="3">위해상품</option>
                                            <option value="4">이벤트상품</option>
                                        </select>
                                    </td>
                                </tr>
                               </c:when>
                               <c:when test ="${group eq 'qna'}">
                               </c:when>
                               </c:choose> 