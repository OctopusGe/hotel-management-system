<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-13
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<%--<c:if test="${!empty succ}">--%>
    <%--<div class="alert alert-danger alert-dismissable">--%>
        <%--<button type="button" class="close" data-dismiss="alert"--%>
                <%--aria-hidden="true">--%>
            <%--&times;--%>
        <%--</button>--%>
            <%--${error}--%>
    <%--</div>--%>
<%--</c:if>--%>
<%--<c:if test="${!empty error}">--%>
    <%--<div class="alert alert-danger alert-dismissable">--%>
        <%--<button type="button" class="close" data-dismiss="alert"--%>
                <%--aria-hidden="true">--%>
            <%--&times;--%>
        <%--</button>--%>
            <%--${error}--%>
    <%--</div>--%>
<%--</c:if>--%>
<div style="position: relative;padding-top: 20px; width: 40%;margin-left: 2%; font-size: 20px">
    <form id="editRoom" >
        <div class="form-group">
            <label for="roomId">房间号</label>
            <input type="text" class="form-control" name="roomId" id="roomId" value="${edit.roomId}" disabled>
        </div>
        <div class="form-group">
            <label for="roomType">类型</label>
            <select class="form-control" id="roomType">
                <c:forEach items="${roomTypeList}" var="roomType">
                    <option>${roomType.type}</option>
                    <c:if test="${roomType.type == edit.roomType}">
                        <option selected="selected">${roomType.type}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="introduce">房间介绍</label>
            <textarea class="form-control" rows="3" name="introduce" id="introduce">${edit.introduce}</textarea>
        </div>

        <div class="form-group">
            <label for="photoUrl">照片</label>
            <input type="file" name="photoUrl" id="photoUrl">
        </div>

        <div class="form-group">
            <label for="area">面积</label>
            <input type="text" class="form-control" name="area" id="area" value="${edit.area}">
        </div>

        <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" name="price" id="price" value="${edit.price}">
        </div>


        <input type="button" id="editRoomButton" value="提交" class="btn btn-success btn-sm" class="text-left">
        <script>
            $("#editRoomButton").click(function () {
                if ($("#roomId").val() == '' || $("#roomType").val() == '' ||
                    $("#introduce").val() == '' || $("#area").val() == '' ||
                    $("#price").val() == '') {
                    alert("请填入完整房间信息！");
                } else {
                    var roomId = $("#roomId").val();
                    var roomType = $("#roomType").val();
                    var introduce = $("#introduce").val();
                    var area = $("#area").val();
                    var price = $("#price").val();
                    $.ajax({
                        type: 'post',
                        url: 'doRoomEdit',
                        data: {
                            roomId: roomId,
                            roomType: roomType,
                            introduce: introduce,
                            area: area,
                            price: price,
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.stateCode.trim() === '1'){
                                alert("修改成功！");
                                $("#display").html("");
                                $("#display").load('room_management.html');
                            } else if (data.stateCode.trim() === '0'){
                                alert("修改失败！");
                            }
                        }
                    })
                }
            })
        </script>
    </form>
</div>
</body>
</html>
