<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
       <div class="left-bar1">
           <div class="card" style="margin-left:5%;margin-top:10px">
          <span id="hello" style="margin-left:10px;margin-top:10px">${fullName}您好！</span>
           <br>
            <label><h4>&nbsp;账号管理:</h4></label>
                <ul class="list list-group">
                    <li class="list-group-item"><a href="infomodify">资料修改</a></li>
                    <li class="list-group-item"><a href="repassword">密码修改</a></li>
                    <li class="list-group-item"><a href="#">注销申请</a></li>
                </ul>
                <br>
            <label><h4>&nbsp;文章管理:</h4></label>
                <ul class="list list-group">
                    <li class="list-group-item"><a href="articleadd">写文章</a></li>
                    <li class="list-group-item"><a href="personalArticlesmanage">管理文章</a></li>
                    <li class="list-group-item"><a href="titleupdate">管理文章类型</a></li>
                </ul>  
                <br>
            
            </div>       
        </div> 
