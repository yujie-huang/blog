<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料修改</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/usercenter.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/css/header.css">
	<link rel="stylesheet" href="static/css/footer.css">

  </head>
  
  <body>
    	<%@ include file="header.jsp" %>
    	<div class="content">
    	<%@ include file="usercenterTP.jsp" %>
    	  <div class="right-bar1">
    		<div class="card" style="margin-top:10px;width:60%;margin-left:15%;">
    			<div class="card-header">个人资料修改</div>
    			
  				<div class="card-body">
  					<form action = "infomodify" method="post">
    				<span>用户名：</span> 
    				<input style="border:0;outline:none;" type="text" readonly="readonly" value="${user.userName }" name="userName"><br>
    				<span>姓名：</span> <br>
    				<input type="text" class="form-control" value="${user.fullName }" name="fullName"><br>
    		  		<span>性别：</span> 
    		  		<%
    		  		  User user=(User) request.getAttribute("user");
    		  		  String sexmm ="-1";
    		  		  if(user.getSex()!=null)
    		  		    sexmm = user.getSex();
    		  		  
    		  		 %>
    		  		<input type="radio" value="男" name="sex" <%= sexmm.equals("男")?"Checked":"" %> >男 	
    		  		<input type="radio" value="女" name="sex" <%= sexmm.equals("女")?"Checked":"" %> >女       
    		  		<br>
    		  		<br>
        			<span>出生日期：</span>	<br>
        			<input type="text" class="form-control" value="${user.birth }" name="birth" placeholder="YYYY-MM-DD"><br>
        			<span>手机：</span>	<br>
        			<input type="text" class="form-control" value="${user.phone }" name="phone"><br>
        			<span>Email：</span><br>
        			<input type="text" class="form-control" value="${user.email }" name="email"><br>
        			<span>微信号：</span>	<br>
        			<input type="text" class="form-control" value="${user.wechat }" name="wechat"><br>
        			<span>描述信息：</span><br>
        			<input type="text" class="form-control" value="${user.information }" name="information">	<br>
        			<span>注册日期：${user.regis_date }</span>	<br>
        			<button type="submit" class="btn btn-info">修改</button>
    		 		</form>
  				</div> 
    		</div>
    	  </div>
    		
    	</div>
    	<%@ include file="footer.jsp" %>
  </body>
</html>
