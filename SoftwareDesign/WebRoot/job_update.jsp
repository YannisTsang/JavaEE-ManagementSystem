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
    <title>离退更改</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <% 
     request.setCharacterEncoding("gbk");
     String position=request.getParameter("position");
     String Eid=request.getParameter("Eid");
     Connection conn=jdbc_connection.getConn();
     Statement stmt=jdbc_connection.getStmt(conn);
     stmt.execute("update employeeInfo set position='"+position+"'where Eid="+Eid+" ");
     ResultSet rs=stmt.executeQuery("select * from employeeInfo where Eid="+Eid+"");
   %>
   <font color="white">
   <br>
     <h3> <font color="white">修改成功！！！</font></h3>
   <br>
   
     <h3> <font color="white">修改后信息为：</font></h3>
     <br>
     <br>
     <br>
      </font>
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
		       <td><a href="job_add.jsp?Eid=<%=rs.getString("Eid")%>">修改职务</a></td>
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
     
     <br>
        <br>
        <h3><a href="jobmanager.jsp"> <font color="white">返回职务管理页面</font></a></h3>
  </body>
</html>