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
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String USER = "root"; // 본인의 DB 사용자명
    String PASSWORD = "1234"; // 본인의 DB 비밀번호

    // 폼 데이터 가져오기
    String U_id = request.getParameter("U_id");
    String M_job = request.getParameter("M_job");
    String M_skill = request.getParameter("M_skill");
    String M_hobby = request.getParameter("M_hobby");
    String M_number = request.getParameter("M_number"); // 기존 M_phone → M_number
    String M_github = request.getParameter("M_github");

    // NULL 및 빈 값 체크
    if (U_id == null || U_id.trim().isEmpty()) {
%>
        <script>
            alert("아이디가 존재하지 않습니다. 다시 로그인 해주세요.");
            window.location.href = "login_test.jsp";
        </script>
<%
    } else {
        // NULL 값 방지 (NULL 값이 들어오면 빈 문자열로 저장)
        M_job = (M_job == null) ? "" : M_job;
        M_skill = (M_skill == null) ? "" : M_skill;
        M_hobby = (M_hobby == null) ? "" : M_hobby;
        M_number = (M_number == null) ? "" : M_number;
        M_github = (M_github == null) ? "" : M_github;

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
                String updateSql = "UPDATE Mypage SET M_job = ?, M_skill = ?, M_hobby = ?, M_number = ?, M_github = ? WHERE U_id = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setString(1, M_job);
                pstmt.setString(2, M_skill);
                pstmt.setString(3, M_hobby);
                pstmt.setString(4, M_number);
                pstmt.setString(5, M_github);
                pstmt.setString(6, U_id);
                pstmt.executeUpdate();
            } else {
                // INSERT 문 실행
                String insertSql = "INSERT INTO Mypage (U_id, M_job, M_skill, M_hobby, M_number, M_github) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, U_id);
                pstmt.setString(2, M_job);
                pstmt.setString(3, M_skill);
                pstmt.setString(4, M_hobby);
                pstmt.setString(5, M_number);
                pstmt.setString(6, M_github);
                pstmt.executeUpdate();
            }
%>
            <script>
                alert("정보가 성공적으로 저장되었습니다.");
                window.location.href = "main_page.jsp";
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
