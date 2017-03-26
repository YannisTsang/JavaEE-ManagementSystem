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
    <title>file_update1 page</title>
   
  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <% 
     request.setCharacterEncoding("gbk");
     String fileNum=request.getParameter("fileNum");
     String fileName=request.getParameter("fileName");
     String Eid=request.getParameter("Eid");
     String name=request.getParameter("name");
     String fileContent=request.getParameter("fileContent");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       stmt.execute("update fileInfo set fileNum='"+fileNum+"',fileName='"+fileName+"',name='"+name+"',fileContent='"+fileContent+"' where Eid="+Eid+" ");
       ResultSet rs=stmt.executeQuery("select * from fileInfo where Eid="+Eid+"");
   %>
   <font color="white">
   <br>
     <h3>修改成功！！！</h3>
   <br>
   
     <h3>修改后信息为：</h3></font>
     <br>
     <br>
     <br>
     <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
        <tr bgcolor="#a9987b">
           <td>档案编号</td>
           <td>档案名称</td>
           <td>人员ID</td>
           <td>姓名</td>
           <td>内容</td>
           <td>操作</td>
        </tr>
    
    
    <%
      
      try{
          while(rs.next()){
              out.println("<tr>");
              out.println("<td>"+rs.getString("fileNum")+"</td>");
              out.println("<td>"+rs.getString("fileName")+"</td>");
              out.println("<td>"+rs.getString("Eid")+"</td>");
              out.println("<td>"+rs.getString("name")+"</td>");
              out.println("<td>"+rs.getString("fileContent")+"</td>");
              %>
              
              <td><a href="filePro/file_update.jsp?Eid=<%= rs.getString("Eid") %>">修改</a>|<a href="filePro/file_delete.jsp?Eid=<%=rs.getString("Eid")%>">删除</a></td>
              
              <%
              out.println("</tr>");
          }
      }catch(SQLException e){e.printStackTrace();
      }finally{
        jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);
      }
     %>
     </table>
     
     <br>
        <br>
        <h3><a href="filePro/file_document.jsp"><font color="white">返回员工档案页面</font></a></h3>
  </body>
</html>
