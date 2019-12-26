<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>个人资料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<link rel="stylesheet" href="static/css/usercenter.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/header.css">
<link rel="stylesheet" href="static/css/footer.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
	<%@ include file="usercenterTP.jsp"%>
	
		<div class="right-bar1 ">
		<div class="card">
		 	<div class="card-header">个人资料</div>
			<div class="card-body">
				<span>姓名：${user.fullName}</span><br>
				<span>用户名：${user.userName }</span><br>
				<span>性别：${user.sex }</span> <br>
				<span>出生日期：${user.birth }</span> <br>
				<span>手机${user.phone }：</span><br>
				<span>Email：${user.email }</span><br>
				<span>微信号：${user.wechat }</span><br>
				<span>描述信息：${user.information }</span><br> 
				<span>注册日期：${user.regis_date }</span>
			</div>
			<div class="card-footer"><a href="infomodify">修改</a></div>
		</div>
		
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>