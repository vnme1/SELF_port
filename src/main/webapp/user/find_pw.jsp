<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from user";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/css_find.css">
    <title>로그인</title>
    
</head>
<body>
    <div class="login-container">
        <h2>비밀번호 찾기</h2>
        <form action="findProcess_pw.jsp" method="post">
            <div class="form-group">
                <label for="id">등록한 아이디를 입력해주세요.</label>
                <input type="text" id="F_id" name="F_id" required>
            </div>
            <div class="form-group">
                <label for="email">등록한 이메일을 입력해주세요.</label>
                <input type="text" id="F_email" name="F_email" required>
            </div>
            <button type="submit">확인</button>   
            <a href="find_pw.jsp">비밀번호 찾기</a>       
            <a href="register.jsp">회원가입</a>   
        </form>
    </div>
</body>
</html> 