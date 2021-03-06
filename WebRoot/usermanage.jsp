<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>后台用户管理中心</title>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="static/css/admin.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="adminheader.jsp"%>

	<div class="content">
		<%@ include file="adminMenu.jsp"%>
		<div class="right-content">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>check</th>
						<th>username</th>
						<th>fullname</th>
						<th>gender</th>
						<th>birthday</th>
						<th>phone</th>
						<th>Email</th>
						<th>wechat</th>
						<th>information</th>
						<th>statue</th>
						<th>rePassword</th>
						<th>more</th>
						



					</tr>
				</thead>
				<tbody>
					<%
						List<User> list =(List<User>) request.getAttribute("list");
					            	for(User user: list){
					            		String stu=null,stucss=null;
					            		if(user.isStatus()){
					            			stu="已启用";
					            			stucss="btn-success";    //初始化按钮颜色状态
					            			}
					            		else{
					            			stu="已禁用";
					            			stucss="btn-secondary";
					            			}
					%>
					<tr class="td-a">
						<td><input type="checkbox" name="userName"
							value="<%=user.getUserName()%>"></td>
						<td class="backUserNAme"><%=user.getUserName()%></td>
						<td><%=user.getFullName()%></td>
						<td><%=user.getSex()%></td>
						<td><%=user.getBirth()%></td>
						<td><%=user.getPhone()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getWechat()%></td>
						<td><%=user.getInformation()%></td>
						<td><button class="status btn  btn-sm  <%=stucss%>"><%=stu%></button></td>
						<td><button class="repassword btn btn-sm btn-danger" data-toggle="modal" data-target="#myModal">重置密码</button></td>
						<td><a href="getuserbyid?ID=<%=user.getUserName()%>">更多</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>


		</div>
	</div>
	
<!-- 模态框 --用于添加新密码-->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">请输入新密码</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      
      <div class="modal-body">
       	<input type="text" class="newpassword form-control">
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
	<script>
		$(function() {
			$(".status").click(function() {
				console.log("dsefsfse");
				var f = $(this).text();
				var fs = "0";
				var user = $(this).parent().siblings(".backUserNAme").text();
				
				
				//console.log(user); 
				if (f == "已禁用") {
					fs = "1";
				}
				;
				var res = $(this);
				$.ajax({
					type : "post",
					url : "usermanage",
					data : {
						"func": "change",
						"userName" : user,
						"statu" : fs
					},
					datatype : "json",
					success : function(data) {
						if (data == "1" && fs == "1") {
							res.removeClass("btn-secondary");
							res.addClass("btn-success");
							res.text("已启用");
							console.log("1");
						}

						if (data == "1" && fs == "0") {
							res.removeClass("btn-success");
							res.addClass("btn-secondary");
							res.text("已禁用");
							console.log("0");
						}

					}

				});
			});
			
			
			$(".repassword").click(function(){
				var user = $(this).parent().siblings(".backUserNAme").text();
				var newpassword;
				$(".commit").click(function(){
					newpassword=$(".newpassword").val();
					console.log(newpassword)
					$.ajax({
					type : "post",
					url : "usermanage",
					data : {
						"func": "repwd",
						"userName" : user,
						"newpassword" : newpassword
					},
					datatype : "json",
					success : function(data) {
						if (data == "1" ) {
							alert("修改成功")
						}
						if (data == "0" ) {
							alert("修改失败！")
						}

					}

				});
				});
				
			});
		});
	</script>


</body>
</html>
