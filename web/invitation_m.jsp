<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/10
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛管理</title>
    <link rel="stylesheet" type="text/css" href="css/invitation_m.css">
</head>
<body>

<jsp:include page="head_m.jsp" flush="true"/>
<div class="invitationList">
    <!--搜索开始-->
    <div class="invitationSearch">
        <form>
            <input class="search01" type="text">
            <input class="search02" type="image" src="img/search.png">
        </form>
    </div>
    <!--搜索结束-->
    <!--表格开始-->
    <table cellspacing="0" cellpadding="0">
        <tr style="background: #FFCF9F; height: 40px">
            <th style="width: 400px">帖子名</th>
            <th style="width: 230px">发布人</th>
            <th style="width: 120px">点赞数</th>
            <th style="width: 50px">删除</th>
        </tr>
        <tr>
            <td class="textL" style="width: 400px"><a href="#">帖子名帖子名帖子名</a></td>
            <td style="width: 230px"><a href="#">发布人1发布人1发布人1</a></td>
            <td style="width: 120px">点赞数</td>
            <td style="width: 50px"><img src="img/shanchu.png"></td>
        </tr>
    </table>
    <!--表格结束-->
    <!--页码开始-->
    <div class="invitationPage">

    </div>
    <!--页码结束-->
</div>

</body>
</html>
