<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/3
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="css/goodsDetails_m.css">
    <script type="text/javascript" src="js/jquery-image-scale-carousel.js"></script>
</head>
<body>
<div class="goodsDetailsBox">
    <div class="goodsInfo">
        <div class="goodsInfoL"></div>
        <div class="goodsInfoR">
            <p class="showGoodsTitle">镜子挂墙浴室镜智能卫生间魔镜壁挂洗手间厕所卫浴镜防雾led带灯</p>
            <div class="goodsInfoOther">
                <p>品牌：123456</p>
                <p>型号：789789</p>
                <p>推荐人：此处为管理员名字</p>
            </div>
            <p class="showGoodsPrice"><strong>¥2699.00</strong></p>
        </div>
    </div>
    <div class="recommend">
        <span>推荐原因</span>
        <div>
            <p></p>
        </div>
    </div>
    <div class="showDetailsImg">
        <span>商品详情</span>
        <div>
            <script type="text/javascript">
                var carousel_images = [
                    "img/goodsdetails1.png",
                    "img/goodsdetails2.png",
                ];

                $(window).load(function() {
                    $("#photo_container").isc({
                        imgArray: carousel_images,
                        autoplay: true,
                        autoplayTimer: 5000 // 5 seconds.
                    });
                });
            </script>
        </div>
    </div>
</div>
</body>
</html>
