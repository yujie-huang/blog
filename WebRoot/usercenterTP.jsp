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
    <title>个人中心</title>
    <link rel="stylesheet" href="./css/usercenter.css">
</head>
<body>
    <div class="content">
       <div class="left-bar1">
           <span id="hello">XXX您好！</span>
           <br>
           <br>
           <br>
           <div class="li1">
            <label>账号管理</label>
                <ul class="list">
                    <li><a href="infomodify">资料修改</a></li>
                    <li><a href="#">密码修改</a></li>
                    <li><a href="#">注销申请</a></li>
                </ul>
                <br>
            <label>文章管理</label>
                <ul class="list">
                    <li><a href="#">写文章</a></li>
                    <li><a href="#">修改文章</a></li>
                    <li><a href="#">删除文章</a></li>
                </ul>  
            </div>       
        </div> 

    </div>
</body>
</html>
