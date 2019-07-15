<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-07
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>酒店管理系统</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style>
        .header{
            width: 1600px;
            line-height: 100px;
            height: 100px;
            margin-left: 160px;
            margin-top: 60px;
            font-size: 60px;
            background-color: #ff5000;
            color: #ffffff;
            text-align: center;
            border-radius: 8px 8px 0px 0px
        }
        .divider{
            width: 1600px;
            height: 3px;
            margin-left: 160px;
            background-color: #ffffff;
        }
        .user-menu{
            width: 1600px;
            line-height: 45px;
            height: 45px;
            margin-left: 160px;
            background-color: #ff5000;
        }
        .user-menu a{
            font-size: 20px;
            color: #000;
            margin-left: 20px;
        }

        .user-search{
            width: 1600px;
            line-height: 45px;
            height: 45px;
            margin-top: 10px;
            margin-left: 160px;
        }

        .user-search a{
            float: right;
            margin-right: 8px;
            font-size: 18px;
        }

        .user-search .price{
            float: left;
            margin-left: 400px;
            font-size: 16px;
        }
        .user-search .start-price{
            float: left;
            width: 60px;
            height: 30px;
            margin-top: 8px;
            margin-left: 10px;
            border-radius: 5px;
        }
        .user-search .fenge{
            float: left;
            margin-left: 10px;
            margin-right: 10px;
        }
        .user-search .end-price{
            float: left;
            width: 60px;
            height: 30px;
            margin-top: 8px;
            border-radius: 5px;
        }
        .user-search #searchButton{
            float: left;
            width: 70px;
            height: 35px;
            line-height: 35px;
            margin-top: 3px;
            margin-left: 20px;
            background-color: #ff9000;
            border-radius: 5px;
        }
        .user-body{
            width: 1600px;
            height: 1000px;
            margin-left: 160px;
            display: flex;
        }
        .user-body .room-list{
            width: 1200px;
            height: 800px;
        }

        .user-body .room-list .room-info{
            float: left;
            width: 350px;
            height: 270px;
            margin-left: 30px;
            margin-top: 30px;
        }

        .user-body .room-list .room-info .img-info{
            height: 230px;
        }
        .user-body .room-list .room-info .room-msg{
            height: 40px;
            line-height: 40px;
            color: #000000;
            font-size: 20px;
            text-align: center;
        }


        .user-body .message{
            width: 380px;
            height: 800px;
            margin-left: 20px;
        }
        .user-body .message .user-login{
            width: 380px;
            height: 300px;
        }

        .user-body .message .notice{
            width: 380px;
            height: 200px;
        }

        #userLoginInfo{
            position: absolute
            font-size: 1.2rem;
            margin-left: 95px;
            margin-top: -0.5rem;
            text-align: right;
            color: red;
        }

        #roomsDisplay{
            height: 650px;
            margin-bottom: 20px;
            overflow: scroll
        }
        .user-body .room-list .panel .room-detail{
            height: 650px;
            border-radius: 0px 0px 8px 8px
        }

        .user-body .room-list .panel .room-detail .img-detail{
            float: left;
            height: 428px;
            width: 600px;
            margin-top: 110px;
            margin-left: 80px;
            /*border: 1px solid #bbb;*/
        }

        .user-body .room-list .panel .room-detail .right-body{
            float: right;
            height: 650px;
            width: 500px;
        }

        .user-body .room-list .panel .room-detail .right-body p{
            font-size: 25px;
            margin-left: 100px;
            margin-right: 100px;
            margin-top: 20px;
        }

        .user-body .room-list .panel .room-detail .right-body .btn-group{
            display: flex;
            margin-top: 40px;
            font-size: 25px;
        }

        #backRoomList{
            background-color: #ff9000;
            width: 80px;
            height: 40px;
            font-size: 20px;
            margin-top: 20px;
            border-radius: 5px;
        }

        #reserveButton{
            background-color: #ff9000;
            width: 80px;
            height: 40px;
            margin-top: 20px;
            font-size: 20px;
            border-radius: 5px;
        }

        #success-info{
            height: 180px;
            line-height: 180px;
            display: none
        }
        #registerInfo{
            font-size: 16px;
            color: red
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#roomsDisplay").show();
            $("#roomDetail").hide();
            $('#myModal').modal('hide');
        })

        function backRoomList() {
            $("#roomsDisplay").show();
            $("#roomDetail").hide();
        }
    </script>
