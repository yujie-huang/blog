<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
	<base href="<%=basePath%>">
	    <title>主页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="static/css/header.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/footer.css">
    
</head>
<body>
   	<%@ include file="header.jsp" %>
    <div id="content" class="container">
    
           <c:forEach items="${list }" var="article">
           
            <div class="card" style="margin-top:1%;">
            	<div class="card-body">
     				<a href="getarticlebyid?ID=${article.article_id }">
     				 <h4 class="card-title">${article.headline }</h4>
     				</a>
     				 <p class="card-text ">${fn:substring(article.content,0,66)}......</p>
     				 
      				 <a href="getuserbyid?ID=${article.userName }" class="card-link">BY· ${article.fullName }</a>
      				 <a href="getarticlebytitle?typeID=${article.type_id }&userName=${article.userName}" class="card-link">#${article.type_name }</a>
    			</div>
            </div>
            </c:forEach>
  
    </div>

 <%@ include file="footer.jsp" %>

</body>

 	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
<script>

	
</script>

</html>
