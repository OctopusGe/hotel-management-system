<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-13
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<html>--%>
<%--<head>--%>
    <%--<title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

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


<div class="panel panel-default" style="margin-top: -8px; height: 790px; margin-left: 20px; margin-right: 40px">
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <!--         private String roomId;-->

                <!--         private String roomType;-->

                <!--         private Integer area;-->

                <!--         private String introduce;-->

                <!--         private String photoUrl;-->

                <!--         private BigDecimal price;-->

                <th>房间号</th>
                <th>类型</th>
                <th>房间介绍</th>
                <th>图片</th>
                <th>面积</th>
                <th>房价</th>
                <th>管理评论</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${roomList}" var="room">
                    <tr>
                        <td><c:out value="${room.roomId}"></c:out></td>
                        <td><c:out value="${room.roomType}"></c:out></td>
                        <td><c:out value="${room.introduce}"></c:out></td>
                        <td><c:out value="${room.photoUrl}"></c:out></td>
                        <td><c:out value="${room.area}"></c:out></td>
                        <td><c:out value="${room.price}"></c:out></td>
                        <td>
                            <a href="#">
                                <button onclick="commentManagement('${room.roomId}')" type="button" class="btn btn-info btn-sm">
                                    管理评论
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <button onclick="editRoom('${room.roomId}')" type="button" class="btn btn-success btn-sm">
                                    编辑
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <button type="button" onclick="deleteRoom('${room.roomId}')" class="btn btn-danger btn-sm">
                                    删除
                                </button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">

    function commentManagement(roomId) {
        $.ajax({
            type: 'post',
            url: 'geRoomComment',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function () {
                //$("#display").html("");
                $("#display").load('comment_management.html');
            }
        })
    }

    function editRoom(roomId) {
        $.ajax({
            type: 'post',
            url: 'getEditRoom',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function () {
                //$("#display").html("");
                $("#display").load('room_edit.html');
            }
        })
    }

    function deleteRoom(roomId){
        $.ajax({
            type: 'post',
            url: 'deleteRoom',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function (data) {
                if (data.stateCode.trim() === '0'){
                    alert("系统错误，删除失败！");
                } else if (data.stateCode.trim() === '1'){
                    alert("已删除！");
                    //$("#display").html("");
                    $("#display").load('room_management.html');
                }
            }
        })
    }
</script>
<%--</body>--%>
<%--</html>--%>
