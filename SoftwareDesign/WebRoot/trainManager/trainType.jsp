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
    
    <title>My JSP 'trainType.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <form action="trainManager/looktrain.jsp">
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
           request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           String sql="select * from train";
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
           
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
    
    <%if ("管理员".equals(session.getAttribute("roleplay"))){ %>
         <form action="trainManager/train_add.jsp">
     <input type="submit" value="添加">
     </form>
    <%} %>
    <br><br>
     <center><a href="mainMessage.html"><font color="white">返回主页面</font></a></center>
  </body>
</html>
