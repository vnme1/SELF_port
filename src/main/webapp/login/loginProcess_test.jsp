<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String U_id = request.getParameter("U_id");
String U_pw = request.getParameter("U_pw");
String R_id = request.getParameter("R_id");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//SQL 쿼리 (empno가 ID, ename이 비밀번호)

		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SELF_Port","root","1234");
		
		String sql = "SELECT * FROM user WHERE U_id = ? AND U_pw = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, U_id); 
	    pstmt.setString(2, U_pw);
		
	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	        session.setAttribute("U_id", U_id);
	        session.setAttribute("U_pw", U_pw);
	        Cookie L_Cookie = new Cookie("R_id",U_id);
	        response.addCookie(L_Cookie);
	        //아이디 기억 체크한 경우
	        if(R_id != null){
	        	Cookie R_Cookie = new Cookie("R_Cookie", U_id);
	        	R_Cookie.setMaxAge(60*60*24*30);
	        	response.addCookie(R_Cookie);
	        }else {
	        	Cookie R_Cookie = new Cookie("R_id","");
	        	R_Cookie.setMaxAge(0); //쿠키삭제
	        	response.addCookie(R_Cookie);
	        }
	        %>
	        <script>
	            alert("로그인 성공");
	            history.back();
	        </script>
	<%
	        response.sendRedirect("../main_page.jsp");
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