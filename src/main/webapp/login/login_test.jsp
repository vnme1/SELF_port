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
    <link rel="stylesheet" type="text/css" href="../css/css_login.css">
    <title>로그인</title>
    
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="loginProcess_test.jsp" method="post">
            <div class="form-group">
                <label for="userid">아이디:</label>
                <input type="text" id="U_id" name="U_id" required>
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="U_pw" name="U_pw" required>
            </div>
            <p>
            	<input type="checkbox" name="R_id"> 아이디 기억하기
        	</p>
            
            <button type="submit">로그인</button>
            <a href="../user/find_id.jsp">아이디 / 비밀번호 찾기</a>
            <a href="../user/register.jsp">회원가입을 하시겠습니까?</a>
        </form>
    </div>
</body>
</html> 