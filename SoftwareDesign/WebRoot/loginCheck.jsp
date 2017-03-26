<%@ page contentType="text/html;charset=GBK" import="java.sql.*" contentType="text/html;charset=GBK"%>
<jsp:useBean id="jdbc_connection" class="dataBase.jdbc_connection" scope="page"/>
<%
  request.setCharacterEncoding("gbk");
  String username=request.getParameter("username");
  String password=request.getParameter("password");
  String str=request.getParameter("authority");
  String sql="select username,password,roleplay from employee1 where username='"+username+"'";
 
 request.setCharacterEncoding("GBK");
           Connection conn=jdbc_connection.getConn();
           Statement stmt=jdbc_connection.getStmt(conn);
           ResultSet rs=jdbc_connection.getRs(stmt,sql);
      
 if(rs.next()){
     if(password.equals(rs.getString("password"))){
        if(username.equals(rs.getString("username"))){
           if(str.equals(rs.getString("roleplay"))){
         session.setAttribute("username",rs.getString("username"));
         session.setAttribute("roleplay",rs.getString("roleplay"));
         response.sendRedirect("index.jsp");
         }else{
         response.sendRedirect("login.jsp?message=u r not the right guy");
           }
        }
      }else{
             response.sendRedirect("login.jsp?message=please input correct password!!");
         }
 }else{
     response.sendRedirect("login.jsp?message=please input correct username!!");
 }
  jdbc_connection.close(rs);
        jdbc_connection.close(stmt);
        jdbc_connection.close(conn);
 %>

