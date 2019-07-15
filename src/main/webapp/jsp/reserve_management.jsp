<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-10
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="panel panel-default" style="margin-top: -8px; height: 790px; margin-left: 10px; margin-right: 40px">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            客房预定列表
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <%--private String roomId;--%>

                <%--private Integer countDate;--%>

                <%--private String userName;--%>

                <%--private String phone;--%>

                <%--private Date presetTime;--%>

                <th>房间号</th>
                <th>用户名</th>
                <th>联系方式</th>
                <th>预约时间</th>
                <th>预约天数</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${reserveList}" var="reserve">
                <tr>
                    <td><c:out value="${reserve.roomId}"></c:out></td>
                    <td><c:out value="${reserve.userName}"></c:out></td>
                    <td><c:out value="${reserve.phone}"></c:out></td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${reserve.presetTime}" timeZone="GMT+8"/>
                        <!-- 转换格式 -->
                    </td>
                    <td><c:out value="${reserve.countDate}"></c:out></td>
                    <td>
                        <a href="#">
                            <button onclick="deleteReserve(<c:out value="${reserve.roomId}"></c:out>)" type="button" class="btn btn-danger btn-sm">
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
    function deleteReserve(roomId){
        $.ajax({
            type: 'post',
            url: 'deleteReserve',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function (data) {
                if (data.stateCode.trim() === '0'){
                    alert("系统错误，删除失败！");
                } else if (data.stateCode.trim() === '1'){
                    alert("已删除！");
                    $("#display").load('reserve_management.html');
                }
            }
        })
    }
</script>