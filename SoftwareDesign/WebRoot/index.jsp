<%@ page contentType="text/html; charset=gbk"%>
<%
  if(session.getAttribute("roleplay")==null&&session.getAttribute("password")==null){
     response.sendRedirect("login.jsp?message=input data error!");
  }
 %>
<html>
	<head>
		<title>zyz</title>
	</head>
	<frameset name="head_main" rows="60,18,*" cols="*" frameborder="no"
		border="0" framespacing="0">
        <frame src="top.html" name="top" scrolling="No" noresize="noresize"
			id="topFrame" title="topFrame" />
		<frame border=0 name="head_bar" marginWidth=0 borderColor=#e7e7e7
			marginHeight=0 src="head_bar.jsp" frameBorder=0 noResize scrolling=no>
		<frameset name="menu_main" cols=200,8,* bordercolor="#3164FE">
			<frame src="left.html" name="left" scrolling="yes"
				noresize="noresize" id="leftFrame" title="leftFrame" />
			<frame border=0 name="bar" marginWidth=0 borderColor=#e7e7e7
				marginHeight=0 src="left_bar.html" frameBorder=0 noResize
				scrolling=no>
			<frame src="mainMessage.html" name="main" id="mainFrame"  title="" />
		</frameset>
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>
