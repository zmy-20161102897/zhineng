<%@ page import="service.NoticeService" %>
<%@ page import="service.UserService" %>
<%@ page import="service.GoodsService" %>
<%@ page import="service.MessageService" %>
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
        int deleteMessage = new MessageService().deleteMessageByUserID(userId);
        int delete = new UserService().deleteUser(userId);
        response.sendRedirect("user_m.jsp");
    } else if ("goods".equals(type)) {
        int goodsID = Integer.parseInt(request.getParameter("goodsID"));
        int delete = new GoodsService().deleteGoods(goodsID);
        response.sendRedirect("goods_m.jsp");
    } else if ("message".equals(type)) {
        int mesID = Integer.parseInt(request.getParameter("mesID"));
        int delete = new MessageService().deleteMessage(mesID);
        response.sendRedirect("invitation_m.jsp");
    } else if ("developMessage".equals(type)) {
        int mesID = Integer.parseInt(request.getParameter("mesID"));
        int delete = new MessageService().deleteMessage(mesID);
        response.sendRedirect("develop_m.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
