<%@ page import="bean.Tuser" %>
<%@ page import="service.UserService" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/3/23
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");//request的编码格式改成utf-8 获取中文昵称
    String name = request.getParameter("username");
    String password = request.getParameter("password");

    Tuser user = new UserService().login(name, password);
    if (user != null) {
        request.getSession().setAttribute("user", user);
        response.sendRedirect("index_m.jsp");

    } else {
        response.sendRedirect("login.jsp");
    }

//    response.sendRedirect("index_m.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
