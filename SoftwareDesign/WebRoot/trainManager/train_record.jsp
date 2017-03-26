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
    <title>My JSP 'train_record.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <% 
      String trainNum=request.getParameter("trainNum");
      String trainName=request.getParameter("trainName");
      String trainTime=request.getParameter("trainTime");
      String state="true";
      Connection conn=jdbc_connection.getConn();
      PreparedStatement pstmt=null;
      pstmt=conn.prepareStatement("insert into train_record values(?,?,?,?)");
      pstmt.setString(1,trainNum);
      pstmt.setString(2,trainName);
      pstmt.setString(3,trainTime);
      pstmt.setString(4,state);
      pstmt.executeUpdate();
     
    %>
    <center>
     <br><br><h3><font color="white">添加课程成功！</font></h3>
     <br>
     <br><h3><font color="white">添加后信息</font></h3>
     <br>
     <br>
   <h3><font color="white">您好,<%= session.getAttribute("username") %>, 你所报读的课程如下所示：</font></h3>
    <table bgcolor="grey" border=1 width=1000 border=1 width=1000>
        <tr bgcolor="#a9987b">
        <td>报读课程编号</td>
        <td>报读课程名称</td>
        <td>课程开课日期</td>
        <td>报读状态</td>
        <td>操作</td>
      </tr>
      <%
        ResultSet rs=pstmt.executeQuery("select * from train_record where trainNum='"+trainNum+"'");
        try{
        
             while(rs.next()){
             out.println("<tr>");
                out.println("<td>"+rs.getString("trainNum")+"</td>");
                out.println("<td>"+rs.getString("trainName")+"</td>");
                out.println("<td>"+rs.getString("trainTime")+"</td>");
                out.println("<td>"+rs.getString("state")+"</td>");
        %>
           
               <td><a href="trainManager/train_recordshow.jsp?trainNum=<%=rs.getString("trainNum")%>">确定报读</a></td>
            
        <% 
                
                out.println("</tr>");
             }
           }catch(SQLException e){
           e.printStackTrace();
           }finally{
       rs.close();
        pstmt.close();
        conn.close();
        }
       %>
     
    </table>    
  </body>
</html>
