<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <script>
        $(function(){

            $('.showPopup').click(function(e){
                e.preventDefault();
                const orderNo = $(this).closest('tr').find('#orderNo').text();
                const pNo = $(this).closest('tr').find('#pNo').text();
                const orderPrice = $(this).closest('tr').find('#orderPrice').text();
                const orderCount = $(this).closest('tr').find('#orderCount').text();
                const orderDelivery = $(this).closest('tr').find('#orderDelivery').text();
                const orderDate = $(this).closest('tr').find('#orderDate').text();
                
                console.log(orderNo);
                $('#orderPopup').show();
            });

            $('#orderPopup .btnClose').click(function(){
                $('#orderPopup').hide();
            });

        });
    </script>
 <main>
            <aside>
                <h3>주요기능</h3>
                <ul>
                    <li><a href="${ctxPath }/admin/productList.do">상품관리</a></li>
                    <li class="on" ><a href="${ctxPath }/admin/orderList.do">주문관리</a></li>
                    <li><a href="${ctxPath }/admin/userList.do">회원관리</a></li>                    
                </ul>
            </aside>      
   <section id="orderList">
                <nav>
                    <h3>주문목록</h3>
                </nav>

                <article>

                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>주문번호</th>
                            <th>상품명</th>
                            <th>판매가격</th>
                            <th>수량</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th>주문자</th>
                            <th>주문일</th>
                            <th>확인</th>
                        </tr>
                        <c:forEach var="order" items="${orders}" >
                        <tr>
                            <td><input type="checkbox" name=""/></td>
                            <td id ="orderNo">${order.orderNo }</td>
                            <td id ="pNo">${order.pName }</td>                            
                            <td id ="orderPrice">${order.orderPrice }</td>
                            <td id ="orderCount">${order.orderCount }</td>
                            <td id ="orderDelivery">${order.orderDelivery }</td>
                            <td id ="orderTotal">${order.orderTotal }</td>
                            <td id ="receiver">${order.receiver }</td>
                            <td id ="orderDate">${order.orderDate }</td>
                            <td><a href="#" value="${order}" class="showPopup">[상세확인]</a></td>
                        </tr>
                        </c:forEach>
                    </table>

                    <p>
                        <a href="#" class="orderDelete">선택삭제</a>                        
                    </p>
                    
                    <p class="paging">
                        <c:if test="${pageGroupStart>1 }">
                        <a href="${ctxPath }/admin/orderList.do?pg=${pageGroupStart-1}" class ="prev"><</a>
                        </c:if>
                        <c:forEach var="i" begin ="${pageGroupStart }" end="${pageGroupEnd }">
                        <a href="${ctxPath }/admin/orderList.do?pg=${i}" class="${currentPage==i?'on':'off' }">[${i}]</a>
                        </c:forEach>
                        <c:if test="${pageGroupEnd < lastPageNum }">
                        <a href="${ctxPath }/admin/orderList.do?pg=${pageGroupEnd+1}" class="next" >></a>
                        </c:if>
                    </p>
                </article>
            </section>
        </main>
        <footer>            
            <p>                
                Copyright(C)Farmstory All rights reserved. FARMSTORY ADMINISTRATOR Version 1.0.1
            </p>
        </footer>

        <div id="orderPopup">
            <section>
                <nav>
                    <h1>상세주문내역</h1>
                    <button class="btnClose">닫기</button>
                </nav>

                <article>  
                    <h3>기본정보</h3>
                    <table border="0">
                        <tr>
                            <td rowspan="7" class="thumb"><img src="./images//sample_item1.jpg" alt="사과 500g"></td>
                            <td>상품번호</td>
                            <td>order.orderNo</td>
                        </tr>
                        <tr>
                            <td>상품명</td>
                            <td class ="no" >사과 500g</td>
                        </tr>
                        <tr>
                            <td>판매가격</td>
                            <td class ="price" >4,000원</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td class="count" >2개</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td class="delivery">3,000원</td>
                        </tr>
                        <tr>
                            <td>합계</td>
                            <td class="total" >11,000원</td>
                        </tr>
                        <tr>
                            <td>주문자</td>
                            <td class="receiver">홍길동</td>
                        </tr>                        
                    </table>

                    <h3>배송지 정보</h3>
                    <table border="0">
                        <tr>
                            <td>받는분</td>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <td>배송지</td>
                            <td>부산광역시 부산진구 대연동 120 루미너스 10층</td>
                        </tr>
                    </table>
                </article>
            </section>
        </div>
    </div>
<%@ include file="./_footer.jsp" %>