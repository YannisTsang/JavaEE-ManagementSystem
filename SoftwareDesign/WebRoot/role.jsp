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
    <title>角色管理</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg"><font color="white">
  <h2>当前位置：系统管理》角色管理</h2></font>
  <form  action="rolelookup.jsp" method="post">
    <h3><select name="select1">
           <option value="role">按角色名查找</option>
           <option value="files">按个人档案查找</option>
           <option value="education">按教育培训查找</option>
           <option value="department">按部门管理查找</option>
           <option value="deploy">按人事调配查找</option>
           
        </select>
    <input type="text" name="rolelookup">
   
    <input type="submit" value="查找"></h3>
  </form>
  
  
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
       
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from role_table";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("role")+"</td>");
				out.println("<td>"+rs.getString("files")+"</td>");
				out.println("<td>"+rs.getString("education")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("deploy")+"</td>");
		%>
		       <td><a href="role_update.jsp?id=<%=rs.getString("id")%>">修改</a> <a href="role_delete?id=<%=rs.getString("id")%>">删除</a></td>
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
     <center><a href="mainMessage.html"> <font color="white">返回主页面</font></a></center>
     
  </body>
</html>
