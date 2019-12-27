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
    <title>个人文章管理</title>
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
  <%@ include file="header.jsp" %>
	<div class="content" >
	<%@ include file="usercenterTP.jsp" %>
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
							<td ><a href="getarticlebyid?ID=${article.article_id }">${article.headline }</a></td>
							<td class="title-name">${article.type_name }</td>
							<td><a href="artupdate?ID= ${article.article_id }" class="btn btn-info btn-sm update">修改</a></td>
							<td><button class="btn btn-danger btn-sm delete" data-toggle="modal" data-target="#myModal">删除</button></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<a href="articleadd"><button class="btn btn-primary " >新文章</button></a>
        
    </div>
  </div>
  
  <!-- 模态框--用于提示确定删除 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">确认删除？(不可恢复)</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- 模态框底部 -->
      <div class="modal-footer">
       <button type="button" class="btn btn-danger commit" data-dismiss="modal">确认</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
 
    </div>
  </div>
</div>
    
<%@ include file="footer.jsp" %>
    
  </body>
  <script>
     $(function(){
		 $(".delete").click(function(){
				var art_id = $(this).parent().siblings(".article_id").text();
				var del=$(this).parent();
				console.log(art_id);
				$(".commit").click(function(){
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
    });
  </script>
  
</html>
