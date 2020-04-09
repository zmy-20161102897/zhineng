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
</head>
<body>

<div class="goodsDetailsBox">
    <div class="goodsInfo">
        <!--介绍图展示开始-->
        <div class="goodsInfoL">
            <div class="goodsBigImg">
                <img class="bigImg" src="img/goodsdetails1.png">
            </div>
            <div class="goodsSmallImg">
                <a class="upImgDisable"></a>
                <ul>
                    <li class="littleImg curImg" data-bigpic="img/goodsdetails1.png"><img src="img/goodsdetails1.png"></li>
                    <li class="littleImg" data-bigpic="img/goodsdetails2.png"><img src="img/goodsdetails2.png"></li>
                    <li class="littleImg" data-bigpic="img/smart.png"><img src="img/smart.png"></li>
                    <li class="littleImg" data-bigpic="img/nextImg.png"><img src="img/nextImg.png"></li>
                    <li class="littleImg" data-bigpic="img/user.png"><img src="img/user.png"></li>
                </ul>
                <a class="downImgDisable"></a>
            </div>
        </div>
        <!--介绍图展示结束-->
        <!--商品信息开始-->
        <div class="goodsInfoR">
            <p class="showGoodsTitle">镜子挂墙浴室镜智能卫生间魔镜壁挂洗手间厕所卫浴镜防雾led带灯</p>
            <div class="goodsInfoOther">
                <p>品牌：123456</p>
                <p>型号：789789</p>
                <p>推荐人：此处为管理员名字</p>
            </div>
            <p class="showGoodsPrice"><strong>¥2699.00</strong></p>
        </div>
        <!--商品信息结束-->
    </div>
    <!--商品详情开始-->
    <div class="showGoodsDetails">
        <span>商品详情</span>
        <!--推荐原因开始-->
        <div class="goodsDescribe">
            <p>智能家居是以住宅为平台，利用综合布线技术、网络通信技术、安全防范技术、自动控制技术、音视频技术将家居生活有关的设施集成。
                构建高效的住宅设施与家庭日程事务的管理系统，提升家居安全性、便利性、舒适性、艺术性，并实现环保节能的居住环境。
                智能家居的概念最早是起源于美国联合科技公司，将建筑设备信息化、整合化概念应用于美国康涅迪格州哈特佛市的CityPlaceBuilding时，才出现了首栋的智能型建筑。
                从此也揭开了全世界争相建造智能家居的序幕。</p>
        </div>
        <!--推荐原因结束-->
        <!--详情图片开始-->
        <div class="showDetailsImg">
            <ul>
                <li><img src="img/goodsdetails1.png"></li>
                <li><img src="img/goodsdetails1.png"></li>
                <li><img src="img/user.png"></li>
                <li><img src="img/smart.png"></li>
                <li><img src="img/goodsdetails1.png"></li>
            </ul>
        </div>
        <!--详情图片结束-->
    </div>
    <!--商品详情结束-->

</div>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/getParameter.js"></script>
<script>
    //DOM结构绘制完毕后就执行，不必等到加载完毕。可以简写成$(function(){}
    $(document).ready(function () {
        //焦点图效果
        //点击图片切换效果
        $('.littleImg').on('mousemove',function () {
            $('.littleImg').removeClass('curImg');
            var bigPic = $(this).data('bigpic');
            $('.bigImg').attr('src',bigPic);
            $(this).addClass('curImg');
        });
        //上下切换
        var picIndex = 0;
        var nextIndex = 3;
        $('.downImgDisable').on('click',function () {
            var num = $('.littleImg').length;
            if ((nextIndex + 1) <= num) {
                $('.littleImg:eq(' + picIndex + ')').hide();
                $('.littleImg:eq(' + nextIndex + ')').show();
                picIndex = picIndex + 1;
                nextIndex = nextIndex + 1;
            }
        });
        $('.upImgDisable').on('click',function () {
            var num = $('.littleImg').length;
            if (picIndex > 0) {
                $('.littleImg:eq(' + (nextIndex - 1) + ')').hide();
                $('.littleImg:eq(' + (picIndex - 1) + ')').show();
                picIndex = picIndex - 1;
                nextIndex = nextIndex - 1;
            }
        });
    });
</script>

</body>
</html>
