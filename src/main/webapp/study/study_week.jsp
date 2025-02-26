<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/SELF_Port";
String USER = "root";
String PASSWORD = "1234";

// 세션에서 로그인한 사용자 ID 가져오기
String U_id = (String) session.getAttribute("U_id");
if (U_id == null) {
    response.sendRedirect("login_test.jsp");
    return;
}

// 회원의 기존 정보 가져오기
String S_time = "";
String S_week = "";
String S_todo = "";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    conn = DriverManager.getConnection(URL, USER, PASSWORD);
    

    // Mypage 테이블에서 정보 가져오기
    String studySql = "SELECT S_time, S_week, S_todo FROM Study WHERE U_id = ?";
    pstmt = conn.prepareStatement(studySql);
    pstmt.setString(1, U_id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
    	S_time = rs.getString("S_time");
    	S_week = rs.getString("S_week");
    	S_todo = rs.getString("S_todo");
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
<link rel="stylesheet" type="text/css" href="../css/css_Mypage.css">
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
                <label>시간</label>
                <input type="text" name="S_time" value="<%= S_time %>" required />
            </div>
            <div class="form-group">
                <label>요일</label>
                <input type="text" name="S_week" value="<%= S_week %>" required />
            </div>
            <div class="form-group">
                <label>할일</label>
                <input type="text" name="S_todo" value="<%= S_todo %>" required />
            </div>

            <button type="submit" class="btn">정보 입력하기</button>
        </form>
    </div>
</body>
</html>
