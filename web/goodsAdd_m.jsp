<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <link rel="stylesheet" type="text/css" href="css/goodsAdd_m.css">
    <script src="js/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<%
    session.removeAttribute("cover");
    session.removeAttribute("intro");
%>
<div class="goodsAddBox">
    <h1>添&nbsp;&nbsp;加&nbsp;&nbsp;商&nbsp;&nbsp;品</h1>
    <form enctype="multipart/form-data">
        <!--商品名称div开始-->
        <div class="goodsTitle">
            <label><em>*</em>商品名称：</label>
            <input id="productName" type="text" placeholder="请输入商品名称..." onkeyup="goodsTitleLength(this)" required><br/>
            <span class="goodsTitleWordage">剩余字数：
                <span id="goodsTileRemain">40</span>
            </span>
        </div>
        <!--商品名称div结束-->
        <!--商品推荐原因div开始-->
        <div class="goodsText">
            <label>推荐原因：</label>
            <div class="reason">
                <textarea id="recommendedReason" name="description" onkeyup="goodsTextLength(this)"></textarea>
                <span class="goodsTextWordage">剩余字数：
                    <span id="goodsTextRemain">500</span>
                </span>
            </div>
        </div>
        <!--商品推荐原因div结束-->
        <!--商品价格div开始-->
        <div class="goodsPrice">
            <label><em>*</em>商品价格：</label>
            <div>
                <input id="commodityPrice" type="text" placeholder="例：800.00" required>
                <em>单位：￥</em>
            </div>
        </div>
        <!--商品价格div结束-->
        <!--品牌div开始-->
        <div class="goodsBland goodsCommon">
            <label><em>*</em>品牌：</label>
            <input id="brand" type="text" required>
        </div>
        <!--品牌div结束-->
        <!--型号div开始-->
        <div class="goodsModel goodsCommon">
            <label><em>*</em>型号：</label>
            <input id="model" type="text" required>
        </div>
        <!--型号div结束-->
        <!--上传商品介绍图div开始-->
        <div class="introPicBox">
            <label><em>*</em>商品介绍图：</label>
            <div class="uploadIntroPic">
                <jsp:include page="uploadGoodsImg.jsp" flush="true"/>
                <em>至少添加一张图片，最多可添加五张</em>
            </div>
        </div>
        <!--上传商品介绍图div结束-->
        <!--上传商品详情图div开始-->
        <div class="detailsPicBox">
            <label><em>*</em>商品详情图：</label>
            <div class="uploadDetailsPic">
                <jsp:include page="uploadDetailsImg.jsp" flush="true"/>
                <em>至少添加一张图片，最多可添加五张</em>
            </div>
        </div>
        <!--上传商品详情图div结束-->
        <div class="goodsBtn">
            <button type="button" class="btnSave" onclick="sub()">发&nbsp;&nbsp;布</button>
            <button type="button" class="btnQuit" onclick="cancel()">退&nbsp;&nbsp;出</button>
        </div>
    </form>
</div>
</body>

<script type="text/javascript">

    function cancel() {
        if ($("#productName").val() !== "" || $("#commodityPrice").val() !== "" ||
            $("#brand").val() !== "" || $("#model").val() !== "" ||
            $("#recommendedReason").val() !== "" || $(".showInfoImgSection").length !== 0 ||
            $(".showDeImgSection").length !== 0) {
            if (confirm("未保存的内容将丢失,确认退出?")) {
                history.back(-1);
            }
        } else {
            history.back(-1);
        }
    }

    function isNumber(val) {
        if (val === "" || val == null) {
            return false;
        }
        return !isNaN(val);
    }

    function sub() {
        if ($("#productName").val() === "") {
            alert("商品名称不能为空！");
            return;
        }
        if ($("#commodityPrice").val() === "") {
            alert("商品价格不能为空！");
            return;
        }
        if (!isNumber($("#commodityPrice").val())) {
            alert("商品价格必须是数字！");
            return;
        }
        if ($("#brand").val() === "") {
            alert("品牌不能为空！");
            return;
        }
        if ($("#model").val() === "") {
            alert("型号不能为空！");
            return;
        }
        if ($(".showInfoImgSection").length === 0 || $(".showDeImgSection").length === 0) {
            alert("图片信息不能为空！");
            return;
        }
        $.post("addGoods.jsp", {
            type: "goods",
            adminId:${sessionScope.user.userId},
            productName: $("#productName").val(),
            recommendedReason: $("#recommendedReason").val(),
            commodityPrice: $("#commodityPrice").val(),
            brand: $("#brand").val(),
            model: $("#model").val()
        }, "json")
    }

    function goodsTitleLength(which) {
        var maxChars = 40; //
        if (which.value.length > maxChars) {
            alert("输入标题字数达到上限!");
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取 从第一个字符开始到上限
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("goodsTileRemain").innerHTML = curr.toString();
            return true;
        }
    }

    function goodsTextLength(which) {
        var maxChars = 500; //
        if (which.value.length > maxChars) {
            alert("输入标题字数达到上限!");
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取 从第一个字符开始到上限
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("goodsTextRemain").innerHTML = curr.toString();
            return true;
        }
    }
</script>

</html>
