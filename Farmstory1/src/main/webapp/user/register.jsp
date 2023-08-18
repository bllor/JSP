<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
 <link rel="stylesheet" href="../css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/Farmstory1/js/zipcode.js"></script>
	<script src ="/Farmstory1/js/validation.js"></script>
	<script src="/Farmstory1/js/checkUser.js"></script>
        <div id="user">
            <section id="user" class="register">
            <form  id ="formUser" action="/Farmstory1/user/registerProc.jsp" method="post">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tbody>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button" id ="btnCheckUid"> 
                                    <img src="../images/chk_id.gif" alt="아이디">
                                </button>
                                <span class="resultId"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass1" placeholder="비밀번호 입력"/>
                            </td> 
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                                <span class="resultPass"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table border="1">
                    <caption>개인정보입력</caption>
                    <tbody>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>
                                <span class="resultName"></span>
                            </td>
                        </tr>  
                        <tr>
                            <td>별명</td>
                            <td>
                                <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <span class="resultNick"></span>
                            </td>
                        </tr> 
                        <tr>
                            <td>E-Mail</td>
                            <td>
                                <input type="text" name="email" placeholder="이메일 입력"/>
                                <span id="resultEmail"></span>
                            </td>
                        </tr> 
                        <tr>
                            <td>휴대폰</td>
                            <td>
 								<input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13"/>                           
                                <span id="resultHp"></span>
                                <%--<input type="text" name="hp" placeholder="-포함 13자리 입력" minlength="13" maxlength="13"/> --%>
                            </td>
                        </tr> 
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호" readonly/>
                                    <!-- type button을 할경우 제출되지 않음 -->    
                                    <button type = "button" class="btnZip" onclick ="zipcode()"><img src="../images/chk_post.gif" alt=""></button>
                                </div>
                                <div>
                                    <input type="text" name="addr1" placeholder="주소를 검색하시오." readonly/>
                                </div>
                                <div>
                                    <input type="text" name="addr2" placeholder="상세주소를 입력하시오."/>
                                </div>
                            </td>
                        </tr> 
                    </tbody>
                </table>
                <div>
                 <a href="/Farmstory1/user/login.jsp" class="btnCancel">취소</a>
                 <input type="submit"   class="btnSubmit" value="회원가입"/>
                 </div>
            </form>
          </section>
        </div>
 
<%@ include file="../_footer.jsp" %>
