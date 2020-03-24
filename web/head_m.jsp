<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = request.getRequestURI();
    String category = url.split("/")[2];
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/head_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
</head>
<body>

<div class="head">
    <div class="top">
        <img src="img/smart.png" alt="欢迎使用"/>
        <div class="manageName" id="manageName">
            <a href="information_m.jsp?adminID=${sessionScope.admin.adminId}">欢迎您,${sessionScope.admin.adminName}</a>
            <button onclick="window.location.href='login.jsp'">退出</button>
        </div>
        <div class="manageName" id="noAdmin">
            <a href="login.jsp">登录</a>
            <a>注册</a>
        </div>
    </div>
</div>
<!--导航栏部分开始-->
<div class="navigation">
    <nav>
        <ul>
            <li id="index"><a href="index_m.jsp">首页</a></li>
            <li id="user"><a href="user_m.jsp">用户管理</a></li>
            <li><a href="invitation_m.jsp">论坛管理</a></li>
            <li id="good"><a href="goods_m.jsp">商品管理</a></li>
            <li id="notice"><a href="notice_m.jsp">公告管理</a></li>
        </ul>
    </nav>
</div>
<!--导航栏部分结束-->
</body>

<script>

    $(function () {
        if ("${sessionScope.admin.adminName}" === "") {
            $("#manageName").hide()
            $("#noAdmin").show()
        } else {
            $("#manageName").show()
            $("#noAdmin").hide()
        }

        var category = "<%=category%>"
        var li
        if (category === "index_m.jsp") {
            li = document.getElementById("index").style
        } else if (category === "user_m.jsp") {
            li = document.getElementById("user").style
        } else if (category ===  "goods_m.jsp") {
            li = document.getElementById("good").style
        } else if (category === "notice_m.jsp") {
            li = document.getElementById("notice").style
        }
        li.backgroundColor = "palegoldenrod"
        li.borderRadius = "50px"
    })

</script>

</html>