</head>
<body>
<div class="header">
    <p>酒店管理系统</p>
</div>

<div class="divider"></div>

<div class="user-menu">
    <a href="/user_main.html">网站首页</a>
    <c:forEach items="${roomTypeList}" var="roomType">
        <a href="#typeId=<c:out value="${roomType.typeId}"></c:out>&type=<c:out value="${roomType.type}"></c:out>" onclick="showRoomListByType(this)" id="typeId<c:out value="${roomType.typeId}"></c:out>">${roomType.type}</a>
    </c:forEach>
    <a href="#" onclick="showLiuyan()">留言板</a>
</div>
<c:choose>
    <c:when test="${user != null}">
        <script type="text/javascript">

            $(function () {
                $("#userLoginForm").hide();
                $("#success-info").show();
            });

            function showRoomListByType(th) {
                var id = th.id;
                var roomType = document.getElementById(id).innerHTML;
                $.ajax({
                    type: "post",
                    url: "roomsByType",
                    data:{
                        roomType: roomType
                    },
                    dateType: "json",
                    success: function (data) {
                        var str = "";
                        $("#roomsDisplay").html("");
                        for (var i = 0; i < data.roomList.length; i++){
                            str = "<div class=\"room-info\">\n" +
                                "<div class=\"img-info\">\n" +
                                "<img class=\"img-rounded\" onclick=\"showRoomDetail(" + data.roomList[i].roomId + ")\" src=\"" +
                                data.roomList[i].photoUrl + "\" height=\"230\" width=\"350\"/>\n" +
                            "</div>\n" +
                            "<div class=\"room-msg\">\n" +
                            "房间号（" + data.roomList[i].roomId + "）\n" +
                            "</div>\n" +
                            "</div>";
                            $("#roomsDisplay").append(str);
                        }
                        $("#roomDetail").hide();
                        $("#roomsDisplay").show();
                    }
                })
            }

            function showRoomDetail(roomId) {
                $.ajax({
                    type: "post",
                    url: "roomDetail",
                    data: {
                        roomId: roomId,
                    },
                    dataType: "json",
                    success: function (data) {
                        $("#roomImg").attr("src", data.room.photoUrl);
                        $("#roomId").text(data.room.roomId);
                        $("#roomArea").text(data.room.area + "㎡");
                        $("#roomIntroduce").text(data.room.introduce);
                        $("#roomType").text(data.room.roomType);
                        $("#roomPrice").text(data.room.price + "元/天");
                        $("#roomsDisplay").hide();
                        $("#roomDetail").show();
                    }
                });
            }

            function readComment() {
                var roomId = $("#roomId").text();
                //$("#roomComment").load('modal_room_comment.html');
                $.ajax({
                    type: 'post',
                    url: 'roomCommentList',
                    data: {
                        roomId: roomId,
                    },
                    dataType: 'json',
                    success: function () {
                        $("#roomComment").load('room_comment.html');

                    }
                })
            }
            function writeComment() {
                $("#editRoomComment").load('write_comment.html');

            }
        </script>
    </c:when>

    <c:otherwise>
        <script type="text/javascript">
            function showLiuyan() {
                alert("请先登录！！！");
            }

            function showRoomListByType(th) {
                alert("请先登录！！！");
            }
            function showRoomDetail(roomId) {
                alert("请先登录！！！");
            }
            $("#reserveSubmitButton").click(function () {
                    alert("请先登录！！！");
                }
            )
        </script>
    </c:otherwise>
</c:choose>

<div class="user-search">
    <p class="price">价格区间：</p>
    <input class="start-price" id="startPrice" type="text" placeholder="50"/>
    <p class="fenge">--</p>
    <input class="end-price" id="endPrice" type="text" placeholder="5000"/>
    <button id="searchButton">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
        <span style="font-size: 16px;margin-left: 2px; color: #000000">搜索</span>
    </button>
    <a><span class="glyphicon glyphicon-home" aria-hidden="true"></span>个人中心</a>
