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
    <title>My JSP 'class_delete.jsp' starting page</title>
    
	
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <%
      request.setCharacterEncoding("GBK");
      String state=request.getParameter("state");
      String trainNum=request.getParameter("trainNum");
      String state1="false";
      Connection conn=jdbc_connection.getConn();
      Statement stmt=jdbc_connection.getStmt(conn);
      stmt.execute("update train_record set state='"+state1+"' where trainNum='"+trainNum+"' ");
      ResultSet rs=stmt.executeQuery("select * from train where trainNum='"+trainNum+"' ");
     %>
     
      <br>
     <h3><font color="white">退课成功！！！</font></h3>
   <br>
  
   <%
      jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);   
    %>
     <h3><a href="trainManager/train_recordshow.jsp"><font color="white">返回我的课程纪录页面</font></a></h3>
  </body>
</html>
