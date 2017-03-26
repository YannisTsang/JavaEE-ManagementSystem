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
    <title>My JSP 'train_recordshow.jsp' starting page</title>
  
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <center><h3><font color="white">已报读课程</font></h3></center>
     <h3><font color="white">您好，<%= session.getAttribute("username") %>, 你所报读的课程如下：</font></h3>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
          <td>课程编号</td>
          <td>课程名字</td>
          <td>开课时间</td>
          <td>报读状态</td>
            <td>操作</td>
           
        </tr>
        
        <%
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from train_record";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
           try{
             while(rs.next()){
             out.println("<tr>");
                out.println("<td>"+rs.getString("trainNum")+"</td>");
                out.println("<td>"+rs.getString("trainName")+"</td>");
                out.println("<td>"+rs.getString("trainTime")+"</td>");
                out.println("<td>"+rs.getString("state")+"</td>");
        %>
          
               <td><a href="trainManager/class_delete.jsp?trainNum=<%= rs.getString("trainNum") %>&&state=<%= rs.getString("state") %>">退课</a> </td>
           
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
    
    <br><br>
     <center><a href="mainMessage.html"><font color="white">返回主页面</font></a></center>
  </body>
</html>
