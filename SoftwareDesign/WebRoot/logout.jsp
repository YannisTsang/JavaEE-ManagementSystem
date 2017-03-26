<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%
	session.removeAttribute("user");
	response.sendRedirect("login.jsp");
	
%>
