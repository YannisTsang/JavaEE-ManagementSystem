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
    <title>lookupID.jsp</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    
    
     <form  action="filePro/lookupID.jsp"/>
    <h3><select name="select">
           <option value="Eid">按员工ID查找</option>
           <option value="name">按姓名查找</option>
           <option value="age">按年龄查找</option>
           <option value="educational">按学历查找</option>
           <option value="department">按部门查找</option>
           <option value="position">按职位查找</option>
           <option value="state">按在职状态查找</option>
        </select>
    <input type="text" name="find">
    <input type="submit" value="查找"></h3>
  </form>
  <font color="white">
    <br>
       <h3><font color="white">符合条件的员工信息</font></h3><hr></font>
    <br>
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
            <%if("员工".equals(session.getAttribute("roleplay"))){ %>
            <%}else if("管理员".equals(session.getAttribute("roleplay"))||"经理".equals(session.getAttribute("roleplay"))){ %>
            <td>操作</td>
            <%} %>
       </tr>
<% 
       request.setCharacterEncoding("gbk");
       String str=request.getParameter("select");
       String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from employeeInfo where "+str+"='"+find+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    <%
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
            <%if("员工".equals(session.getAttribute("roleplay"))) {%>
            <%}else if("管理员".equals(session.getAttribute("roleplay"))||"经理".equals(session.getAttribute("roleplay"))){ %>
               <td><a href="filePro/employee_update.jsp?Eid=<%=rs.getString("Eid")%>">修改</a> <a href="filePro/employee_delete.jsp?Eid=<%=rs.getString("Eid")%>">删除</a></td>
            <%} %>
        
	     <% out.println("</tr>");
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
        <h3><a href="filePro/employeeInformation.jsp"><font color="white">返回员工信息页面</font></a></h3>
  </body>
</html>
