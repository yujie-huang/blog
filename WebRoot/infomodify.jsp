<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'infomodify.jsp' starting page</title>
    
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
    			<jsp:include page="usercenterTP.jsp"/>
    		</div>
    		<div class="right-bar1">
    		<form action = "infomodify" method="post">
    			<span>用户名：</span> <input type="text" readonly="readonly" value="${user.userName }" name="userName"><br>
    			<span>姓名：</span> <input type="text" value="${user.fullName }" name="fullName"><br>
    		  	<span>性别：</span> <input type="text" value="${user.sex }" name="sex">	<br>
        		<span>出生日期：</span>	<input type="text" value="${user.birth }" name="birth"><br>
        		<span>手机：</span>	<input type="text" value="${user.phone }" name="phone"><br>
        		<span>Email：</span><input type="text" value="${user.email }" name="email"><br>
        		<span>微信号：</span>	<input type="text" value="${user.wechat }" name="wechat"><br>
        		<span>描述信息：</span><input type="text" value="${user.information }" name="information">	<br>
        		<span>注册日期：${user.regis_date }</span>	<br>
        		<button type="submit">修改</button>
    		</form>
    		</div>
    	</div>
    	<%@ include file="footer.jsp" %>
  </body>
</html>
