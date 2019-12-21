<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'usermanage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
					            			stucss="btn-success";    //初始化按钮颜色
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
						<td><a href="#">更多</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>


		</div>
	</div>

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

		});
	</script>


</body>
</html>
