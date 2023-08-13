<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section id="user" class="register">
                <form action="#" method ="post">
                    <table border="1">
                        <caption>사이트 이용정보 입력</caption>
                        <tbody>
                            <tr>
                                <td>아이디</td>
                                <td>
                                    <input type="text" name = "uid" placeholder="아이디 입력" >
                                    <button>
                                        <img src="../images/chk_id.gif" alt="아이디">
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td>
                                    <input type="password" name="pass" placeholder="비밀번호 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호확인</td>
                                <td>
                                    <input type="password" name="pass" placeholder="비밀번호 입력">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                                <input type="text" name="nick" placeholder="별명 입력">
                                <span class="resultNick"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>E-mail</td>
                            <td>
                                <input type="text" name="email" placeholder="이메일 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호", readonly>
                                    <button class="btnZip"><img src="../images/chk_post.gif" alt=""></button>
                                </div>
                                <div>
                                    <input type="text" name="addr1" placeholder="주소를 검색하시오", readonly>
                                </div>
                                <div>
                                    <input type="text" name="addr2" placeholder="상세주소를 입력하시오">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard1/user/login.jsp" class="btnCancel">취소</a>
                        <input type="submit"   class="btnSubmit" value="회원가입"/>
                    </div>    
                </form>
            </section>
        </main>
        <footer>
            <p>Ω최동일.com</p>
        </footer>        
    </div>
</body>
</html>