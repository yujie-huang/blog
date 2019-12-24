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
    
    <title>修改文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
		<script src="static/js/jquery-3.3.1.min.js"></script>
    	<script src="static/js/bootstrap.min.js"></script>
	   <link rel="stylesheet" href="static/css/index.css">
	   <link rel="stylesheet" href="static/css/usercenter.css">
	  


  </head>
 
 <%@ include file="header.jsp"%>
	<div class="content">
		<div class="left-bar1">
		<%@ include file="usercenterTP.jsp" %>
		</div>
		<div class="right-bar1 ">
		<form action="artupdate" method="post" class="container" >
  <div id="titlediv">
  				ID：<input type="text" value="${article.article_id }" readonly="readonly" name="article_id">
                <span style="font-size: 24px;"><strong>标题：</strong></span><input id="headline" type="text" placeholder="请输入标题" name="headline"  value="${article.headline }">
                <span style="font-size: 24px;"><strong>类型：</strong></span>
                <select name="type_id" class="selector" >
  			<c:forEach items="${list}" var="title">
  				<option value="${title.type_id }"> ${title.type_name }</option>
  			</c:forEach>
				</select>             
                <input style="margin-left:80px; text-align: center;" type="submit" value="提交">
            </h1>
   </div>
    <div class="container" id="ediv1">
	${article.content }
    </div>
    HTML代码
     <textarea id="text1"  name="article"></textarea>
  </form>
	</div>
	<%@ include file="footer.jsp"%>
  </body>
   <p id="art_title_id"  style="visibility: hidden;">${article.type_id }</p>
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
