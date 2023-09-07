<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
        <div id="sub">
            <div><img src="${ctxPath}/images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="${ctxPath}/images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="${ctxPath}/market/list.do">장보기</a></li>
                    </ul>
                </aside>
                <article class="list">
                    <nav>
                        <img src="${ctxPath}/images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->
                    <p class="sort">
                        <a href="${ctxPath }/market/list.do?type=0" class="${type eq 0 ? "on" : "off"}">전체<c:if test = "${type==0}">(${total })</c:if>&nbsp;|</a>
                        <a href="${ctxPath }/market/list.do?type=1" class="${type eq 1 ? "on" : "off"}>과일<c:if test="${type==1 }">(${total })</c:if>&nbsp; |</a>
                        <a href="${ctxPath }/market/list.do?type=2" class="${type eq 2 ? "on" : "off"}>야채 <c:if test ="${type==2 }" >(${total })</c:if>&nbsp;|</a>
                        <a href="${ctxPath }/market/list.do?type=3" class="${type eq 3 ? "on" : "off"}">곡류<c:if test="${type==3 }">(${total })</c:if>&nbsp; </a>
                    </p>
                    <table border="0">
                        <c:forEach var = "product" items="${ products}">
                        <tr>
                            <td>
                                <a href="${ctxPath }/market/view.do?pNo=${product.pNo}"><img src="${ctxPath}/upload/${product.thumb1}" class="thumb" alt="${product.etc}"></a>
                            </td>
                            <td>과일</td>
                            <td><a href="#">사과 500g</a></td>
                            <td><strong>4,000</strong>원</td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item2.jpg" alt="배 5kg"></a>
                            </td>
                            <td>과일</td>
                            <td><a href="#">배 5kg</a></td>
                            <td><strong>30,000</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item3.jpg" alt="방울토마토"></a>
                            </td>
                            <td>야채</td>
                            <td><a href="#">방울토마토</a></td>
                            <td><strong>5,000</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item4.jpg" alt="딸기 500g"></a>
                            </td>
                            <td>과일</td>
                            <td><a href="#">딸기 500g</a></td>
                            <td><strong>4,000</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item5.jpg" alt="ㅊ"></a>
                            </td>
                            <td>과일</td>
                            <td><a href="#">오렌지</a></td>
                            <td><strong>8,000</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item6.jpg" alt="무농약현미"></a>
                            </td>
                            <td>곡류</td>
                            <td><a href="#">무농약현미</a></td>
                            <td><strong>39,000</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item7.jpg" alt="팜스토리 하루야채 샐러드"></a>
                            </td>
                            <td>야채</td>
                            <td><a href="#">팜스토리 하루야채 샐러드</a></td>
                            <td><strong>9,900</strong>원</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="./view.html"><img src="${ctxPath}/images/market_item8.jpg" alt="바나나"></a>
                            </td>
                            <td>과일</td>
                            <td><a href="#">바나나</a></td>
                            <td><strong>3,000</strong>원</td>
                        </tr>
                    </table>

                    <p class="paging">
                        <a href="#"><</a>
                        <a href="#" class="on">[1]</a>
                        <a href="#">[2]</a>
                        <a href="#">[3]</a>
                        <a href="#">[4]</a>
                        <a href="#">[5]</a>
                        <a href="#">></a>
                    </p>

                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
        
        
<%@ include file="../_footer.jsp" %>
