<%@ page language="java" import="java.util.*" import="java.sql.*"  contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'file_lookupName.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
     <% 
       String str=request.getParameter("select");
       String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from fileInfo where "+str+"='"+find+"' ";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
      <form action="filePro/file_lookupName.jsp">
       <h3><select name="select">
           <option value="fileNum">按档案编号查找</option>
           <option value="fileName">按档案名称查找</option>
           <option value="Eid">按员工ID查找</option>
           <option value="name">按员工姓名查找</option>
           <option value="fileContent">按文档内容查找</option>
        </select>
        <input type="text" name="find">
        <input type="submit" value="查询">
    </form>
    
     <br>
       <h3><font color="white">符合条件的员工档案</font></h3><hr>
    <br>
    <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
        <tr bgcolor="#a9987b">
           <td>档案编号</td>
           <td>档案名称</td>
           <td>人员ID</td>
           <td>姓名</td>
           <td>内容</td>
            <%if("员工".equals(session.getAttribute("roleplay"))){ %>
            <%}else if("管理员".equals(session.getAttribute("roleplay"))||"经理".equals(session.getAttribute("roleplay"))){ %>
            <td>操作</td>
            <%} %>
        </tr>
        <% 
            while(rs.next()){
              out.println("<tr>");
              out.println("<td>"+rs.getString("fileNum")+"</td>");
              out.println("<td>"+rs.getString("fileName")+"</td>");
              out.println("<td>"+rs.getString("Eid")+"</td>");
              out.println("<td>"+rs.getString("name")+"</td>");
              out.println("<td>"+rs.getString("fileContent")+"</td>");
        %>
        
       <%if("员工".equals(session.getAttribute("roleplay"))) {%>
            <%}else if("管理员".equals(session.getAttribute("roleplay"))||"经理".equals(session.getAttribute("roleplay"))){ %>
              <td><a href="filePro/file_update.jsp?Eid=<%= rs.getString("Eid") %>">修改</a>|<a href="filePro/file_delete.jsp?Eid=<%=rs.getString("Eid")%>">删除</a></td>
               <%} %>
              
              <%
              out.println("</tr>");
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
        <h3><a href="filePro/file_document.jsp"><font color="white">返回员工档案页面</font></a></h3>
  </body>
</html>
