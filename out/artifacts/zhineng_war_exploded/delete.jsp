<%@ page import="service.NoticeService" %>
<%@ page import="service.UserService" %>
<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/3/22
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String type = request.getParameter("type");
    if ("notice".equals(type)) {
        int noticeId = Integer.parseInt(request.getParameter("noticeID"));
        int delete = new NoticeService().deleteNotice(noticeId);
        response.sendRedirect("notice_m.jsp");
    } else if ("user".equals(type)) {
        int userId = Integer.parseInt(request.getParameter("userID"));
        int delete = new UserService().deleteUser(userId);
        response.sendRedirect("user_m.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
