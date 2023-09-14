<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <section id ="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="list">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="${cate eq '10'?'on':'off'}">
                                <a href="#">회원</a>
                            </li>
                            <li class="${cate eq '20'?'on':'off'}">
                                <a href="#">쿠폰/이벤트</a>
                            </li>
                            <li class="${cate eq '30'?'on':'off'}">
                                <a href="#">주문/결제</a>
                            </li>
                            <li class="${cate eq '40'?'on':'off'}">
                                <a href="#">배송</a>
                            </li>
                            <li class="${cate eq '50'?'on':'off'}">
                                <a href="#">취소/반품/교환</a>
                            </li>
                            <li class="${cate eq '60'?'on':'off'}">
                                <a href="#">여행/숙박/항공</a>
                            </li>
                            <li class="${cate eq '70'?'on':'off'}">
                                <a href="#">안전거래</a>
                            </li>
                        </ul>
                    </aside>
                    <article>
                    <c:choose>
                		<c:when test="${cate eq 10}">
	                        <nav>
	                            <h1>회원</h1>
	                            <h2>회원관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 20 }">
	                        <nav>
	                            <h1>쿠폰/이벤트</h1>
	                            <h2>쿠폰/이벤트 관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 30}">
	                        <nav>
	                            <h1>주문/결제</h1>
	                            <h2>주문/결제 관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 40 }">
	                        <nav>
	                            <h1>배송</h1>
	                            <h2>배송관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 50 }">
	                        <nav>
	                            <h1>취소/반품/교환</h1>
	                            <h2>취소/반품/교환 관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 60 }">
	                        <nav>
	                            <h1>여행/숙박/항공</h1>
	                            <h2>여행/숙박/항공 관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 70 }">
	                        <nav>
	                            <h1>안전거래</h1>
	                            <h2>안전거래 관련 문의 내용입니다.</h2>
	                        </nav>
	                    </c:when>    
                    </c:choose>    