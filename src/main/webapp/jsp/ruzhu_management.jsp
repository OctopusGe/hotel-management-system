<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-13
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-default" style="margin-top: -8px; height: 790px; margin-left: 20px; margin-right: 40px">
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>房间号</th>
                <th>用户名</th>
                <th>身份证号码</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>预付</th>
                <th>实付</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <%--private String roomId;--%>

            <%--private String userName;--%>

            <%--private String id;--%>

            <%--private Date startTime;--%>

            <%--private Date endTime;--%>

            <%--private BigDecimal prepay;--%>

            <%--private BigDecimal payment;--%>

            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td><c:out value="${order.roomId}"></c:out></td>
                    <td><c:out value="${order.userName}"></c:out></td>
                    <td><c:out value="${order.id}"></c:out></td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.startTime}" timeZone="GMT+8"/>
                        <!-- 转换格式 -->
                    </td>
                    <td> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.endTime}" timeZone="GMT+8"/>
                        <!-- 转换格式 -->
                    </td>
                    <td><c:out value="${order.prepay}"></c:out></td>
                    <td><c:out value="${order.payment}"></c:out></td>
                    <td>
                    <c:choose>
                        <c:when test="${!empty order.endTime}">

                            <a href="#">
                                <button type="button" onclick="deleteRuZhu('${order.roomId}')" class="btn btn-danger btn-sm">
                                    删除
                                </button>
                            </a>

                        </c:when>
                        <c:otherwise>
                            <a href="#">
                                <button onclick="checkout('${order.roomId}')" type="button" class="btn btn-success btn-sm">
                                    结账
                                </button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="showCheckoutModal"></div>
</div>

<script type="text/javascript">
    function checkout(roomId) {
        $.ajax({
            type: 'post',
            url: 'checkout',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function () {
                $("#showCheckoutModal").load("ruzhu_checkout.html");
            }
        })
    }

    function deleteRuZhu(roomId) {
        $.ajax({
            type: 'post',
            url: 'deleteRuZhu',
            data: {
                roomId: roomId,
            },
            dataType: 'json',
            success: function () {
                alert("已删除");
                $("#display").load('ruzhu_management.html');
            }
        })
    }

</script>