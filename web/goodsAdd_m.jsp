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
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <div class="goodsAddBox">
        <h1>添&nbsp;&nbsp;加&nbsp;&nbsp;商&nbsp;&nbsp;品</h1>
        <form>
            <div class="goodsTitle">
                <label>商品名称：</label>
                <input type="text" />
            </div>
            <div class="goodsPic">
                <label>商品封面图：</label>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
            </div>
            <div class="goodsIntro">
                <label>商品介绍：</label>
                <textarea></textarea>
            </div>
            <div class="goodsPic">
                <label>推荐原因：</label>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
                <div class="addPic"><input type="image" src="img/tianjia.png" /></div>
                <div class="addPicMore"><input type="image" src="img/tianjiamore.png" /></div>
            </div>
            <div class="goodsPrice">
                <label>商品价格：</label>
                <input type="text" />
                <span>&nbsp;请填写商品价格（￥）&nbsp;</span>
            </div>
            <div class="btn">
                <button type="button" class="btnBase btnSave">发&nbsp;&nbsp;布</button>
                <button type="button" class="btnBase btnQuit">退&nbsp;&nbsp;出</button>
            </div>
        </form>
    </div>
</body>
</html>