</div>
<script>
    $("#searchButton").click(function () {
        var startPrice = $("#startPrice").val();
        var endPrice = $("#endPrice").val();
        $.ajax({
            type: "post",
            url: "roomsByPrice",
            data: {
                startPrice: startPrice,
                endPrice: endPrice
            },
            dateType: "json",
            success: function (data) {
                var str = "";
                $("#roomsDisplay").html("");
                for (var i = 0; i < data.roomList.length; i++){
                    str = "<div class=\"room-info\">\n" +
                        "<div class=\"img-info\">\n" +
                        "<img class=\"img-rounded\" onclick=\"showRoomDetail(" + data.roomList[i].roomId + ")\" src=\"" +
                        data.roomList[i].photoUrl + "\" height=\"230\" width=\"350\"/>\n" +
                        "</div>\n" +
                        "<div class=\"room-msg\">\n" +
                        "<p style=\"float: left; margin-left: 100px;\">房间号（" + data.roomList[i].roomId + "）</p>\n" +
                        "<p style=\"float: right; margin-right: 8px\">￥"+ data.roomList[i].price +".00</p>" +
                        "</div>\n" +
                        "</div>";
                    $("#roomsDisplay").append(str);
                }
                $("#roomDetail").hide();
                $("#roomsDisplay").show();
            }
        })
    })
