<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="">

  </head>
  
  <body class="container">
  <form action="articleadd" method="post" class="container" >
  <div id="titlediv">
            <h1 style="text-align: center;margin-top:10px">
                <span style="font-size: 24px;"><strong>标题：</strong></span><input id="headline" type="text" placeholder="请输入标题" name="headline" value="">
                <span style="font-size: 24px;"><strong>类型：</strong></span>
                <select name="type_id">
  			<c:forEach items="${list}" var="title">
  				<option value="${title.type_id }"> ${title.type_name }</option>
  			</c:forEach>
				</select>             
                <input style="margin-left:80px; text-align: center;" type="submit" value="提交">
            </h1>
   </div>
    <div class="container" id="ediv1">
     
    </div>
    HTML代码
     <textarea id="text1"  name="article"></textarea>
  </form>

  </body>
  <script type="text/javascript" src="static/js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#ediv1');
         var $text1 = $('#text1')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())
    </script>
</html>
