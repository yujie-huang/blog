<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>出错了</title>
  </head>
  
  <body>
    	对不起，出现错误. <br>
    	<%=exception.getMessage() %>
  </body>
</html>
