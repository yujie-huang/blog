<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>My JSP 'usermanage.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/admin.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.2.1.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	

  </head>
  
  <body>
    <%@ include file="adminheader.jsp" %>  
    <%@ include file="adminMenu.jsp" %> 
    
    <div class="right-content">
        <table class="table table-dark table-hover" >
            <thead>
                <tr>
                	<th>check</th>
                    <th>username</th>
                    <th>fullname</th>
                    <th>gender</th>
                    <th>birthday</th>
                    <th>phone</th>
                    <th>Email</th>
                    <th>wechat</th>
                    <th>information</th>
                    <th>register date</th>
                    <th>statue</th>
                    <th>more</th>
                    <th><button class="btn btn-outline-primary">add+</button></th>


                </tr>
            </thead>
            <tbody>
            <% 
            	List<User> list =(List<User>) request.getAttribute("list");
            	for(User user: list){
            %>
                <tr>
                    <td><input type="checkbox" name="userName" value="<%= user.getUserName() %>"></td>
                    <td><%= user.getUserName() %></td>
                    <td><%= user.getFullName() %></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
          
            </tbody>
        </table>


    </div>
    
    
  </body>
</html>
