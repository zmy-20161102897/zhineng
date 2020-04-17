<%@ page import="bean.Tmessage" %>
<%@ page import="service.MessageService" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/15
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子详情</title>
    <link rel="stylesheet" type="text/css" href="css/invitationDetails_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <%!
        String formatInvitationText(String text) {

            return null;
        }
    %>
    <%
        MessageService messageService = new MessageService();
        int mesId = Integer.parseInt(request.getParameter("mesID"));
        Tmessage tmessage = messageService.queryMessageByMesId(mesId);
    %>
    <div class="invitationContent">
        <h1>此处显示帖子名</h1>
        <div class="invitationInfo">
            <span>时间：2019-12-08</span>
            <span>回复：300</span>
        </div>
        <!--主贴内容开始-->
        <div class="mesMainContent">
            本人从事智能家居场景设计工作，发现很多人对智能家居完全不了解，一说智能家居，很多人都以为是做家具的。所以决定说说什么是智能家居。
            我将用你看的懂的方式来摆谈！想先发个视频预热的，为什么传不了??
            <h5>楼主发言：33次</h5>
        </div>
        <!--主贴内容结束-->
        <!--回复内容开始-->
        <div class="replyBox">
            <!--对主贴的评论开始-->
            <div>

            </div>
            <!--对主贴的评论结束-->
            <!--对评论的评论开始-->
            <div>

            </div>
            <!--对评论的评论结束-->
        </div>
        <!--回复内容结束-->
    </div>

</body>
</html>
