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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="static/css/usercenter.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/index.css">
<link rel="stylesheet" href="static/css/titleupdate.css">

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
							<td><button class="btn btn-info btn-sm update">修改</button></td>
							<td><button class="btn btn-danger btn-sm delete">删除</button></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<br>
					<input type="text" class="newtitle"></input><button class="btn btn-primary addtt">添加</button>

		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<div class="retitle container">
		请修改：<input class="retxt"></input> <button class="btn btn-success rebtn">提交</button>
	</div>
	
 	<script>
		$(function(){
		$(".retitle").css("display","none");
			$(".update").click(function(){
				var title_id = $(this).parent().siblings(".title-id").text();
				var title_name = $(this).parent().siblings(".title-name");
				var retxt=$(".retxt").val(title_name.text());
				//retext.text(title_name);
				
				$(".retitle").css("display","");
				$(".rebtn").click(function(){
					var ntitle =$(".retxt").val();
					$(".retitle").css("display","none");
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
					}
					});
				});
				
			
			});
			
			$(".addtt").click(function(){
				var newtitle=$(".newtitle").val();
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
					}
					});
				}
			
			});
			
			
			 $(".delete").click(function(){
				var title_id = $(this).parent().siblings(".title-id").text();
				var del=$(this).parent();
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
							alert
						}
					}
					});
			
			}); 
			
			
		});
	
	</script> 

</body>
</html>