<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/10
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发展文章管理</title>
    <link rel="stylesheet" type="text/css" href="css/develop_m.css">
</head>
<body>

<jsp:include page="head_m.jsp" flush="true"/>
<div class="developDIV">
    <div class="developContent">
        <ul class="develop-tab">
            <li class="active">热帖</li>
            <li>智能家居的起源</li>
            <li>与传统家居比较</li>
            <li>智能家居的未来</li>
            <li class="line"></li>
        </ul>
    </div>
    <div class="develop-list">
        <div class="develop-item">
            <table cellspacing="0" cellpadding="0">
                <tr style="font-weight: bold">
                    <td style="width: 350px">文章名</td>
                    <td style="width: 200px">发布人</td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px">删除</td>
                </tr>
                <tr>
                    <td class="textL" style="width: 350px"><a href="#">热帖热帖热帖热帖热帖</a></td>
                    <td style="width: 200px"><a href="#">发布人1发布人1发布人1</a></td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px"><img src="img/shanchu.png"></td>
                </tr>
            </table>
        </div>
        <div class="develop-item hide">
            <table cellspacing="0" cellpadding="0">
                <tr style="font-weight: bold">
                    <td style="width: 350px">文章名</td>
                    <td style="width: 200px">发布人</td>
                    <td style="width: 100px">点赞数</td>
                    <td>删除</td>
                </tr>
                <tr>
                    <td class="textL" style="width: 350px"><a href="#">智能家居的起源智能家居的起源</a></td>
                    <td style="width: 200px"><a href="#">发布人2发布人2发布人2</a></td>
                    <td style="width: 100px">点赞数</td>
                    <td><img src="img/shanchu.png"></td>
                </tr>
            </table>
        </div>
        <div class="develop-item hide">
            <table cellspacing="0" cellpadding="0">
                <tr style="font-weight: bold">
                    <td style="width: 350px">文章名</td>
                    <td style="width: 200px">发布人</td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px">删除</td>
                </tr>
                <tr>
                    <td class="textL" style="width: 350px"><a href="#">与传统家居比较与传统家居比较</a></td>
                    <td style="width: 200px"><a href="#">发布人3发布人3发布人3</a></td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px"><img src="img/shanchu.png"></td>
                </tr>
            </table>
        </div>
        <div class="develop-item hide">
            <table cellspacing="0" cellpadding="0">
                <tr style="font-weight: bold">
                    <td style="width: 350px">文章名</td>
                    <td style="width: 200px">发布人</td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px">删除</td>
                </tr>
                <tr>
                    <td class="textL" style="width: 350px"><a href="#">智能家居的未来智能家居的未来</a></td>
                    <td style="width: 200px"><a href="#">发布人4发布人4发布人4</a></td>
                    <td style="width: 100px">点赞数</td>
                    <td style="width: 50px"><img src="img/shanchu.png"></td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        //tab切换
        $('.develop-tab li').hover(function () {
            $('.develop-tab li.line').stop().animate({
                'left': $(this).position().left
            });
            $('.develop-list .develop-item').stop().eq($(this).index()).show().siblings().hide();
        });
    })
</script>

</body>
</html>
