<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="../_header.jsp" %>
<script>
	$(function(){
		$('.more').click(function(e){
			e.preventDefault();
			$(this).closest('ul').find('li:hidden').show();			
		});
		
	});
</script>
        <section id="cs">
            <div class="faq">
                <nav>
                  <div>
                    <p>홈<span>></span>자주묻는 질문</p>
                  </div>  
                </nav>
                <section class="list">
                    <aside>
                        <h2>자주묻는 질문</h2>
                        <ul>
                            <li class="on">
                                <a href="#">회원</a>
                            </li>
                            <li>
                                <a href="#">쿠폰/이벤트</a>
                            </li>
                            <li>
                                <a href="#">주문/결제</a>
                            </li>
                            <li>
                                <a href="#">배송</a>
                            </li>
                            <li>
                                <a href="#">취소/반품/교환</a>
                            </li>
                            <li>
                                <a href="#">여행/숙박/항공</a>
                            </li>
                            <li>
                                <a href="#">안전거래</a>
                            </li>
                        </ul>
                    </aside>
                    <article>
                        <nav>
                            <h1>회원</h1>
                            <h2>가장 많이 묻는 질문</h2>
                        </nav>
                        <div>
                            <h3>가입</h3>
                            <ul>
                                <li>
                                    <a href="./view.html">
                                        <span>Q.</span>
                                        [view연결]가입1
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        가입2
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        가입3
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        가입4
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        가입5
                                    </a>
                                </li>
                                <li class="more">
                                    <a href="#">더보기</a>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h3>탈퇴</h3>
                            <ul>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        탈퇴1
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        탈퇴2
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        탈퇴3
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        탈퇴4
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        탈퇴5
                                    </a>
                                </li>
                                <li class="more">
                                    <a href="#">더보기</a>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h3>회원정보</h3>
                            <ul>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        회원1
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        회원2
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        회원3
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        회원4
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        회원5
                                    </a>
                                </li>
                                <li class="more">
                                    <a href="#">더보기</a>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h3>로그인</h3>
                            <ul>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        로그인1
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        로그인2
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        로그인3
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        로그인4
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Q.</span>
                                        로그인5
                                    </a>
                                </li>
                                <li class="more">
                                    <a href="#">더보기</a>
                                </li>
                            </ul>
                        </div>
                    </article>
                </section>
            </div>
        </section>
<%@include file ="../_footer.jsp" %>