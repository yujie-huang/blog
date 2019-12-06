<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./umeditor-1.2.3/umeditor.config.js"></script>
	<script type="text/javascript" src="./umeditor-1.2.3/gruntfile.js"></script>
	<script type="text/javascript" charset="utf-8" src="./umeditor-1.2.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
               var ue = UE.getEditor('editor');
      </script>
	<link rel="stylesheet" type="text/css" href="">

  </head>
  
  <body style="align:center;">
  <form action="articleadd" method="post" class="container" style="align:center;">
  <div id="titlediv">
            <h1 style="text-align: center;margin-top:10px">
                <span style="font-size: 24px;"><strong>标题：</strong></span><input id="headline" type="text" placeholder="请输入标题" name="headline" value="">
                <span style="font-size: 24px;"><strong>类型：</strong></span>
                <select name="type_id">
  				<option value ="Volvo">Volvo</option>
  				<option value ="Saab">Saab</option>
  				<option value="Opel">Opel</option>
  				<option value="Audi">Audi</option>
				</select>             
                <input style="margin-left:80px; text-align: center;" type="submit" value="提交">
            </h1>
   </div>
    <div style="align:center;" class="container">
      <textarea id="projectBasis" class="editor" style="width:630px;height:220px;" name="article"></textarea>
    </div>
  </form>

  </body>
  <script type="text/javascript">
	
 
</script>
</html>
