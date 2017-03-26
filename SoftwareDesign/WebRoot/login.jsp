<%@ page contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
    <base href="<%=basePath%>">
		<title>Login</title>
		<style type="text/css">
<!--
.STYLE1 {
	color: orange;
	font-size: 14px;
}
-->
</style>
		<link href="Css/style.css" rel="stylesheet" type="text/css">
		<link href="Css/styleleft.css" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<style type="text/css">
<!--
body {
	margin-top: 100px;
}
-->
</style>
	</head>
	<body background="images/mypic/login.jpg">
		<table width="500" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#F5f7f7">
			<form name="form" method="post" action="loginCheck.jsp">
				<tr align="center">
					<td height="27" colspan="2" bgcolor="blue  " class="STYLE1">
						<strong><font size="+3">人员登陆</font>
						</strong>
					</td>
				</tr>
				<tr>
					<td width="200" height="22" align="center" bgcolor="#F5F7F7">
						用&nbsp;户&nbsp;名：
					</td>
					<td width="300" bgcolor="#F5F7F7">
						<input type="text" name="username">
					</td>
				</tr>
				<tr>
					<td height="22" align="center" bgcolor="#F5F7F7">
						密&nbsp;&nbsp;&nbsp;&nbsp;码：
					</td>
					<td bgcolor="#F5F7F7">
						<input type="password" name="password">
					</td>
				</tr>
               <tr><td>
                     
                      <select name="authority">
                         <option value="管理员">管理员</option>
                         <option value="经理">经理</option>
                         <option value="员工">员工</option>
                      </select>
                      
                 </td></tr>
				<tr align="center">
					<td height="35" colspan="2" bgcolor="#F5F7F7">
						<input type="submit" name="submit" value="登录">
						&nbsp;&nbsp;
						<input type="reset" name="reset" value="重置">
					</td>
				</tr>
				<tr>
					<td height="22" align="center" bgcolor="#F5F7F7"></td>
					<td bgcolor="#F5F7F7">
						<font color="red" bold> 
              <%if(request.getParameter("message")!=null){ %>
                  <%=request.getParameter("message") %>
                <%} %>
						</font>
					</td>
				</tr>
			</form>
		</table>
	</body>
</html>