</script>
<div class="user-body">
    <div class="room-list">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="color: #ff9000">
                    精品客房
                </h3>
            </div>

            <div class="room-detail" id="roomDetail">
                <div class="img-detail" id="imgDetail">
                    <img id="roomImg" src="/img/jiudian4.jpg" class="img-rounded" height="428" width="600"/>
                </div>
                <div class="right-body" id="rightMsg">
                    <div style="margin-top: 90px"></div>
                    <p>房间号：<span id="roomId">9999</span></p>
                    <p>类型：<span id="roomType">标准房</span></p>
                    <p>简介：</p>
                    <p><textarea id="roomIntroduce" class="form-control" rows="3" style="background-color: white; font-size: 16px" disabled>环境优美，床褥舒适</textarea></p>

                    <p>面积：<span id="roomArea">100㎡</span></p>
                    <p>房价：<span id="roomPrice">9999元/天</span></p>

                    <div class="comment-msg" style="margin-top: 25px; font-size: 21px">
                        <a href="#" onclick="readComment()" id="readComment" style="float: left; margin-left: 95px"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>查看评论</a>
                        <a href="#" onclick="writeComment()" id="writeComment" style="float: right; margin-right: 140px"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>我要评论</a>
                    </div>

                    <div id="roomComment"></div>
                    <div id="editRoomComment"></div>


                    <div class="btn-group" style="margin-top: 65px">
                        <div class="col-xs-offset-2 col-xs-7">
                            <!-- 按钮触发模态框 -->
                            <button type="button" id="reserveButton" data-toggle="modal" data-target="#myModal">预定</button>
                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                客房预定
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="input-group">
                                                <label for="phone" class="control-label">联系方式:</label>
                                                <input type="text" class="form-control" id="phone">
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <label for="countDate" class="control-label">预定天数:</label>
                                                <input type="text" class="form-control" id="countDate">
                                            </div>
                                            <br>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" onclick="exitModal()" class="btn btn-default" data-dismiss="modal">
                                                取消
                                            </button>
                                            <button type="button" id="reserveSubmitButton" class="btn btn-primary">
                                                提交
                                            </button>
                                            <script type="text/javascript">
                                                $("#reserveSubmitButton").click(function () {
                                                    var roomId1 = $("#roomId").text();
                                                    var userName = $("#sessionUserName").text();
                                                    var countDate = $("#countDate").val();
                                                    var phone = $("#phone").val();
                                                    //alert(roomId1);
                                                    $.ajax({
                                                        type: 'post',
                                                        url: "reservation",
                                                        data: {
                                                            userName: userName,
                                                            roomId: roomId1,
                                                            countDate: countDate,
                                                            phone: phone,
                                                        },
                                                        dataType: 'json',
                                                        success: function (data) {
                                                            if (data.reservationState.trim() === '0') {
                                                                alert(data.msg);
                                                            } else if (data.reservationState.trim() === '1') {
                                                                alert(data.msg);
                                                            } else if (data.reservationState.trim() === '2') {
                                                                alert(data.msg);
                                                            }
                                                            setTimeout($('#myModal').modal('hide'), 500);
                                                        }
                                                    })
                                                })
                                            </script>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </div>
                        <div class="col-xs-12">
                            <button type="button" id="backRoomList" onclick="backRoomList()">返回</button>
                        </div>
                    </div>
                </div>
            </div>

            <%--private String roomId;--%>

            <%--private String roomType;--%>

            <%--private Integer area;--%>

            <%--private String introduce;--%>

            <%--private String photoUrl;--%>

            <%--private BigDecimal price;--%>
            <div class="panel-body" id="roomsDisplay">
                <c:forEach items="${roomList}" var="room">
                    <div class="room-info">
                        <div class="img-info">
                            <img class="img-rounded" onclick="showRoomDetail(${room.roomId})" src="${room.photoUrl}" height="230" width="350"/>
                        </div>
                        <div class="room-msg">
                            <p style="float: left; margin-left: 100px">房间号（${room.roomId}）</p>
                            <p style="float: right; margin-right: 8px">￥${room.price}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="message">
        <div class="user-login">
            <div class="panel panel-default" id="login">
                <div class="panel-heading">
                    <h3 class="panel-title text-center" style="color: #ff9000">用户登录</h3>
                </div>
                <div class="panel-body">
                    <div id="success-info">
                        <p style="margin-left: 85px">
                            欢迎您！
                            <span id="sessionUserName">${user.userName}</span>

                            <span>
                                <a href="/userLogout.html" style="margin-left: 15px">安全退出</a>
                            </span>

                        </p>
                    </div>
                    <form class="form-horizontal" id="userLoginForm">
                        <div class="form-group" style="margin-top: 20px">
                            <label for="userName" class="col-xs-3 control-label">用户名:</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" id="userName" placeholder="Account">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userPwd" class="col-xs-3 control-label">密码:</label>
                            <div class="col-xs-8">
                                <input type="password" class="form-control" id="userPwd" placeholder="Password">
                            </div>
                        </div>
                        <!--<div class="form-group">-->
                        <!--<div class="col-xs-offset-2 col-xs-10">-->
                        <!--    <div class="checkbox">-->
                        <!--        <label>-->
                        <!--            <input type="checkbox"> Remember me-->
                        <!--        </label>-->
                        <!--    </div>-->
                        <!--</div>-->
                        <!--</div>-->
                        <p id="userLoginInfo"></p>
                        <div class="form-group" style="display: flex">
                            <div class="col-xs-offset-3 col-xs-8" style="margin-top: 20px">
                                <button type="button" class="btn" id="userLoginButton" style="background-color: #ff9000">登录</button>
                            </div>
                            <div class="col-xs-12" style="margin-top: 20px">
                                <!-- 按钮触发模态框 -->
                                <button type="button" class="btn" id="userRegisterButton" data-toggle="modal" data-target="#userRegisterModal" style="background-color: #ff9000">注册</button>
                                <!-- 模态框（Modal） -->
                                <div class="modal fade" id="userRegisterModal" tabindex="-1" role="dialog" aria-labelledby="userRegisterModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                                </button>
                                                <h4 class="modal-title" id="userRegisterModalLabel">
                                                    注册用户
                                                </h4>
                                            </div>
                                            <div class="modal-body">

                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="registerUserName" class="col-sm-2 col-sm-offset-2 control-label">用户名:</label>
                                                        <div class="col-sm-6">
                                                            <input type="email" class="form-control" id="registerUserName">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerPhone" class="col-sm-2 col-sm-offset-2 control-label">手机号码:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerPhone">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerEmail" class="col-sm-2 col-sm-offset-2 control-label">邮箱:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerEmail">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerQQ" class="col-sm-2 col-sm-offset-2 control-label">QQ号码:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerQQ">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerPhotoUrl" class="col-sm-2 col-sm-offset-2 control-label">头像:</label>
                                                        <div class="col-sm-6" style="margin-top: 8px">
                                                            <input type="file" id="registerPhotoUrl">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerAddress" class="col-sm-2 col-sm-offset-2 control-label">家庭住址:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerAddress">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerPwd" class="col-sm-2 col-sm-offset-2 control-label">密码:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerPwd">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="registerRePwd" class="col-sm-2 col-sm-offset-2 control-label">确认密码:</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="registerRePwd">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-sm-offset-3">
                                                        <p id="registerInfo"></p>
                                                    </div>
                                                    <%--<div class="form-group">--%>
                                                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                                            <%--<div class="checkbox">--%>
                                                                <%--<label>--%>
                                                                    <%--<input type="checkbox"> Remember me--%>
                                                                <%--</label>--%>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="form-group">--%>
                                                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                                            <%--<button type="submit" class="btn btn-default">Sign in</button>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                </form>
                                            </div>
                                            <div class="modal-footer" style="margin-top: 20px">
                                                <button type="button" id="registerSubmitButton" class="btn btn-primary">
                                                    提交
                                                </button>
                                                <button type="button" onclick="exitModal()" class="btn btn-default" data-dismiss="modal">
                                                    取消
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $("#registerSubmitButton").click(function () {
                var userName = $("#registerUserName").val();
                var phone = $("#registerPhone").val();
                var email = $("#registerEmail").val();
                var qq = $("#registerQQ").val();
                var photoUrl = $("#registerPhotoUrl").val();
                var address = $("#registerAddress").val();
                var userPwd = $("#registerPwd").val();
                var userRePwd = $("#registerRePwd").val();
                setTimeout(function () {
                    $("#registerInfo").text("");
                },3000);
                if (userName == '') {
                    $("#registerInfo").text("提示：用户名不能为空！");
                } else if (userPwd == '') {
                    $("#registerInfo").text("提示：密码不能为空！");
                } else if (userPwd != userRePwd) {
                    $("#registerInfo").text("提示：两次密码不一致！");
                } else {
                    $.ajax({
                        type: 'post',
                        url: 'userRegister',
                        data: {
                            userName: userName,
                            phone: phone,
                            email: email,
                            qq: qq,
                            photoUrl: photoUrl,
                            address: address,
                            userPwd: userPwd
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.registerState.trim() === '0'){
                                alert("系统错误，注册失败！")
                            } else if (data.registerState.trim() === '1'){
                                alert("注册成功！！！");
                                $("#userRegisterModal").modal('hide');
                                window.location.href("user_main.html");
                            } else if (data.registerState.trim() === '2'){
                                $("#registerInfo").text("提示：该用户名已经被注册！");
                            }
                        }
                    })
                }

            });
            $("#userLoginButton").click(function () {
                var userName = $("#userName").val();
                var userPwd = $("#userPwd").val();
                if (userName == '') {
                    $("#userLoginInfo").text("提示：账号不能为空！");
                } else if (userPwd == '') {
                    $("#userLoginInfo").text("提示：密码不能为空！");
                } else {
                    $.ajax({
                        type: "post",
                        url: "/userLoginCheck",
                        data:{
                            userName: userName,
                            userPwd: userPwd
                        },
                        dateType: "json",
                        success: function (data) {
                            if (data.stateCode.trim() === "0"){
                                $("#userLoginInfo").text("提示：账号或密码错误！");
                            } else if (data.stateCode.trim() === "1"){
                                alert("登录成功！");
                                window.location.href="user_main.html";
                            }
                        }
                    })
                }
            })
        </script>
        <div class="notice">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style="color: #ff9000">
                        网站公告
                    </h3>
                </div>
                <div class="panel-body">
                    <c:forEach items="${noticeList}" var="notice">
                        <div>
                        <a href="#">
                                <fmt:formatDate value="${notice.releaseTime}" type="date"/>
                                <span style="margin-left: 20px">${notice.notice}</span>
                        </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

