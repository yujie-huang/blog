<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<title>文章</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/article.css">
    <link rel="stylesheet" href="static/css/header.css">
    <link rel="stylesheet" href="static/css/footer.css">
</head>
<body>
   <%@ include file="header.jsp" %>
   
    <div id="content" class="container" style="margin-top:20px">
            <div class="article">
                <div>${article.publish_date}·by <a href="getuserbyid?ID=${article.userName }">${article.fullName }</a>
                	&nbsp;
                	<a href="getarticlebytitle?typeID=${article.type_id }&userName=${article.userName}">
                		#${article.type_name }
               		 </a>
                </div>
                <div>
                    <h1>${article.headline }</h1>
                </div>
                <div>
                      ${ article.content }
                </div>
            </div>
  
       
        
    </div>
    <%@ include file="footer.jsp" %>



</body>
</html>
