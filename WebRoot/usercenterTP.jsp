<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <div class="content">
       <div class="left-bar1">
           <span id="hello">${fullName}您好！</span>
           <br>
           <br>
           <br>
           <div class="li1">
            <label>账号管理</label>
                <ul class="list">
                    <li><a href="infomodify">资料修改</a></li>
                    <li><a href="repassword">密码修改</a></li>
                    <li><a href="#">注销申请</a></li>
                </ul>
                <br>
            <label>文章管理</label>
                <ul class="list">
                    <li><a href="articleadd">写文章</a></li>
                    <li><a href="personalArticlesmanage">管理文章</a></li>
                </ul>  
                <br>
            <a href="titleupdate">文章类型管理</a>
            </div>       
        </div> 

    </div>
