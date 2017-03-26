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
    <title>员工信息</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <form  action="lookupID.jsp" method="post">
    <h3><select name="select">
           <option value="Eid">按员工ID查找</option>
           <option value="name">按姓名查找</option>
           <option value="age">按年龄查找</option>
           <option value="educational">按学历查找</option>
           <option value="department">按部门查找</option>
           <option value="positionposition">按职位查找</option>
           <option value="state">按在职状态查找</option>
        </select>
    <input type="text" name="lookupID">
   
    <input type="submit" value="查找"></h3>
  </form>
  
  
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
            <td>人员ID</td>
            <td>名字</td>
            <td>性别</td>
            <td>年龄</td>
            <td>学历</td>
            <td>部门</td>
            <td>职位</td>
            <td>在职状态</td>
            <td>操作</td>
       </tr>
       <%
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from employeeinfo";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
             out.println("<tr>");
				out.println("<td>"+rs.getString("Eid")+"</td>");
				out.println("<td>"+rs.getString("name")+"</td>");
				out.println("<td>"+rs.getString("sex")+"</td>");
				out.println("<td>"+rs.getString("age")+"</td>");
				out.println("<td>"+rs.getString("educational")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				out.println("<td>"+rs.getString("position")+"</td>");
				out.println("<td>"+rs.getString("state")+"</td>");
		%>
		       <td><a href="deploy.jsp?Eid=<%=rs.getString("Eid")%>">离退</a> <a href="deploy2.jsp?Eid=<%=rs.getString("Eid")%>&&deparment=<%=rs.getString("department")%>">调配</a></td>
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
    <form action="filePro/employee_add.jsp">
     <input type="submit" value="添加">
     </form>
     <br><br><br>
     <center><a href="mainMessage.html"> <font color="white">返回主页面</font></a></center>
  </body>
</html>
