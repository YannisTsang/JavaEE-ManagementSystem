<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>My JSP 'employee_update.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg"> 
  <center><h3><font color="white">需要修改人员情况</font></h3></center>
  <%
    request.setCharacterEncoding("GBK"); 
    Connection conn=jdbc_connection.getConn();
    Statement stmt=jdbc_connection.getStmt(conn);
    String Eid=request.getParameter("Eid");
    String sql="select * from employeeInfo where Eid="+Eid+"";
    ResultSet rs=jdbc_connection.getRs(stmt, sql);
     while(rs.next()){
    %>
         <form action="filePro/employee_update1.jsp" method="post">
           <table bgcolor="grey" border=1 width=1000 border=1 width="1000">
             <tr bgcolor="#a9987b">
              <td>员工ID</td>
			  <td><input type="text" name="Eid" value="<%=rs.getString("Eid") %>" ></td>
			  <td>姓名</td>
			  <td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
			  <td>年龄</td>
			  <td><input type="text" name="age" value="<%=rs.getString("age") %>"></td>
		     </tr>	
		     <tr>
		        <td>性别</td>
		        <td>
		         <input type="text" value="<%=rs.getString("sex")%>">
		         <input type="radio" name="sex" id="male" value="male" checked="checked"><label for="male">男</label>
                 <input type="radio" name="sex" id="female" value="female"><label for="female">女</label>
		        </td>
		        <td>学历</td>
		        <td><input type="text" name="educational" value="<%= rs.getString("educational") %>"></td>
		        <td>部门</td>
		        <td><input type="text" value="<%= rs.getString("department") %>"></td>
		        <td>
		          <select name="department">
                    <option value="设计部">设计部</option>
                    <option value="技术部">技术部</option>
                    <option value="行政部">行政部</option>
                  </select>
		        </td>
		     </tr>
		     <td>职位</td>
		     <td><input type="text" value="<%= rs.getString("position") %>"></td>
            <td>
               <select name="position">
                  <option value="部员">部员</option>
                  <option value="部长">部长</option>
                  <option value="主管">主管</option>
               </select>
            </td>
      
            <td>在职状态</td>
            <td><input type="text" value="<%= rs.getString("state") %>"></td>
            <td>
                <input type="radio" name="state" id="true" value="true" checked="checked"><label for="true">true</label>
                <input type="radio" name="state" id="false" value="false"><label for="false">false</label>
            </td>
            <td><input type="submit" value="确定修改">
                <input type="reset" value="重置"></td>
        </tr>
		   </table>	
		 </form>		
				<%
			
			}
    %>

 <% jdbc_connection.close(rs);
		jdbc_connection.close(stmt);
		jdbc_connection.close(conn); %>
  </body>
</html>
