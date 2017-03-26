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
    <title>角色更新</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <% 
     request.setCharacterEncoding("gbk");
     String files=request.getParameter("files");
     String education=request.getParameter("education");
     String department=request.getParameter("department");
     String deploy=request.getParameter("deploy");
      String id=request.getParameter("id");
     Connection conn=jdbc_connection.getConn();
     Statement stmt=jdbc_connection.getStmt(conn);
     stmt.execute("update role_table set files='"+files+"',education='"+education+"',department='"+department+"',deploy='"+deploy+"' where id="+id+" ");
     ResultSet rs=stmt.executeQuery("select * from role_table where id="+id);
   %>
   <font color="white">
   <br>
     <h3>修改成功！！！</h3>
   <br>
   
     <h3>修改后信息为：</h3>
     <br>
     <br>
     <br>
      </font>
   <table bgcolor="grey" border=1 width=1000>
        <tr bgcolor="#a9987b">
            <td>角色名</td>
            <td>个人档案</td>
            <td>教育培训</td>
            <td>部门管理</td>
            <td>人事调配</td>
            <td>操作</td>
       </tr>
       <%
           try{
             while(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("role")+"</td>");
				out.println("<td>"+rs.getString("files")+"</td>");
				out.println("<td>"+rs.getString("education")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("deploy")+"</td>");
		%>
		       <td><a href="role_update.jsp?id=<%=rs.getString("id")%>">修改</a> <a href="role_delete.jsp?id=<%=rs.getString("id")%>">删除</a></td>
		<% 
		        
				out.println("</tr>");
             }
           }catch(SQLException e){
           e.printStackTrace();
           }finally{
		jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
		}
        %>
        
    </table>
     <br><br><br>
     <center><a href="role.jsp"> <font color="white">返回角色管理</font></a></center>
  </body>
</html>
