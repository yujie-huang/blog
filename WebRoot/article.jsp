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
    <title>文章</title>
    <link rel="stylesheet" href="./bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/article.css">
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
                    <button type="submit" class="btn-default"> 搜索</button>
                </div>
            </form>
        </div>
        <div class="floatleft login1">
            <a href="#">登录</a>
        </div>
        <div class="floatleft register1">
            <a href="#">注册</a>
        </div>
    </nav>
    <div id="content" class="container">
        <div class="leftcontent floatleft">
            <div class="article">
                <div>2019/9/10·by huangyujie</div>
                <div>
                    <h1>follow your heart</h1>
                </div>
                <div>
                        “Your time is limited, don’t waste it living someone else’s life. Don’t be trapped by dogma（教条）, which is living the result of other people’s thinking. Don’t let the noise of other opinions drown your own inner voice. And most important, have the courage to follow your heart and intuition（直觉）, they somehow already know what you truly want to become. Everything else is secondary.”
                        –Steve Jobs
                </div>
                <div>未分类</div>
            </div>
            <div>
                <div>
                    <h2>发表评论</h2>
                </div>
                <div>
                    <form action="">
                        评论：<br>
                        <textarea name="" id="" cols="100" rows="10"></textarea>
                        <br>
                        <button class="danger btn btn-primary">发表评论</button>
                    </form>
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
    <div id="footer">
        <hr>
        &copy;2019
    </div>



</body>
</html>