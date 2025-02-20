<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<%
    // JDBC 드라이버 로드
    Class.forName("com.mysql.cj.jdbc.Driver");

    // DB 연결 정보
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String USER = "root"; // 본인의 DB 사용자명
    String PASSWORD = "1234"; // 본인의 DB 비밀번호

    // 폼 데이터 가져오기
    String U_id = request.getParameter("U_id");
    String U_email = request.getParameter("U_email");
    String U_pw = request.getParameter("U_pw");
    String U_pwck = request.getParameter("U_pwck");

    boolean isDuplicate = false; // 아이디 중복 여부 체크 변수

    // 아이디 중복 확인 및 "root" 계정 체크
    try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
         PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM user WHERE U_id = ?")) {

        checkStmt.setString(1, U_id);
        ResultSet rs = checkStmt.executeQuery();
        
        if (rs.next() && rs.getInt(1) > 0) {
            isDuplicate = true; // 이미 존재하는 아이디
        }
    } catch (SQLException e) {
        e.printStackTrace();
%>
        <script>
            alert("데이터베이스 오류가 발생했습니다.");
            history.back();
        </script>
<%
        return;
    }

    // 회원가입 조건 확인
    if (U_id == null || U_email == null || U_pw == null || U_pwck == null || !U_pw.equals(U_pwck)) {
%>
        <script>
            alert("입력값이 유효하지 않거나 비밀번호가 일치하지 않습니다.");
            history.back();
        </script>
<%
    } else if ("root".equals(U_id)) { // "root" 아이디 입력 시 차단
%>
        <script>
            alert("관리자 계정입니다. 회원가입이 불가능합니다.");
            history.back();
        </script>
<%
    } else if (isDuplicate) { // 아이디 중복 시 차단
%>
        <script>
            alert("이미 사용중인 아이디입니다.");
            history.back();
        </script>
<%
    } else {
        // 회원가입 진행
        String sql = "INSERT INTO user (U_id, U_email, U_pw, U_pwck) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, U_id);
            pstmt.setString(2, U_email);
            pstmt.setString(3, U_pw);
            pstmt.setString(4, U_pwck);

            int result = pstmt.executeUpdate();

            if (result > 0) {
%>
                <script>
                    alert("회원가입이 완료되었습니다.");
                    window.location.href = "index.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
                    history.back();
                </script>
<%
            }
        } catch (SQLException e) {
            e.printStackTrace();
%>
            <script>
                alert("데이터베이스 오류가 발생했습니다.");
                history.back();
            </script>
<%
        }
    }
%>
</body>
</html>
