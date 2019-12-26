<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	    <title>注册</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/register.css">
</head>
<body>
<div class="wrapper">
    <form class="form-signin action="register" id="form2" method="post" style="TEXT-ALIGN: center;">  
        
      <h2 class="form-signin-heading">Register</h2>
       <span style="color:red" id="error">${err }</span> 
       <input type="text"  id="name1" class="form-control" name="nikName" placeholder="昵称" required="" autofocus=""  value="${user.fullName }"/>
      <input type="text"  id="user1" class="form-control" name="userName" placeholder="账号     10位" required="" autofocus=""  value="${user.userName}"/>
      <input type="password" id="pw1" class="form-control" name="password" placeholder="Password   8~32位" required="" autofocus=""/> 
      <input type="password" id="pw2" class="form-control" placeholder="RePassword" required=""/>     
 	 	  性别：<input type="radio" value="男" name="sex" Checked >男 	
      <input type="radio" value="女" name="sex" >女 
      <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>   
      <a href="index">直接访问</a>
      <a href="register">登录</a>
      <a href="admin">管理员</a>
    </form>
  </div>
    <script>
        $(function () {
            $("#form2").submit(function(){
                if($("#user1").val().length!=10){
                	$("#error").text("账号长度应为10位！");
                    return false;
                }
                else if($("#pw1").val().length<8||$("#pw1").val().length>32){
                    $("#error").text("密码应在8~32位");
                    return false;
                }
                else if($("#pw1").val()!=$("#pw2").val()){
                    $("#error").text("两次密码应该一致！");
                    return false;
                }
                else return true;
            });
          });
    </script>
</body>
</html>