<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-08
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>酒店管理系统后台</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }
        .management{
            height: 810px;
            width: 100%
        }
        .menu-main{
            float: left;
            background-color: #22a837;
            height: 800px;
            width: 315px;
            padding: 15px;
            margin-left: 15px;
            border-radius: 8px;
        }
        .menu-body{
            background-color: #22a837;
            height: 770px;
            width: 285px;
            overflow: scroll
        }
        .display{
            float: none;
            height: 600px;
            width: 1540px;
            padding: 10px;
            margin-left: 350px;
        }
        #list li a{
            background-color:#22a837;
            font-size: 10px;
            margin-top: 8px;
            margin-left: 10px;
            color: #000000
        }
        #title{
            font-size: 36px;
            margin-top: 10px;
            margin-left: 50px
        }
        .warm-prompt{
            height: 300px;
            width: 300px;
            position: relative
        }
        .warm-prompt-text{
            background-color: #ea68a2;
            color: #000000;
            position: absolute;
            left: 0;
            top: 40%;
            width: 100%;
            margin-left: 275px;
            text-align: center;
            font-size: 25px;
            margin-top:-9px
        }

        .close-modal{
            float: right;
            font-size: 20px;
            font-weight: 700;
            line-height: 1;
            color: #ea68a2;
            text-shadow: 0 1px 0 #fff;
            filter: alpha(opacity=80);
            opacity: 0.8;
            width: 80px;
            height: 40px;
            margin-right: 40px;
            margin-top: -70px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<nav class="navbar" style="background-color: #22a837; margin-top: 0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <p id="title">酒店管理系统</p>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right" id="list">
                <li><p style="font-size: 20px; margin-top: 20px">你好！系统管理员</p></li>
                <li style="margin-right: 20px"><a href="/adminLogout.html">注销登录</a></li>
            </ul>
        </div>
    </div>
</nav>
<script>
    $(function () {
        $("#myModal").modal('show');
        $("#list li a").on("click", function () {
            $(this).css("color", "red");
        });
    });

    function reserveManagement() {
        $("#display").html("");
        $("#display").load('reserve_management.html');
    }

    function userInfoManagement() {
        $("#display").html("");
        $("#display").load('user_management.html');
    }

    function addRoomInfo() {
        $("#display").html("");
        $("#display").load('room_add.html');
    }
    function addRoomTypeInfo() {
        $("#display").html("");
        $("#display").load('room_type_info.html');
    }

    function roomManagement() {
        $("#display").html("");
        $("#display").load('room_management.html');
    }

    function ruzhuManagement() {
        $("#display").html("");
        $("#display").load('ruzhu_management.html');
    }

    function ruzhuAdd() {
        $("#display").html("");
        $("#display").load('ruzhu_add.html');
    }
</script>
<div class="management">
    <div class="menu-main">
        <div  class="menu-body">
            <div class="panel-group" id="shoufengqing">
                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div1" class="panel-heading">
                        <h3 class="panel-title text-center">修改个人密码</h3>
                    </div>
                    <div id="div1" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#">修改密码</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div2" class="panel-heading">
                        <h3 class="panel-title text-center">会员信息管理</h3>
                    </div>
                    <div id="div2" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#" onclick="userInfoManagement()">会员信息管理</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div3" class="panel-heading">
                        <h3 class="panel-title text-center">客房信息管理</h3>
                    </div>
                    <div id="div3" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#" onclick="addRoomTypeInfo()">客房信息类型</a></li>
                            <li><a href="#" onclick="roomManagement()">客房信息管理</a></li>
                            <li><a href="#" onclick="addRoomInfo()">客房信息添加</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div4" class="panel-heading">
                        <h3 class="panel-title text-center">预定信息管理</h3>
                    </div>
                    <div id="div4" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#" onclick="reserveManagement()">预定信息管理</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div5" class="panel-heading">
                        <h3 class="panel-title text-center">入住信息管理</h3>
                    </div>
                    <div id="div5" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#" onclick="ruzhuManagement()">入住信息管理</a></li>
                            <li><a href="#" onclick="ruzhuAdd()">入住信息添加</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div6" class="panel-heading">
                        <h3 class="panel-title text-center">公告信息管理</h3>
                    </div>
                    <div id="div6" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#">公告信息管理</a></li>
                            <li><a href="#">公告信息添加</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div7" class="panel-heading">
                        <h3 class="panel-title text-center">留言板-管理</h3>
                    </div>
                    <div id="div7" class="collapse in">
                        <div class="panel-body">
                            <li><a href="#">留言板—管理</a></li>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#div8" class="panel-heading">
                        <h3 class="panel-title text-center">安全退出系统</h3>
                    </div>
                    <div id="div8" class="collapse in">
                        <div class="panel-body">
                            <li><a href="/adminLogout.html">安全退出系统</a></li>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="display" id="display">
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-hidden="true" style="margin-top: 250px">
            <div class="modal-dialog">
                <div class="modal-content">

                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            style="font-size: 30px;margin-right: 20px; margin-top: 10px">×
                    </button>

                    <div class="warm-prompt">
                        <img style="float: left; opacity: 0.8" alt="Norway" class="img-rounded" src="/img/notice3.jpg"/>
                        <div class="warm-prompt-text">
                            用完系统后，请安全退出!
                        </div>
                    </div>

                    <button type="button" class="close-modal" data-dismiss="modal">
                        知道了
                    </button>

                </div>
            </div>
        </div>
        <!-- 模态框（Modal） 结尾-->
    </div>
</div>
</body>
</html>