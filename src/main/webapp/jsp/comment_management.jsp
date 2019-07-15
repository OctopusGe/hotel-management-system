<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-14
  Time: 08:25
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
                    评论管理
                </h4>
            </div>
            <div class="modal-body" id="commentDisplay" style="height: 400px; overflow: scroll">
                <c:forEach items="${commentList}" var="commemt">
                    <div style="background-color: red; height: 50px">
                        <p style="float: top">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commemt.releaseTime}" timeZone="GMT+8"/>
                            <span class="col-sm-offset-1">用户:</span>
                            <span style="margin-left: 5px">${commemt.userName}</span>
                        </p>
                        <p style="float: bottom">
                            内容:
                            <span style="margin-left: 5px">${commemt.content}</span>
                        </p>
                    </div>
                    <div style="background-color: blue; height: 30px; float: bottom">
                        <button type="button" id="deleteCommentButton" onclick="deleteComment(${commemt.serNum}, '${commemt.roomId}')" class="btn btn-danger btn-sm" style="float: right; margin-right: 10px">
                            删除
                        </button>
                    </div>

                    <div style="background-color: #2e6da4; height: 1px; margin-top: 10px"></div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
    function deleteComment(serNum, roomId) {
        $.ajax({
            type: 'post',
            url: 'deleteComment',
            data: {
                serNum: serNum,
                roomId: roomId,
            },
            dataType: 'json',
            success: function (data) {
                alert("已删除");
                var str = "";

                var str1 = "t:formatDate patte";

                $("#commentDisplay").html("");

                for (var i = 0; i < data.commentList.length; i++){
                    str = "<p>\n" +
                        "<fm"+ str1 +"rn=\"yyyy-MM-dd HH:mm:ss\" value=\" "+ data.commentList[i].releaseTime +"\" timeZone=\"GMT+8\"/>\n" +
                        "<span class=\"col-sm-offset-1\">用户:</span>\n" +
                        "<span style=\"margin-left: 5px\">" + data.commentList[i].userName +"</span>\n" +
                        "</p>\n" +
                        "<p>\n" +
                        "    内容:\n" +
                        "<span style=\"margin-left: 5px\">" + data.commentList[i].content + "</span>\n" +
                        "</p>\n" +
                        "<div>\n" +
                        "   <button type=\"button\" id=\"deleteCommentButton\" onclick=\"deleteComment("+ data.commentList[i].serNum +
                        ")\" class=\"btn btn-danger btn-sm\" style=\"float: right; margin-right: 10px\">\n" +
                        "       删除\n" +
                        "   </button>\n" +
                        "</div>\n" +
                        "\n" +
                        "<div style=\"background-color: #2e6da4; height: 1px; margin-top: 10px\"></div>";
                    $("#commentDisplay").append(str);
                }
            }
        })
    }
</script>

</body>
</html>