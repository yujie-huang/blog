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
    <title>注册</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/register.css">
</head>
<body>
	<div class="container bd1" >
        
        <form action="register" id="form2" method="post" class="container formcss">
        <h2 class="text-center">注册</h2>
            <div class="form-group">
                <label >昵称：</label>
                <input type="text" name="nikName" id="name1"class="form-control" values="${user.fullName }">
            </div>
            <div class="form-group">
                <label for="user">账户：</label> 
                <input type="text" name="userName" id="user1"class="form-control" placeholder="长度为10"  values="${user.userName }">
            </div>
            <div class="form-group">
                <label for="password">密码：</label>
                <input type="password" name="password" id="pw1" class="form-control"placeholder="长度为8~32">
            </div>
            <div class="form-group">
                <label for="password">重复密码：</label>
                <input type="password" name="" id="pw2" class="form-control">
            </div>
            <button type="submit"  class="btn btn-primary">提交</button>
            <button type="reset" class="btn btn-primary">重置</button>
            <a href="login">登录</a>
      	</form>
      </div>
    <script>
        $(function () {
            $("#form2").submit(function(){
                if($("#user1").val()==''){
                    alert("账户不能为空！");
                    return false;
                }
                else if($("#user1").val().length!=10){
                    alert("账号长度应为10位！");
                    return false;
                }
                else if($("#pw1").val()==''){
                    alert("密码不能为空！");
                    return false;
                }
                else if($("#pw1").val().length<8||$("#pw1").val().length>32){
                    alert("密码应在8~32位");
                    return false;
                }
                else if($("#pw1").val()!=$("#pw2").val()){
                    alert("两次密码应该一致！");
                    return false;
                }
                else return true;
            });
          });
    </script>
</body>
</html>