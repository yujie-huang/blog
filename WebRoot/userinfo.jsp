<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="static/css/userinfo.css">
    <link rel="stylesheet" href="static/css/usercenter.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="content">
	<div class="left-bar1">
	<jsp:include page="usercenterTP.jsp"></jsp:include>
	</div>
    <div class="right-bar1">
        <span>登录名： ${user.userName}</span> <br>
        <span>姓名：${user.fullName}</span><br>
        
    </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>