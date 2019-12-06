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
    <link rel="stylesheet" href="./bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
   	<jsp:include  page="header.jsp"/>
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

            <!-- <div class="panel panel-primary">
                    <div class=" panel-heading" >
                        <h2 class="panel-title">Follow your heart</h2>
                    </div>
                    <div class="panel-body">
                        <p>
                            “Your time is limited...                                                                         –Steve Jobs
                        </p>
                    </div>
                    <div  class="panel-footer"> 
                        <div class="img1 float-left">头像</div>
                        <div class="user1 float-left">昵称</div>
                        <div class="commit1">标签</div>
                    </div>
            </div> -->

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
                           
                            <div class="user1 float-left">昵称</div>
                            <div class="commit1">标签</div>
                        </div>
                    </div>

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
                                
                                <div class="user1 float-left">昵称</div>
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
   <jsp:include  page="footer.jsp"/>



</body>
</html>
