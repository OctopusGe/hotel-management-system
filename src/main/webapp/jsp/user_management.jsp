<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-11
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="panel panel-default" style="margin-top: -8px;height: 790px; margin-left: 20px; margin-right: 40px">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            用户列表
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <%--private Integer userId;--%>

                <%--private String userName;--%>

                <%--private String userPwd;--%>

                <%--private String address;--%>

                <%--private String phone;--%>

                <%--private String email;--%>

                <%--private String qq;--%>

                <%--private String photoUrl;--%>
                <th>用户名</th>
                <th>手机号码</th>
                <th>邮箱地址</th>
                <th>QQ</th>
                <th>家庭住址</th>
                <th>头像</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><c:out value="${user.userName}"></c:out></td>
                    <td><c:out value="${user.phone}"></c:out></td>
                    <td><c:out value="${user.email}"></c:out></td>
                    <td><c:out value="${user.qq}"></c:out></td>
                    <td><c:out value="${user.address}"></c:out></td>
                    <td><c:out value="${user.photoUrl}"></c:out></td>
                    <td>
                        <a href="#">
                            <button onclick="deleteUser('${user.userName}')" type="button" class="btn btn-danger btn-sm">
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

    function deleteUser(userName){
        $.ajax({
            type: 'post',
            url: 'deleteUser',
            data: {
                userName: userName,
            },
            dataType: 'json',
            success: function (data) {
                if (data.stateCode.trim() === '0'){
                    alert("系统错误，删除失败！");
                } else if (data.stateCode.trim() === '1'){
                    alert("已删除！");
                    $("#display").load('user_management.html');
                }
            }
        })
    }
</script>