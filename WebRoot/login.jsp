<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/login.css">
</head>
<body>
    <div class="container"> 
            <h2 class="text-center">请登录</h2>   
        <form action="login" id="form1" method="post">
               
            <div class="form-group">
                <label for="user">账户：</label>
                <input type="text" name="userName" id="user1"class="form-control" value="${userName }">
            </div>
            <div class="form-group">
                <label for="password">密码：</label>
                <input type="password" name="password" id="pw1" class="form-control">
            </div>
            
            <button type="submit" class="btn btn-primary">登录</button>
            <a href="register"><button type="button" id="reg" class="btn btn-primary">注册</button></a>
            <a href="#">忘记密码</a>
        </form>
    </div>
    <script>
        $(function(){
            $("#form1").submit(function () {
                if($("#user1").val()==''){
                    alert("账户不能为空！");
                    return false;
                }
                else if($("#pw1").val()==''){
                    alert("密码不能为空！");
                    return false;
                }
                else return true;
              });
            
        });
    </script>
</body>
</html>