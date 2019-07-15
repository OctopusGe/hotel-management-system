<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-12
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="margin-top: -8px; margin-left: 10px; width: 500px">
    <div class="panel panel-default" >
    <%--<div class="panel-heading">--%>
        <%--<h3 class="panel-title">--%>
            <%--全部房间类型--%>
        <%--</h3>--%>
    <%--</div>--%>
    <div class="panel-body" style="height: 600px; overflow: scroll">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>类型号</th>
                <th>名称</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${roomTypeList}" var="roomType">
                <tr>
                    <td>${roomType.typeId}</td>
                    <td>${roomType.type}</td>
                    <td>
                        <a href="#">
                            <button onclick="deleteRoomType(${roomType.typeId})" type="button" class="btn btn-danger btn-sm">
                                删除
                            </button>
                        </a>
                    </td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="panel-footer" style="background-color: #ffffff">
        <!-- 按钮触发模态框 -->
        <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#addRoomModal">添加</button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" style="margin-top: 250px" id="addRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加客房类型</h4>
                    </div>
                    <div class="modal-body">

                        <input type="text" class="form-control" id="roomType" placeholder="请输入客房类型">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="addRoomType" class="btn btn-primary">提交</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>

</div>
</div>
<script type="text/javascript">

    function deleteRoomType(typeId){
        $.ajax({
            type: 'post',
            url: 'deleteRoomType',
            data: {
                typeId: typeId,
            },
            dataType: 'json',
            success: function (data) {
                if (data.stateCode.trim() === '0'){
                    alert("系统错误，删除失败！");
                } else if (data.stateCode.trim() === '1'){
                    alert("已删除！");
                    $("#display").load('room_type_info.html');
                }
            }
        })
    }

    $("#addRoomType").click(function (){
        var type = $("#roomType").val();
        if (type == ''){
            alert("房间类型不能为空！");
        } else {
            $.ajax({
                type: 'post',
                url: 'addRoomType',
                data: {
                    type: type,
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateCode.trim() === '0') {
                        alert("系统错误，添加失败！");
                        $("#addRoomModal").modal('hide');
                    } else if (data.stateCode.trim() === '1') {
                        alert("添加成功！");
                        $("#addRoomModal").modal('hide');
                    }
                }
            })
        }
    })
</script>
