<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-04
  Time: 09:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>酒店管理系统</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style>
        #login{
            margin-top: 12%;
            display: block;
        }
    </style>
</head>
<body background="../img/jiudian2.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%; background-attachment: fixed;">

<div class="container-fluid" style="padding: 0em">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid nav-con">
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-top: 1rem; padding-left: 5rem; color: #dfe4e6">
                    <span style="font-size: 3rem;padding-right: 2rem;letter-spacing: 5px">酒店管理系统</span>
                </a>
            </div>
        </div>
    </nav>
    <div class="panel panel-default col-xs-4 col-xs-offset-4 col-sm-4 col-sm-offset-6 col-md-2 col-md-offset-8" id="login">
        <div class="panel-heading" style="background-color: #ffffff;">
            <h3 class="panel-title text-center">登录</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="adminName">账号</label>
                <input type="text" class="form-control" id="adminName" name="adminName" placeholder="请输入账号">
            </div>
            <div class="form-group">
                <label for="adminPwd">密码</label>
                <input type="password" class="form-control" id="adminPwd" name="adminPwd" placeholder="请输入密码">
            </div>
            <p style="font-size: 1.2rem; margin-top: -0.3rem; text-align: right; color: red; position: absolute" id="adminLoginInfo"></p>
            <br>
            <button id="adminLoginButton"  class="btn btn-primary btn-block">登陆</button>
        </div>
    </div>
    <script>
        $("#adminLoginButton").click(function () {
            var adminName = $("#adminName").val();
            var adminPwd = $("#adminPwd").val();
            if (adminName == '') {
                $("#adminLoginInfo").text("提示：账号不能为空！");
            } else if (adminPwd == '') {
                $("#adminLoginInfo").text("提示：密码不能为空！");
            } else {
                $.ajax({
                    type: "post",
                    url: "/adminLoginCheck",
                    data:{
                        adminName: adminName,
                        adminPwd: adminPwd
                    },
                    dateType: "json",
                    success: function (data) {
                        if (data.stateCode.trim() === "0"){
                            $("#adminLoginInfo").text("提示：账号或密码错误！");
                        } else if (data.stateCode.trim() === "1"){
                            $("#adminLoginInfo").text("提示：登录成功，跳转中....");
                            window.location.href="admin_main.html";
                        }
                    }
                })
            }
        })
    </script>
</div>
</body>
</html>
