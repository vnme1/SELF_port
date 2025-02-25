<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 📌 외부 CSS 파일 연결 -->
<link rel="stylesheet" type="text/css" href="../css/css_register.css">
<title>회원가입</title>

</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="input_register.jsp" method="get">
            <!-- 🔹[수정됨] input과 label을 그룹화하여 정렬 문제 해결 -->
            <div class="form-group">  
                <label for="name">아이디</label>
                <input type="text" id="U_id" name="U_id" required />
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="U_email" name="U_email" required />
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="U_pw" name="U_pw" required />
            </div>

            <div class="form-group">
                <label for="confirm_password">비밀번호 확인</label>
                <input type="password" id="U_pwck" name="U_pwck" required />
            </div>

            <button type="submit" class="btn">가입하기</button>
        </form>
    </div>

</body>
</html>
