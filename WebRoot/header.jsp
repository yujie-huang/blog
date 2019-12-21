<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
     <nav id="header"> 
        <div class="floatleft log1">
            <a href="#">code story</a>
        </div>
        <div class="floatleft search1">
            <form action="#" role="search">
                <div >
                    <input type="text"  name="" id="" placeholder="search">
                    <button type="submit" class="btn-default">搜索</button>
                </div>
            </form>
        </div>
        <% 
        if ( session.getAttribute("userName")!=null){
         %>
         <div class='flaotleft'>
         	<a href='articleadd'>添加文章</a>
         </div>
         <div class='floatleft login1'><a href="userinfo">${fullName }</a></div>
         <div class='floatleft register1'> 
         	<a href='loginout'>退出</a>
         </div>
         <% 
         }
         else { 
         %>
          <div class='floatleft login1'> 
          	<a href='login'>登录</a> 
          </div> 
          <div class='floatleft register1'> 
          	<a href='register'>注册</a>
          </div>
        <%} %>
        
    </nav>
