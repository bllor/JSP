<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                000님 반갑습니다.
                <a href="#" class="logout">[로그아웃]</a>
            </p>
        </header>
        <main>
            <section class="modify">
                <h3>글수정</h3>
                <article>
                    <form action="#">
                        <table>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력하시오."></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="file" name="file" ></td>
                            </tr>
                        </table>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="수정완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>
        <footer>
            <p>Ω최동일.com</p>
        </footer>
    </div>
</body>
</html>