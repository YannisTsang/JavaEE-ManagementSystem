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
    <title>Update Password Page!</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
    <form action="loginUpdatePwd1.jsp">
      <table bgcolor="grey" border=1 width=1000 border=1 >
        <tr bgcolor="#a9987b">
        <td>
         <h3>修改密码</h3>
        </td>
        </tr>
        <tr>
          <td>用户名</td>
          <td><input type="text" name="userName"></td>
        </tr>
        <tr>
         <td>旧密码</td>
         <td><input type="password" name="oldpassword"></td>
        </tr>
        <tr>
          <td>新密码</td>
          <td><input type="password" name="password"></td>
        </tr>
        <tr>
        <td><input type="submit" value="修改"></td>
        </tr>
      </table>
    </form>
  </body>
</html>
