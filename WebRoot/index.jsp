<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/footer.css">
    
</head>
<body>
	<div class="header">
   	<%@ include file="header.jsp" %>
   	</div>
    <div id="content" class="container">
        <div class="leftcontent floatleft" id="art">
           <c:forEach items="${list }" var="article">
           
            <div class="articles">
                <div class="header" >
                   <a href="getarticlebyid?ID=${article.article_id }"> <h2>${article.headline }</h2></a>
                </div>
                <div>
                    <div class="user1 float-left"><a href="getuserbyid?ID=${article.userName }">用户：${article.fullName }</a></div>
                    <div class="commit1"><a href="getarticlebytitle?typeID=${article.type_id }&userName=${article.userName}">类型：${article.type_name }</a></div>
                </div>
            </div>
            </c:forEach>
        </div>
      
        
    </div>
    <div class="footer">
     <%@ include file="footer.jsp" %>
    </div>

</body>
<script>
	$(function(){
		var length=$('#art').children('div').length;
		console.log(length)
		$("#content").css("height",length * 150); //高度动态变化
	
	
	});
	
</script>

</html>
