<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>file_delete page</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
     <% 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
    String sql="delete from fileInfo where Eid="+Eid+"";
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
   <center><a href="filePro/file_document.jsp"><font color="white">返回个人档案页面</font></a></center>
   <%
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
    %>
  </body>
</html>
