<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>调配修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <% 
    request.setCharacterEncoding("GBK");
    String deparment=request.getParameter("deparment");
    session.setAttribute("deparment",deparment); 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
  	String sql="select * from employeeinfo where Eid="+Eid+"";
  	 ResultSet rs=jdbc_connection.getRs(stmt,sql);
    while(rs.next()){
    %>
  	
  	<h2> <font color="white">请选择调配该员工所到的部门</font><h2></h2>
  	<form method="post" action="deploy4.jsp">
          <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
          <tr bgcolor="#a9987b">
            <td>员工ID</td>
            <td><input type="text" name="Eid" value="<%= rs.getString("Eid") %>"></td>
            <td>部门</td>
            <td><input type="text" name="department" value="<%= rs.getString("department") %>"></td>
            <td>职位</td>
            <td><input type="text" name="position" value="<%= rs.getString("position") %>"></td>
          </tr>
            </table>
    <input type="submit" value="调配"></h3>
  </form>
	 <%
			
			}
    %>

 <%jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn); %>
  </body>
</html>
