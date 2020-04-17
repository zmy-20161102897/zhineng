<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getSession().removeAttribute("admin");
%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
</head>
<body>

<div class="denglu">
    <div class="userLogin"><strong>登录</strong></div>

    <div>
        <form action="log.jsp" method="post">
            <input type="text" placeholder="用户名" class="userName" name="username"/>
            <input type="password" placeholder="密码" class="password" name="password"/>
            <input type="submit" value="登&nbsp;&nbsp;录" class="loginButton">
        </form>
    </div>

    <div class="wrongHint" id="wrongHint"></div>
    <div class="userLogon"><strong><a href="logon.html">用户注册</a></strong></div>

    <div class="findPassword"><strong><a href="#">忘记密码？</a></strong></div>
</div>
</body>
</html>
