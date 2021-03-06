<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${user.fullName}的主页</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/css/user.css">
	<link rel="stylesheet" href="static/css/header.css">
	<link rel="stylesheet" href="static/css/footer.css">

  </head>
  
  <body>
   	<%@ include file="header.jsp" %>
   	<div id="content">
   	<div class="left-bar1">
		<div class="card">
		 	<div class="card-header">${user.fullName}的个人资料</div>
			<div class="card-body">
			<span>姓名：${user.fullName}</span><br>
			<span>用户名：${user.userName }</span><br>
			<span>性别：${user.sex }</span> <br>
			<span>描述信息：${user.information }</span><br> 
			<span>注册日期：${user.regis_date }</span>
			</div>
		</div>
	</div>
    <div  class="right-bar1">
    
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

<%@ include file="footer.jsp" %>

  </body>
</html>
