<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <script>
        $(function(){

            $('.showPopup').click(function(e){
                e.preventDefault();
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
                    <li><a href="/Farmstory2/admin/productList.do">상품관리</a></li>
                    <li class="on" ><a href="/Farmstory2/admin/orderList.do">주문관리</a></li>
                    <li><a href="/Farmstory2/admin/userList.do">회원관리</a></li>                    
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
                        <tr>
                            <td><input type="checkbox" name=""/></td>
                            <td>1001</td>
                            <td>사과 500g</td>                            
                            <td>4,000원</td>
                            <td>2</td>
                            <td>3,000원</td>
                            <td>11,000원</td>
                            <td>김유신</td>
                            <td>2023-01-01 13:06:14</td>
                            <td><a href="#" class="showPopup">[상세확인]</a></td>
                        </tr>
                    </table>

                    <p>
                        <a href="#" class="orderDelete">선택삭제</a>                        
                    </p>
                    
                    <p class="paging">
                        <a href="#"><</a>
                        <a href="#" class="on">[1]</a>
                        <a href="#">[2]</a>
                        <a href="#">[3]</a>
                        <a href="#">[4]</a>
                        <a href="#">[5]</a>
                        <a href="#">></a>
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
                            <td>1011</td>
                        </tr>
                        <tr>
                            <td>상품명</td>
                            <td>사과 500g</td>
                        </tr>
                        <tr>
                            <td>판매가격</td>
                            <td>4,000원</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>2개</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>3,000원</td>
                        </tr>
                        <tr>
                            <td>합계</td>
                            <td>11,000원</td>
                        </tr>
                        <tr>
                            <td>주문자</td>
                            <td>홍길동</td>
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