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
    <title>角色删除</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <% 
  request.setCharacterEncoding("GBK");
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String id=request.getParameter("id");
    String sql="delete from role_table where id="+id+"";
    //select count(*) from role_table
    int x=stmt.executeUpdate(sql);
    %>
    <font color="white">
    <% 
    if(x==1){
         out.println("<center><br><br><h3>删除成功！</h3></center>");
    }else{
         out.println("<center><br><br><h3>删除失败！</h3></center>");
    }
   %>
   </font>
 	<center><a href="role.jsp"> <font color="white">返回角色管理</font></a></center>
   <%
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
    %>
  </body>
</html>