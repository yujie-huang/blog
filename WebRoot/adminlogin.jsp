<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>My JSP 'adminlogin.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>

	
	<style type="text/css">
		.container{
			text-align:center;
		
			
		}
		.form-control{
			width:200px;
			margin:20px;
		}
		.form1{
			margin-top:200px;
			width:250px;
			height:250px;
			
			background-color:aliceblue;
			
			
		}
	</style>

  </head>
  
 <body>  
    <div class="container" >  
         
        <form action="admin" method="post" class=" container form1">  
        <h1>AdminLogin</h1> 
            <input type="text"  placeholder="用户名" name="u" class="form-control"></input>  
            <input type="password"  placeholder="密码" name="p" class="form-control"></input>  
            <button type="submit" class="btn btn-primary" style="width:200px ;margin:20px">登录</button>  
        </form>  
    </div>  
</body>  
</html>
