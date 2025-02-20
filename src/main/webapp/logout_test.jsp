<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 무효화
	session.invalidate();
	response.sendRedirect("login_test.jsp");

%>