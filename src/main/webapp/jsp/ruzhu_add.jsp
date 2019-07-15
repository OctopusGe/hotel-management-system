<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-14
  Time: 00:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="position: relative; width: 350px;margin-left: 40px; font-size: 20px">
    <div class="form-group">
        <label for="roomId">房间号</label>
        <select class="form-control" id="roomId">
            <c:forEach items="${roomList}" var="room">
                <option>${room.roomId}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="userName">用户名</label>
        <input type="text" class="form-control" id="userName" placeholder="请输入用户名">
    </div>

    <div class="form-group">
        <label for="id">身份证号码</label>
        <input type="text" class="form-control" id="id" placeholder="请输入身份证号码">
    </div>


    <div class="form-group">
        <label for="prepay">预付</label>
        <input type="text" class="form-control" id="prepay" placeholder="请输入预付金额">
    </div>


    <input type="button" id="addRuZhuButton" value="添加" class="btn btn-success btn-sm" class="text-left">
    <script>
        $("#addRuZhuButton").click(function () {
            if ($("#roomId").val() == '' || $("#userName").val() == '' ||
                $("#id").val() == '' || $("#prepay").val() == ''){
                alert("请填入完整入住信息！");
            } else {
                var roomId = $("#roomId").val();
                var userName = $("#userName").val();
                var id = $("#id").val();
                var prepay = $("#prepay").val();
                $.ajax({
                    type: 'post',
                    url: 'addRuZhu',
                    data: {
                        roomId: roomId,
                        userName: userName,
                        id: id,
                        prepay: prepay,
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateCode.trim() === '1'){
                            alert("添加成功！");
                            $("#display").load('ruzhu_management.html');
                        } else if (data.stateCode.trim() === '0'){
                            alert("添加失败！");
                        }
                    }
                })
            }

        })
    </script>
</div>
