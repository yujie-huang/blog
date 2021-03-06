<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>文章类型管理</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/titleupdate.css">
<link rel="stylesheet" href="static/css/usercenter.css">
<link rel="stylesheet" href="static/css/header.css">
<link rel="stylesheet" href="static/css/footer.css">

</head>



<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="left-bar1">
		<%@ include file="usercenterTP.jsp" %>
		</div>
		<div class="right-bar1 ">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>类型ID</th>
						<th>类型名</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="title">
						<tr >
							<td class="title-id">${title.type_id }</td>
							<td class="title-name">${title.type_name }</td>
							<td><button class="btn btn-info btn-sm update" data-toggle="modal" data-target="#myModal">修改</button></td>
							<td><button class="btn btn-danger btn-sm delete" data-toggle="modal" data-target="#mydeletemodel">删除</button></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<button class="btn btn-primary addtt" data-toggle="modal" data-target="#myAddmodel">添加</button>
			<span class="error" style="color:red;"></span>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

<!-- 模态框 --用于修改-->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">请修改</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      
      <div class="modal-body">
       	<input type="text" class="retext"></input>
      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer">
      	<button  type="button" class="btn btn-success rebtn" data-dismiss="modal">提交</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
 
    </div>
  </div>
</div>
<!--./模态-->

<!-- 模态框2 --用于添加-->
<div class="modal fade" id="myAddmodel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">请添加类型</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      
      <div class="modal-body">
       <input type="text" class="form-control addtext"></input>
      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer">
      	<button  type="button" class="btn btn-success commit" data-dismiss="modal">提交</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
 
    </div>
  </div>
</div>
<!--./模态-->

<!-- 模态框3 --用于提醒删除-->
<div class="modal fade" id="mydeletemodel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">请确认是否删除</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer ">
      	<button  type="button" class="btn btn-success delcheck" data-dismiss="modal">是</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">否</button>
      </div>
 
    </div>
  </div>
</div>
<!--./模态-->




 	<script>
		$(function(){
			$(".update").click(function(){
				var title_id = $(this).parent().siblings(".title-id").text();
				var title_name = $(this).parent().siblings(".title-name");
				$(".retext").val(title_name.text());
				$(".rebtn").click(function(){
					var ntitle =$(".retext").val();
					//提交修改
					$.ajax({
					type : "post",
					url : "titleupdate",
					data : {
						"type_id" : title_id,
						"type_name" : ntitle,
						"func" : "update"
					},
					datatype : "json",
					success : function(data) {
						if(data=="1"){
							title_name.text(ntitle);
						}
						else{
							
							$(".error").text("修改失败！");
							setTimeout(function(){$(".error").text("");},2000);
							
						}
					}
					});
				});
				
			
			});
			
			$(".addtt").click(function(){
				$(".addtext").val("");
				$(".commit").click(function(){
					var newtitle=$(".addtext").val();
					console.log(newtitle)
				if (newtitle!=null){
					$.ajax({
					type : "post",
					url : "titleupdate",
					data : {
						
						"type_name" : newtitle,
						"func" : "add"
					},
					datatype : "json",
					success : function(data) {
						if(data=="1"){
							location.reload();
						}
						else{
							$(".error").text("添加失败，可能已有该类型!");
							setTimeout(function(){$(".error").text("");},2000);
							
						}
					}
					});
				}
				});
			
			});
			
			
			 $(".delete").click(function(){
				var title_id = $(this).parent().siblings(".title-id").text();
				var del=$(this).parent();
				$(".delcheck").click(function(){
					$.ajax({
					type : "post",
					url : "titleupdate",
					data : {
						"type_id" : title_id,
						"func" : "delete"
					},
					datatype : "json",
					success : function(data) {
						if(data=="1"){
							del.parent().remove();
						}
						else{
							$(".error").text("类型已被使用，无法删除！");
							setTimeout(function(){$(".error").text("");},2000);
							
						}
					}
					});
				});
				
			
			}); 
			
			
		});
	
	</script> 

</body>
</html>