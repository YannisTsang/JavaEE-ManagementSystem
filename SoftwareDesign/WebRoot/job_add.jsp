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
    <title>部门管理</title>
    

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <font color="white"><center><h3>修改该员工的职务</h3></center></font>
    <%
      request.setCharacterEncoding("GBK");
      String Eid=request.getParameter("Eid");
      Connection conn=jdbc_connection.getConn();
      Statement stmt=jdbc_connection.getStmt(conn);
      String sql="select * from employeeinfo where Eid="+Eid+"";
      ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
      <form action="job_update.jsp">
          <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
     <% 
         try{
             while(rs.next()){
             out.println("<tr>");
				%>
                <td><input type="text" name="Eid" value="<%= rs.getString("Eid") %>"></td>
                <%
				out.println("<td>"+rs.getString("name")+"</td>");
				out.println("<td>"+rs.getString("sex")+"</td>");
				out.println("<td>"+rs.getString("age")+"</td>");
				out.println("<td>"+rs.getString("educational")+"</td>");
				out.println("<td>"+rs.getString("department")+"</td>");
				%>
				<td><input type="text" name="position" value="<%= rs.getString("position") %>"></td>
				<%
				out.println("<td>"+rs.getString("state")+"</td>");
	  %>
		     <td><input type="submit" value="确定修改"></td>
	<% out.println("</tr>");
             }
           }catch(SQLException e){
           e.printStackTrace();
           }finally{
		jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn);
		}
	%> 
    </form>
    </table>
     <center><a href="jobmanager.jsp"> <font color="white">返回员工职务管理</font></a></center>
  </body>
</html>