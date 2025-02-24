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
    <title>로그인</title>
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
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
    		box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background: #ffffff;
        }
        .form-group {
            margin-bottom: 15px;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px); /* 🔹 입력 필드 좌우 여백 추가 */
		    padding: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 14px;
            margin-top: 5px;
        }
        button {
            width: 100%;
            padding: 12px;
    		background: #888;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 5px;
        }
        label {
		    font-size: 14px;
		    color: #666;
		    margin-bottom: 2px;
		}
		h2 {
		    text-align: center;
		    color: #333;
		    font-size: 22px;
		}
		p {
		    color: #333;
		    font-size: 10px;
		}
		a {
			text-align: center;
			font-size: 10px;
			color: #333;
			margin-top: 5px;
			display: flex;
			justify-content: center;
		}
        .button:hover {
		    background: #666;
		}
    </style>
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
            <a href="find_id.jsp">아이디 / 비밀번호 찾기</a>
            <a href="register.jsp">회원가입을 하시겠습니까?</a>
        </form>
    </div>
</body>
</html> 