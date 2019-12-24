<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>密码修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/usercenter.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/index.css">

  </head>
  
  <body>
    	<%@ include file="header.jsp" %>
    	<div class="content">
    		<div class="left-bar1">
    			<%@ include file="usercenterTP.jsp" %>
    		</div>
    		<div class="right-bar1">
    		<form action = "repassword" method="post">
    			<span>现在密码：</span> <input type="password" name="password"><br>
    		  	<span>新密码：</span> <input type="password"  name="newpassword">	<br>
    		  	<span>确认新密码：</span> <input type="password"  name="renewpassword">	<br>
        		<button type="submit">修改</button>
    		</form>
    		</div>
    	</div>
    	<%@ include file="footer.jsp" %>
  </body>
  
  <script>
  
  </script>
  
</html>
