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
    <title>角色查找</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <% 
       request.setCharacterEncoding("GBK");	
       String id=request.getParameter("rolelookup");
       String str=request.getParameter("select1");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from role_table where "+str+"='"+id+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
     <form  action="rolelookup.jsp"/><font color="white">
    <h3>按照<% out.println(str);%>查找:<input type="text" name="rolelookup"></font>
    <input type="submit" value="查找"></h3>
  </form>
  <font color="white">
    <br>
       <h3>符合条件的角色信息</h3><hr></font>
    <br>
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
     if(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("role")+"</td>");
				out.println("<td>"+rs.getString("files")+"</td>");
				out.println("<td>"+rs.getString("education")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("deploy")+"</td>");
		%>
		       <td><a href="role_update.jsp?id=<%=rs.getString("id")%>">修改</a> <a href="role_delete?id=<%=rs.getString("id")%>">删除</a></td>
		 <% out.println("</tr>");
       }else{
       out.println("<h4>WRONG！</h4>");
       }
    
     %>
      </table>
      
      <%
       jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
       %>
       
       <br>
        <br>
        <h3><a href="mainMessage.html"> <font color="white">返回主页面</font></a></h3>
  </body>
</html>
