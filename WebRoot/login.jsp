<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	    <title>登录</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/login.css">
</head>

<body>
<div class="wrapper">
    <form class="form-signin action="login" id="form1" method="post" style="TEXT-ALIGN: center;">  
      <h2 class="form-signin-heading">Login</h2>
       <span style="color:red" id="error">${err }</span>   
      <input type="text"  id="user1" class="form-control" name="userName" placeholder="账号" required="" autofocus=""  value="${userName }"/>
      <input type="password" id="pw1" class="form-control" name="password" placeholder="Password" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
      <a href="index">直接访问</a>
      <a href="register">注册</a>
      <a href="#">忘记密码</a>
       <a href="admin">管理员</a>
    </form>
  </div>
 
    <script>
/*         $(function(){
            $("#form1").submit(function () {
                if($("#user1").val()==''){
                   $("#error").text("账户不能为空！");
                    return false;
                }
                else if($("#pw1").val()==''){
                    $("#error").text("密码不能为空！");
                    return false;
                }
                else return true;
              });
            
        }); */
    </script>
</body>
</html>