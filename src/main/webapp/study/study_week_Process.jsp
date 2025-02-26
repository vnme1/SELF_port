<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보입력하기</title>
</head>
<body>
<%
    // JDBC 드라이버 로드
    Class.forName("com.mysql.cj.jdbc.Driver");

	request.setCharacterEncoding("UTF-8");
    // DB 연결 정보
    String URL = "jdbc:mysql://localhost:3306/SELF_Port";
    String USER = "root"; // 본인의 DB 사용자명
    String PASSWORD = "1234"; // 본인의 DB 비밀번호

    // 폼 데이터 가져오기
    String U_id = request.getParameter("U_id");
    String S_time = request.getParameter("S_time");
    String S_week = request.getParameter("S_week");
    String S_todo = request.getParameter("S_todo");

    // NULL 및 빈 값 체크
    if (U_id == null || U_id.trim().isEmpty()) {
%>
        <script>
            alert("아이디가 존재하지 않습니다. 다시 로그인 해주세요.");
            window.location.href = "../login/login_test.jsp";
        </script>
<%
    } else {
        // NULL 값 방지 (NULL 값이 들어오면 빈 문자열로 저장)
        S_time = (S_time == null) ? "" : S_time;
        S_week = (S_week == null) ? "" : S_week;
        S_todo = (S_todo == null) ? "" : S_todo;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // 해당 사용자가 Mypage 테이블에 존재하는지 확인
            String checkSql = "SELECT COUNT(*) FROM Mypage WHERE U_id = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, U_id);
            rs = pstmt.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            pstmt.close();

            // 이미 존재하는 경우 UPDATE, 존재하지 않으면 INSERT
            if (count > 0) {
                // UPDATE 문 실행
                String updateSql = "UPDATE Mypage SET S_time = ?, S_week = ?, S_todo = ? WHERE U_id = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setString(1, S_time);
                pstmt.setString(2, S_week);
                pstmt.setString(3, S_todo);
                pstmt.setString(4, U_id);
                pstmt.executeUpdate();
            } else {
                // INSERT 문 실행
                String insertSql = "INSERT INTO Mypage (U_id, S_time, S_week, S_todo) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, U_id);
                pstmt.setString(2, S_time);
                pstmt.setString(3, S_week);
                pstmt.setString(4, S_todo);
                pstmt.executeUpdate();
            }
%>
            <script>
                alert("정보가 성공적으로 저장되었습니다.");
                window.location.href = "../main_page.jsp";
            </script>
<%
        } catch (SQLException e) {
            e.printStackTrace();
%>
            <script>
                alert("데이터베이스 오류가 발생했습니다.");
                history.back();
            </script>
<%
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
