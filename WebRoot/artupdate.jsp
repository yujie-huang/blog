<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
        <title>修改文章</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">


	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/css/usercenter.css">
	<link rel="stylesheet" href="static/css/header.css">
	  <link rel="stylesheet" href="static/css/footer.css">


  </head>
 
 <%@ include file="header.jsp"%>
 <div class="content">
		<%@ include file="usercenterTP.jsp" %>
		<div class="right-bar1 ">
		
		<form action="artupdate" method="post" class="" style="margin-top:10px;width:90%;margin-left:1%;">
  			<div id="titlediv">
            	ID：<input type="text" value="${article.article_id }" style="border:0;outline:none;" readonly="readonly"  name="article_id">
                <span style="font-size: 20px;">标题：</span>
                <input id="headline" type="text"  placeholder="请输入标题" name="headline" value="${article.headline }">
                <span style="font-size: 20px;"><strong>类型：</strong></span>
                <select name="type_id">
  			<c:forEach items="${list}" var="title">
  				<option value="${title.type_id }"> ${title.type_name }</option>
  			</c:forEach>
				</select>             
                <input style="margin-left:80px; text-align: center;" type="submit" class="btn btn-success btn-sm" value="提交">
            
   			</div>
   			 	<div class="" id="ediv1">
     				${article.content }
    			</div>
    		<div class="form-group">
    			<textarea id="text1"  name="article" class="form-control" style=" flex-wrap:wrap"></textarea>
    		</div>	
     		
  		</form>
	</div>
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
