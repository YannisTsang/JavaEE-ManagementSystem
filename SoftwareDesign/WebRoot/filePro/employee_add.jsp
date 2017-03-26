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
    <title>employee_add page</title>

  </head>
  
  <body background="images/mypic/mainbackground.jpg">
  <font color="white"><center><h3>新增员工信息</h3></center></font>
  <%request.setCharacterEncoding("GBK"); %>
  <form action="filePro/employee_insert.jsp">
    <table bgcolor="grey" border=1 width=1000 border=1 >
        <tr bgcolor="#a9987b">
          <td>姓名</td>
          <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>员工ID</td>
            <td><input type="text" name="Eid"></td>
            <td>年龄</td>
            <td><input type="text" name="age"></td>
        </tr>
        
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="sex" id="male" value="male" checked="checked"><label for="male">男</label>
                <input type="radio" name="sex" id="female" value="female"><label for="female">女</label>
            </td>
            <td>学历</td>
            <td><input type="text" name="educational"></td>
        </tr>
        
        <tr>
            <td>部门</td>
            <td>
               <select name="department">
                  <option value="设计部">设计部</option>
                  <option value="技术部">技术部</option>
                  <option value="行政部">行政部</option>
               </select>
            </td>
            <td>职位</td>
            <td>
               <select name="position">
                  <option value="部员">部员</option>
                  <option value="部长">部长</option>
                  <option value="主管">主管</option>
               </select>
            </td>
        </tr>
        
        <tr>
            <td>在职状态</td>
            <td>
                <input type="radio" name="state" id="true" value="true" checked="checked"><label for="true">true</label>
                <input type="radio" name="state" id="false" value="false"><label for="false">false</label>
            </td>
            <td><input type="submit" value="提交">
                <input type="reset" value="重置"></td>
        </tr>
        
        
    </table>
    </form>
  </body>
</html>
