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
    
    <title>离退清况</title>
    
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
  <center><h3> <font color="white">需要离退的情况</font></h3></center>
    <%
      request.setCharacterEncoding("GBK");
      String Eid=request.getParameter("Eid");
      Connection conn=jdbc_connection.getConn();
      Statement stmt=jdbc_connection.getStmt(conn);
      String sql="select * from employeeInfo where Eid="+Eid+"";
      ResultSet rs=jdbc_connection.getRs(stmt,sql);
    while(rs.next()){
   
    %>
      <form action="deploy3.jsp">
          <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
          <tr bgcolor="#a9987b">
            <td>人员ID</td>
            <td><input type="text" name="Eid" value="<%= rs.getString("Eid") %>"></td>
            <td>名字</td>
            <td><input type="text" name="name" value="<%= rs.getString("name") %>"></td>
          </tr>
          <tr>
            <td>性别</td>
            <td><input type="text" name="sex" value="<%= rs.getString("sex") %>"></td>
       
            <td>年龄</td>
            <td><input type="text" name="age" value="<%= rs.getString("age") %>"></td>
             </tr>
          <tr>
            <td>学历</td>
            <td><input type="text" name="educational" value="<%= rs.getString("educational") %>"></td>
            <td>部门</td>
            <td><input type="text" name="department" value="<%= rs.getString("department") %>"></td>
          </tr>
          <tr>
            <td>职位</td>
            <td><input type="text" name="position" value="<%= rs.getString("position") %>"></td>
            <td>在职状态</td>
          
            <td><input type="text" name="state" value="<%= rs.getString("state") %>"></td>
           </tr>
            <td><input type="submit" value="修改"></td>
            <td><input type="reset" value="重置"></td>
          </tr>
          </table>
      </form>
   <%
			
			}
    %>

 <%jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn); %>
  </body>
</html>
