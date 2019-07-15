<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-06-13
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
    $(function () {

        $("#checkoutModal").modal('show');

    })
</script>


<%--<!-- 模态框（Modal） -->--%>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog"--%>
     <%--aria-hidden="true" style="margin-top: 250px">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>

            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true"--%>
                    <%--style="font-size: 30px;margin-right: 20px; margin-top: 10px">×--%>
            <%--</button>--%>

            <%--<div class="warm-prompt">--%>
                <%--<img style="float: left; opacity: 0.8" alt="Norway" class="img-rounded" src="img/notice1.jpg"/>--%>
                <%--<div class="warm-prompt-text">--%>
                    <%--用完系统后，请安全退出!--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<button type="button" class="close-modal" data-dismiss="modal">--%>
                <%--知道了--%>
            <%--</button>--%>

        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- 模态框（Modal） 结尾-->--%>





<!-- 模态框（Modal） -->
<div class="modal fade" style="margin-top: 100px" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="commentModalLabel">
                    结账
                </h4>
            </div>

            <%--private String roomId;--%>

            <%--private String userName;--%>

            <%--private String id;--%>

            <%--private Date startTime;--%>

            <%--private Date endTime;--%>

            <%--private BigDecimal prepay;--%>

            <%--private BigDecimal payment;--%>

            <div class="modal-body" style="height: 320px; overflow: scroll">
                <div class="col-sm-8 col-sm-offset-2 input-group">
                    <span  class="input-group-addon">房间号</span>
                    <input type="text" class="form-control" id="roomId" value="${checkout.roomId}" disabled>
                </div>
                <div class="col-sm-8 col-sm-offset-2 input-group" style="margin-top: 15px">
                    <span class="input-group-addon">用户名</span>
                    <input type="text" class="form-control" value="${checkout.userName}" disabled>
                </div>
                <div class="col-sm-8 col-sm-offset-2 input-group" style="margin-top: 15px">
                    <span  class="input-group-addon">身份证号码</span>
                    <input type="text" class="form-control" value="${checkout.id}" disabled>
                </div>
                <div class="col-sm-8 col-sm-offset-2 input-group" style="margin-top: 15px">
                    <p style="font-size: 16px; margin-left: 10px">
                        开始时间
                        <span style="margin-left: 10px">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${checkout.startTime}" timeZone="GMT+8"/>
                        </span>
                    </p>
                </div>
                <div class="col-sm-8 col-sm-offset-2 input-group" style="margin-top: 15px">
                    <span  class="input-group-addon">预付</span>
                    <input type="text" class="form-control" name="introduction" id="introduction" disabled value="${checkout.prepay}" >
                </div>
                <div class="col-sm-8 col-sm-offset-2 input-group" style="margin-top: 15px">
                    <span class="input-group-addon">实际付款</span>
                    <input type="text" class="form-control" id="payment" placeholder="请输入结款金额" >
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="checkoutSubmit()" class="btn btn-primary">
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
<script type="text/javascript">
    function checkoutSubmit() {
        var roomId = $("#roomId").val();
        var payment = $("#payment").val();
        $.ajax({
            type: 'post',
            url: 'addPayment',
            data: {
                roomId: roomId,
                payment: payment,
            },
            dataType: 'json',
            success: function () {
                alert("已结账！");
                $("#checkoutModal").modal('hide');
                setTimeout(function () {
                    $("#display").load('ruzhu_management.html');
                },500);
            }
        })
    }
</script>

