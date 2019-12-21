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
    <title>主页</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/index.css">
</head>
<body>
   	<%@ include file="header.jsp" %>
    <div id="content" class="container">
        <div class="leftcontent floatleft">
            
            <div class="articles">
                <div class="header" >
                    <h2>Follow your heart</h2>
                </div>
                <div class="words">
                    <p>
                        “Your time is limited...                                                                         –Steve Jobs
                    </p>
                </div>
                <div>
                    <div class="user1 float-left">账户</div>
                    <div class="commit1">标签</div>
                </div>
            </div>
        </div>
        <div class="rightcontent floatleft">
            <div>
                近期添加。。。<br>
            </div>
            <div>

            </div>
        </div>
        
    </div>
   <%@ include file="footer.jsp" %>



</body>
</html>
