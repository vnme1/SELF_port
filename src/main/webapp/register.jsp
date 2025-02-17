<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background: #ffffff;
    width: 90%;
    max-width: 360px; /* 🔹 최대 너비 축소하여 균형 조정 */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
    font-size: 22px;
}

.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px; /* 🔹 입력 필드 간격 증가 */
}

label {
    font-size: 14px;
    color: #666;
    margin-bottom: 5px;
}

input {
    width: calc(100% - 20px); /* 🔹 입력 필드 좌우 여백 추가 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

.btn {
    width: 100%;
    padding: 12px;
    background: #888;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px; /* 🔹 버튼과 입력 필드 간격 추가 */
}

.btn:hover {
    background: #666;
}
    
</style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="register_process.jsp" method="post">
            <!-- 🔹[수정됨] input과 label을 그룹화하여 정렬 문제 해결 -->
            <div class="form-group">  
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required />
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required />
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required />
            </div>

            <div class="form-group">
                <label for="confirm_password">비밀번호 확인</label>
                <input type="password" id="confirm_password" name="confirm_password" required />
            </div>

            <button type="submit" class="btn">가입하기</button>
        </form>
    </div>
</body>
</html>
