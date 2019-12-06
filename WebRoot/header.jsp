<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title>My JSP 'header.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/index.css">

  </head>
  
  <body>
     <nav id="header"> 
        <div class="floatleft log1">
            <a href="#">code story</a>
        </div>
        <div class="floatleft search1">
            <form action="#" role="search">
                <div >
                    <input type="text"  name="" id="" placeholder="search">
                    <button type="submit" class="btn-default">搜索</button>
                </div>
            </form>
        </div>
        <%
        String s=" <div class='floatleft login1'> <a href='login'>登录</a> </div> <div class='floatleft register1'> <a href='register'>注册</a></div>" ;
        if (session.getAttribute("userName")!=null){
        	out.print("<div class='flaotleft'><a href='articleadd'>添加文章</a></div>"+"<div class='floatleft login1'>"+session.getAttribute("userName")+"</div>"+"<div class='floatleft register1'> <a href='loginout'>退出</a></div>");
        	out.print("<div class='flaotleft'><a href='userinfo'>个人中心</a></div>");
        }
         else
         out.print(s);
         %>
        
    </nav>
  </body>
</html>
