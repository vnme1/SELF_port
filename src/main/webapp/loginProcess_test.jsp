<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String U_id = request.getParameter("U_id");
String U_pw = request.getParameter("U_pw");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//SQL 쿼리 (empno가 ID, ename이 비밀번호)

		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring5fs","root","1234");
		
		String sql = "SELECT * FROM user WHERE U_id = ? AND U_pw = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, U_id); 
	    pstmt.setString(2, U_pw);
		
	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	        session.setAttribute("U_id", U_id);
	        session.setAttribute("U_pw", U_pw);
	        %>
	        <script>
	            alert("로그인 성공");
	            history.back();
	        </script>
	<%
	        response.sendRedirect("main_page.jsp");
	    } else {
	        out.println("로그인 실패");
	%>
	        <script>
	            alert("아이디 또는 비밀번호가 올바르지 않습니다.");
	            history.back();
	        </script>
	<%
	    }
	}catch(Exception e) {
		e.printStackTrace();
	}
%>