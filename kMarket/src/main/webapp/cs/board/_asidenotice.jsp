<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

$(function(){

	$('.off ').click(function(e){
		${cate}
		
	});


});

</script>
        <section id ="cs">
            <div class="${group}">
                <nav>
                    <div>
                        <p>홈<span>></span>공지사항</p>
                    </div>
                </nav>
                <section class="${type}">
                    <aside>
                        <h2>공지사항</h2>
                        <ul>
                            <li class="${cate eq '0'?'on':'off'}" >
                                <a href="/kMarket/cs/board/list.do?group=notice&cate=0">전체</a>
                            </li>
                            <li class="${cate eq '1'?'on':'off'}" >
                                <a href="/kMarket/cs/board/list.do?group=notice&cate=1">고객서비스</a>
                            </li>
                            <li class="${cate eq '2'?'on':'off'}" >
                                <a href="/kMarket/cs/board/list.do?group=notice&cate=2">안전거래</a>
                            </li>
                            <li class="${cate eq '3'?'on':'off'}" >
                                <a href="/kMarket/cs/board/list.do?group=notice&cate=3">위해상품</a>
                            </li>
                            <li class="${cate eq '4'?'on':'off'}" >
                                <a href="/kMarket/cs/board/list.do?group=notice&cate=4">이벤트당첨</a>
                            </li>

                        </ul>
                    </aside>
                    <article>
                    <c:choose>
                    	<c:when test="${type eq 'list'}">
                		<c:choose>
                		<c:when test="${cate eq 0}">
	                        <nav>
	                            <h1>전체</h1>
	                            <h2>공지사항 전체 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 1 }">
	                        <nav>
	                            <h1>고객서비스</h1>
	                            <h2>고객서비스 전체 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 2 }">
	                        <nav>
	                            <h1>안전거래</h1>
	                            <h2>안전거래 전체 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 3 }">
	                        <nav>
	                            <h1>위해상품</h1>
	                            <h2>위해상품 전체 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    <c:when test ="${cate eq 4 }">
	                        <nav>
	                            <h1>이벤트상품</h1>
	                            <h2>이벤트상품 전체 내용입니다.</h2>
	                        </nav>
	                    </c:when>
	                    </c:choose>
	                    </c:when>    
                    </c:choose>    