<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/css/index.css">
	<link rel="stylesheet" href="static/css/user.css">

  </head>
  
  <body>
  	<div class="header">
   	<%@ include file="header.jsp" %>
   	</div>
   	<div id="content">
   	<div class="left-bar1">
		<span>姓名：${user.fullName}</span><br>
		<span>用户名：${user.userName }</span><br>
		<span>性别：${user.sex }</span> <br>
		<span>描述信息：${user.information }</span><br> 
		<span>注册日期：${user.regis_date }</span>
	</div>
    <div  class="container right-bar1">
    
        <table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>文章ID</th>
						<th>文章名</th>
						<th>文章类型</th>
						<th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="article">
						<tr >
							<td class="article_id"> <a href="getarticlebyid?ID=${article.article_id }">${article.article_id }</a></td>
							<td>${article.headline }</td>
							<td class="title-name" ><a href="getarticlebytitle?typeID=${article.type_id }&userName=${article.userName}">${article.type_name }</a></td>
							<td><a href="getarticlebyid?ID=${article.article_id }" class="btn btn-info btn-sm update">查看更多</a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
    </div>
    </div>
    <div class="footer">
     <%@ include file="footer.jsp" %>
    </div>
  </body>
</html>
