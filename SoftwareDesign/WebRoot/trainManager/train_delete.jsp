<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
   <base href="<%=basePath%>">
    
    <title>My JSP 'train_delete.jsp' starting page</title>
    
	
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <%
      Connection conn=jdbc_connection.getConn();
      Statement stmt=jdbc_connection.getStmt(conn);
      String trainNum=request.getParameter("trainNum");
      String sql="delete from train where trainNum='"+trainNum+"'";
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
   <center><a href="trainManager/trainType.jsp"><font color="white">返回课程信息页面</font></a></center>
   <%
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);
    %>
     
  </body>
</html>
