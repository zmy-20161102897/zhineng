<%@ page import="service.NoticeService" %>
<%@ page import="bean.Tuser" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/3/18
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String text = request.getParameter("text");

    System.out.println(title + "\n" + text);

    Tuser tuser = (Tuser) request.getSession().getAttribute("user");
    int insert = new NoticeService().insertNotice(title,text,tuser.getUserId(),new Date());

    response.sendRedirect("notice_m.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
