<%@ page import="bean.Tnotice" %>
<%@ page import="service.NoticeService" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告详情</title>
    <link rel="stylesheet" type="text/css" href="css/noticeDetails_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <%!
        String formatNoticeText(String text) {
            
            return null;
        }
    %>
    <%
        NoticeService noticeService = new NoticeService();
        int noticeId = Integer.parseInt(request.getParameter("noticeID"));
        Tnotice tnotice = noticeService.queryNoticeByNoticeId(noticeId);
//
        int lastNoticeId = noticeService.findLastNoticeId(noticeId);
        int nextNoticeId = noticeService.findNextNoticeId(noticeId);

        String last;
        if (lastNoticeId != -1) {
            last = "<p>上一条：<a href=\"noticeDetails_m.jsp?noticeID=" + lastNoticeId + "\">" +
                    new NoticeService().queryNoticeByNoticeId(lastNoticeId).getFullNoticeTitle() + "</a></p>";
        } else {
            last = "";
        }

        String next;
        if (nextNoticeId != -1) {
            next = "<p>下一条：<a href=\"noticeDetails_m.jsp?noticeID=" + nextNoticeId + "\">" +
                    new NoticeService().queryNoticeByNoticeId(nextNoticeId).getFullNoticeTitle() + "</a></p>";
        } else {
            next = "";
        }

    %>
    <div class="noticeContent">
        <h5 id="noticeTitle">公告标题：<%=tnotice.getFullNoticeTitle()%></h5>
        <h6 id="noticeDate">发布时间：<%=tnotice.getNoticeDate()%></h6>
        <div class="noticeText">
            <p style="text-indent:0em; text-align:justify; line-height:2em;" id="noticeText"><%=tnotice.getNoticeText()%></div>
        <!--上下条开始-->
        <div class="noticeNext">
            <%=last%>
            <%=next%>
        </div>
        <!--上下条结束-->
    </div>
</body>
</html>
