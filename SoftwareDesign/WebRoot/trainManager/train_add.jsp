<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'train_add.jsp' starting page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <center><h3><font color="white">新增课程信息</font></h3></center>
    <%request.setCharacterEncoding("GBK"); %>
    <form action="trainManager/train_insert.jsp">
           <table border=1 width=1000>
             <tr bgcolor="#a9987b">
               <td>课程编号</td>
               <td><input type="text" name="trainNum" ></td>
               <td>课程名称</td>
               <td><input type="text" name="trainName" ></td>
               <td>课程费用</td>
               <td><input type="text" name="trainPay" ></td>
             </tr>
             <tr>
               <td>开课时间</td>
               <td><input type="text" name="trainTime" ></td>
               <td>报读门槛</td>
                <td><input type="text" name="trainLevel" ></td> 
               <td><input type="submit" value="提交">
                <input type="reset" value="重置"></td>
             </tr>
           </table>
        </form>
  </body>
</html>
