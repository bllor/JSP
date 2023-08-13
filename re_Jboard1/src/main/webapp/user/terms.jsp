<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div id="container">
        <h3>Board System v 1.0</h3>
        <main>
            <section class="terms">
                <table border="1">
                    <caption>이용약관</caption>
                    <tbody>
                        <tr>
                            <td>
                                <textarea readonly>이용약관</textarea>
                                <p>
                                    <label>
                                        <input type="checkbox" name="chk1">동의합니다.
                                    </label>
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table border="1">
                    <caption>개인정보 취급방침</caption>
                    <tbody>
                        <tr>
                            <td>
                                <textarea readonly>약관내용</textarea>
                                <p>
                                    <label>
                                        <input type="checkbox" name="chk2">동의합니다.
                                    </label>
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <a href="./login.html" class="btnCancel">취소</a>
                    <a href="./register.html" class="btnNext">다음</a>
                </div>
            </section>
        </main>
        <footer>
            <p>Ω최동일.com</p>
        </footer>
    </div>
</body>
</html>