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
    <title>My JSP 'train_join.jsp' starting page</title>
    
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    
    <center><h3><font color="white">已报读课程</font></h3></center>
    
    <h3><font color="white">您好，<%= session.getAttribute("username") %>, 你所报读的课程如下，请确认：</font></h3>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
      <tr bgcolor="#a9987b">
        <td>报读课程编号</td>
        <td>报读课程名称</td>
        <td>课程开课日期</td>
        <td>报读状态</td>
        <td>操作</td>
      </tr>
      
      <%
        String trainNum=request.getParameter("trainNum");
        Connection conn=jdbc_connection.getConn();
        Statement stmt=jdbc_connection.getStmt(conn);
        String sql="select*from train where trainNum='"+trainNum+"' ";
        ResultSet rs=jdbc_connection.getRs(stmt, sql);
        while(rs.next()){
          out.println("<tr>");
          out.println("<td>"+rs.getString("trainNum")+"</td>");
          out.println("<td>"+rs.getString("trainName")+"</td>");
          out.println("<td>"+rs.getString("trainTime")+"</td>");
          out.println("<td>"+true+"</td>");
          %>
          <td><a href="trainManager/train_record.jsp?trainNum=<%= rs.getString("trainNum") %>&&trainName=<%= rs.getString("trainName") %>&&trainTime=<%= rs.getString("trainTime") %>">确认报名</a></td>
          <% 
          out.println("</tr>");
        
        }
       %>
    </table>
   
    <br><br>
    <h3><center><a href="trainManager/train_record.jsp"><font color="white">查看所报读的课程</font></a></center></h3>
    <%
       jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);
     %>
  </body>
</html>
