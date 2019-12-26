<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<nav id="header" class="navbar navbar-expand-sm bg-dark navbar-dark" >
	 <a class="navbar-brand" href="index">Code Story</a>
	 <a class="navbar-brand" href="index">首页</a>
		<form action="search" role="search" method="get" class="form-inline">
				<input type="text" name="word" id="" placeholder="search"class="form-control"> 
				<select name="choose" class="form-control">
					<option value="headline">文章标题</option>
					<option value="title">文章类型</option>
					<option value="user">作者</option>
				</select>
				<button type="submit" class="btn btn-success">搜索</button>
		</form>
		
	<%
		if (session.getAttribute("userName") != null) {
	%>
		<ul class="navbar-nav head-right">
			<li class="nav-item">
				<a href='articleadd' class=" nav-link">添加文章</a>
			</li>
			<li class="nav-item">
      			<a href="userinfo" class=" nav-link">${fullName }</a>
    		</li>
    		<li class="nav-item">
      			<a href='loginout'class=" nav-link">退出</a>
    		</li>
		</ul>
			
	<%
		} else {
	%>
		<ul class="navbar-nav head-right">
			<li class="nav-item">
				<a href='login' class=" nav-link">登录</a>
			</li>
			<li class="nav-item">
				<a href='register' class=" nav-link">注册</a>
			</li>
		</ul>
	<%
		}
	%>
</nav>
