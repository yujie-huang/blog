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
    
    <title>My JSP 'personalArticlesmanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="static/css/usercenter.css">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/css/index.css">

  </head>
  
  <body>
  <%@ include file="header.jsp" %>
	<div class="content" >
	<div class="left-bar1">
	<%@ include file="usercenterTP.jsp" %>
	</div>
	
    <div class="right-bar1">
       <table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>文章ID</th>
						<th>文章名</th>
						<th>文章类型</th>
						
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="article">
						<tr >
							<td class="article_id">${article.article_id }</td>
							<td>${article.headline }</td>
							<td class="title-name">${article.type_name }</td>
							<td><a href="artupdate?ID= ${article.article_id }" class="btn btn-info btn-sm update">修改</a></td>
							<td><button class="btn btn-danger btn-sm delete">删除</button></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
        
    </div>
    
    <div>
    <%@ include file="footer.jsp" %>
    </div>
    
    
  </body>
  <script>
     $(function(){
		 $(".delete").click(function(){
				var art_id = $(this).parent().siblings(".article_id").text();
				var del=$(this).parent();
				console.log(art_id);
				$.ajax({
					type : "post",
					url : "artupdate",
					data : {
						"article_id" : art_id,
						"func" : "delete"
					},
					datatype : "json",
					success : function(data) {
						if(data=="1"){
							del.parent().remove();
						}
						else{
							
						}
					}
					});
			
			}); 
    });
  </script>
  
</html>
