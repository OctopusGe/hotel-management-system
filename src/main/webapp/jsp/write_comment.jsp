<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-12
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#editCommentModal").modal('show');
        })
        $("#editCommentSubmitButton").click(function () {
            var roomId = $("#roomId").text();
            var userName  = $("#sessionUserName").text();
            var content  = $("#editComment").val();
            if (content == ''){
                alert("评论内容不能为空！");
            } else {
                $.ajax({
                    type: 'post',
                    url: 'addRoomComment',
                    data: {
                        roomId: roomId,
                        userName: userName,
                        content: content,
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateCode.trim() === '1') {
                            alert("评论成功！");
                            $("#editCommentModal").modal('hide');
                            //$("#editRoomComment").html("");
                        } else if (data.stateCode.trim() === '0') {
                            alert("系统错误，评论提交失败！");
                            $("#editCommentModal").modal('hide');
                            //$("#editRoomComment").html("");
                        }
                    }
                })
            }
        })
    </script>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="editCommentModal" tabindex="-1" role="dialog" aria-labelledby="editCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 200px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="editCommentModalLabel">
                    写评论
                </h4>
            </div>
            <div class="modal-body" id="editCommentDisplay">
                <textarea id="editComment" class="form-control" rows="4" style="background-color: white; font-size: 20px"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" id="editCommentSubmitButton" class="btn btn-primary">
                    提交
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
