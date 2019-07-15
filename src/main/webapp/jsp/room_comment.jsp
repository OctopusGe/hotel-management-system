<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-11
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style>
        #commentDisplay p{
            margin-left: 0px;
            margin-top: 5px;
            font-size: 21px
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#roomCommentModal").modal('show');
        })
    </script>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="roomCommentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 200px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="commentModalLabel">
                    评论列表
                </h4>
            </div>
            <div class="modal-body" id="commentDisplay" style="height: 400px; overflow: scroll">
                <c:forEach items="${commentList}" var="commemt">
                    <p>
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commemt.releaseTime}" timeZone="GMT+8"/>
                        <!-- 转换格式 -->
                        <span class="col-sm-offset-1">用户:</span>
                        <span style="margin-left: 5px">${commemt.userName}</span>
                    </p>
                    <p>
                        内容:
                        <span style="margin-left: 5px">${commemt.content}</span>
                    </p>
                    <div style="background-color: #2e6da4; height: 1px"></div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
