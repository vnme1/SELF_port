<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String USER = "root";
String PASSWORD = "1234";

// 세션에서 로그인한 사용자 ID 가져오기
String U_id = (String) session.getAttribute("U_id");
if (U_id == null) {
    response.sendRedirect("login_test.jsp");
    return;
}

// 회원의 기존 정보 가져오기
String U_email = "이메일 정보 없음";
String M_job = "";
String M_skill = "";
String M_hobby = "";
String M_number = "";
String M_github = "";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    conn = DriverManager.getConnection(URL, USER, PASSWORD);
    
    // user 테이블에서 이메일 가져오기
    String userSql = "SELECT U_email FROM user WHERE U_id = ?";
    pstmt = conn.prepareStatement(userSql);
    pstmt.setString(1, U_id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        U_email = rs.getString("U_email");
    }

    // Mypage 테이블에서 정보 가져오기
    String mypageSql = "SELECT M_job, M_skill, M_hobby, M_number, M_github FROM Mypage WHERE U_id = ?";
    pstmt = conn.prepareStatement(mypageSql);
    pstmt.setString(1, U_id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        M_job = rs.getString("M_job");
        M_skill = rs.getString("M_skill");
        M_hobby = rs.getString("M_hobby");
        M_number = rs.getString("M_number");
        M_github = rs.getString("M_github");
    }

} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
        max-width: 360px;
        padding: 20px;
        border-radius: 10px;
        border: 1px solid #ccc;
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
        margin-bottom: 15px;
    }
    label {
        font-size: 14px;
        color: #666;
        margin-bottom: 5px;
    }
    input {
        width: calc(100% - 20px);
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
    }
    .btn:hover {
        background: #666;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>마이페이지</h2>
        <form action="Mypage_Process.jsp" method="post">
            <div class="form-group">
                <label>아이디</label>
                <input type="text" name="U_id" value="<%= U_id %>" readonly />
            </div>
            <div class="form-group">
                <label>이메일</label>
                <input type="text" name="U_email" value="<%= U_email %>" required />
            </div>
            <div class="form-group">
                <label>내 직업</label>
                <input type="text" name="M_job" value="<%= M_job %>" required />
            </div>
            <div class="form-group">
                <label>좋아하는 기술</label>
                <input type="text" name="M_skill" value="<%= M_skill %>" required />
            </div>
            <div class="form-group">
                <label>취미</label>
                <input type="text" name="M_hobby" value="<%= M_hobby %>" required />
            </div>
            <div class="form-group">
                <label>📞 전화번호</label>
                <input type="text" name="M_number" value="<%= M_number %>" required />
            </div>
            <div class="form-group">
                <label>gitHub 주소</label>
                <input type="text" name="M_github" value="<%= M_github %>" required />
            </div>
            <button type="submit" class="btn">정보 입력하기</button>
        </form>
    </div>
</body>
</html>
