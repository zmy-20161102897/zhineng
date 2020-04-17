<%@ page import="bean.Tmessage" %>
<%@ page import="service.MessageService" %>
<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/15
  Time: 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" type="text/css" href="css/developDetails_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
</head>
<body>

    <jsp:include page="head_m.jsp" flush="true"/>
    <%!
        String formatDevelopMesText(String text) {

            return null;
        }
    %>
    <%
        MessageService messageService = new MessageService();
        int mesId = Integer.parseInt(request.getParameter("mesID"));
        Tmessage tmessage = messageService.queryMessageByMesId(mesId);
    %>
    <div class="developContent">
        <h5 id="developMesTitle"><%=tmessage.getFullMessageSubject()%></h5>
        <div class="developMesText">
            <p style="text-indent:2em; text-align:justify; line-height:2em;" id="developMesText"><%=tmessage.getMesText()%></p>
        </div>
        <div class="developElse">
            <h6 id="developMesDate"><%=tmessage.getMesDate()%></h6>
            <div class="developZanCount">
                <img src="img/zan.png">
                <span><%=tmessage.getZancount()%></span>
            </div>
        </div>
    </div>

</body>
</html>
