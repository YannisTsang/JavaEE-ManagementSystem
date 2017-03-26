<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'looktrain.jsp' starting page</title>
    
	

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
   <%
      request.setCharacterEncoding("gbk");
      String str=request.getParameter("select");
      String find=request.getParameter("find");
       Connection conn=jdbc_connection.getConn();
       Statement stmt=jdbc_connection.getStmt(conn);
       String sql="select * from train where "+str+"='"+find+"'";
       ResultSet rs=jdbc_connection.getRs(stmt,sql);
    %>
    
    <form action="looktrain.jsp">
    <h3><select name="select">
           <option value="trainNum">按培训编号查找</option>
           <option value="trainName">按课程名字查找</option>
           <option value="trainPay">按金额查找</option>
           <option value="trainTime">按开始时间查找</option>
           <option value="trainLevel">按报读门槛查找</option>
        </select>
    <input type="text" name="find">
    <input type="submit" value="查找"></h3>
    </form>
    
    <br>
      <h3><font color="white">符合条件的课程信息</font></h3><hr>
    <br>
    
     <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
          <td>课程编号</td>
          <td>课程名字</td>
          <td>培训费用</td>
          <td>开课时间</td>
          <td>报读门槛</td>
            <td>操作</td>
           
        </tr>
        
        <%
           try{
             while(rs.next()){
             out.println("<tr>");
                out.println("<td>"+rs.getString("trainNum")+"</td>");
                out.println("<td>"+rs.getString("trainName")+"</td>");
                out.println("<td>"+rs.getString("trainPay")+"</td>");
                out.println("<td>"+rs.getString("trainTime")+"</td>");
                out.println("<td>"+rs.getString("trainLevel")+"</td>");
        %>
            <%if("员工".equals(session.getAttribute("roleplay"))||"经理".equals(session.getAttribute("roleplay"))) {%>
               <td><a href="trainManager/train_join.jsp?trainNum=<%= rs.getString("trainNum") %>">报名</a>
            <%}else if("管理员".equals(session.getAttribute("roleplay"))){ %>
               <td><a href="trainManager/train_update.jsp?trainNum=<%=rs.getString("trainNum")%>">修改</a> <a href="trainManager/train_delete.jsp?trainNum=<%=rs.getString("trainNum")%>">删除</a></td>
            <%} %>
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
        <h3><a href="trainManager/trainType.jsp"><font color="white">返回课程信息页面</font></a></h3>
  </body>
</html>
