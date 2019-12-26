<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>密码修改</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/header.css">
    <link rel="stylesheet" href="static/css/footer.css">
    <link rel="stylesheet" href="static/css/usercenter.css">

  </head>
  
  <body>
    	<%@ include file="header.jsp" %>
  			<div class="content">
    		<%@ include file="usercenterTP.jsp" %>

    		<div class="right-bar1">
    		
    		<div class="card" style="margin-top:10px;width:60%;margin-left:15%;">
    			<div class="card-header">密码修改</div>
    			
  				<div class="card-body">
    		<form action = "repassword" method="post">
    			<span>现在密码：</span> <input class="form-control" type="password" name="password"><br>
    		  	<span>新&nbsp;&nbsp;密&nbsp;&nbsp;码：</span> <input class="form-control" type="password"  name="newpassword">	<br>
    		  	<span>确认密码：</span> <input type="password"  class="form-control" name="renewpassword">	<br>
        		<button type="submit" class="btn btn-info">修改</button>
    		</form>
    		</div>
    		</div>
    		</div>
    	</div>
    	<%@ include file="footer.jsp" %>
  </body>
  
  <script>
  
  </script>
  
</html>
