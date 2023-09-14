<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp" />
                       <table>
                            <tr>
                                <td><a href="/kMarket/cs/board/view.do?group=Notice&cate=0">[안내] notice view 연결</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="/kMarket/cs/board/view.do?group=FAQ&cate=10">[안내] FAQ view 연결</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="/kMarket/cs/board/view.do?group=QNA&cate=10">[안내] QNA view 연결</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                            <tr>
                                <td><a href="#">[안내]</a></td>
                                <td>2022.11.11</td>
                            </tr>
                        </table>
                        <div class="page">
                            <a href="#" class="prev">이전</a>
                            <a href="#" class="num on">1</a>
                            <a href="#" class="num ">2</a>
                            <a href="#" class="num ">3</a>
                            <a href="#" class="next">다음</a>
                        </div>
                        <a href="/kMarket/cs/board/write.do?group=${group }&cate=${cate}" class="btnWrite">작성하기</a>
                    </article>
                </section>
            </div>
        </section>
<%@include file ="../_footer.jsp" %>