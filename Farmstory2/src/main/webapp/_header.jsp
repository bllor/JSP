<%@page import="kr.co.farmstory2.dto.UserDTO"%>
<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 개발/배포에서 ContextPath 포함 여부에 따른 동적처리 -->
<c:set var="ctxPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="${ctxPath }/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
       
    <script>
        $(function(){
            $('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });

            $('#tabs').tabs();
        });
    </script>

</head>
<body>
    <div id="container">
        <header>
            <a href="${ctxPath }" class="logo"><img src="${ctxPath}/images/logo.png" alt="로고"/></a>
            <p>
            	<c:choose>
            	<c:when test ="${sessUser==null }">
            	<a href="${ctxPath}/index.do">HOME |</a>
                <a href="${ctxPath}/user/login.do">로그인 |</a>
                <a href="${ctxPath}/user/terms.do">회원가입 |</a>
                <a href="${ctxPath}/admin/index.do">관리자 |</a>
                <a href="#">고객센터</a>
                </c:when>
                <c:otherwise>
                <a href="${ctxPath}/index.do">HOME |</a>
                <a href="${ctxPath}/user/logOut.do">로그아웃 |</a>
                <c:if test="${sessUser.role ne 'USER'}">
                <a href="${ctxPath}/admin/index.do">관리자 |</a>
                </c:if>
                <a href="#">고객센터</a> 
                </c:otherwise>
                </c:choose>
            </p>
            <img src="${ctxPath}/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="${ctxPath}/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="${ctxPath}/market/list.do"><img src="${ctxPath}/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Event&cate=event">이벤트</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>
        <main>