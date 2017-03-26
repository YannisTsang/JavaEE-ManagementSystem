<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    <title>'loginUpdatePwd1.jsp' starting page</title>
    
	

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <%
     request.setCharacterEncoding("GBK");
     String userName=request.getParameter("userName");
     String newpassword=request.getParameter("password");
     Connection conn=jdbc_connection.getConn();
     Statement stmt=jdbc_connection.getStmt(conn);
     stmt.execute("update employee1 set password='"+newpassword+"' where userName="+"userName");
     ResultSet rs=stmt.executeQuery("select * from employee1 where userName="+"userName");
     %>
     <font color="white">
     <br>
     <h3>修改成功！！！</h3>
   <br></font>
   <%
      jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
    %>
    <center><a href="mainMessage.html"> <font color="white">返回主页面</font></a></center>
  </body>
</html>
