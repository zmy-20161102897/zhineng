<%@ page import="bean.Tmessage" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="service.MessageService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<jsp:include page="head_m.jsp" flush="true"/>
<div class="invitationList">
    <!--搜索开始-->
    <div class="invitationSearch">
        <form>
            <input class="search01" type="text" id="autocomplete-ajax"/>
            <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>
            <input class="search02" type="image" src="img/search.png"/>
        </form>
    </div>
    <!--搜索结束-->
    <%
        List<Tmessage> messageList = new MessageService().queryAllMessage();

        Map<Long, String> MessageMap = new HashMap<>();
        for (Tmessage tmessage : messageList) {
            MessageMap.put(tmessage.getMesId(), tmessage.getFullMessageSubject());
        }
    %>
    <!--表格开始-->
    <div>
        <table border="0" cellspacing="0" cellpadding="0" id="allUserMessage"></table>
    </div>
    <!--页码开始-->
    <div id="pageLine" class="pageLine"></div>
    <!--页码结束-->
</div>

</body>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jquery.mockjax.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/SearchPagination.js"></script>

<script>

    $(function () {
        messageStr =
        <%=JSON.toJSONString(messageList)%>
        console.log(messageStr)
        var messageArray = $.map(<%=JSON.toJSONString(MessageMap)%>, function (value, key) {
            return {value: value, data: key};
        });
        //console.log(messageArray);
        pagiantion(messageStr, 6)
        search(messageArray)
    })

    function getPageData(pageNum, pageSize) {
        var messages = messageStr.slice(pageNum * pageSize, (pageNum + 1) * pageSize)
        console.log(messages)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"400\">帖子名称</th>\n" +
            "                <th width=\"230\">发布人</th>\n" +
            "                <th width=\"120\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var message of messages) {
            html += getMessageHtml(message)
        }
        $("#allUserMessage").html(html)
    }

    function deleteMessage(mesId) {
        if (confirm("确认要删除吗?"))
            window.location.href = "delete.jsp?type=message&mesID=" + mesId;
    }

    function showSelectMsg(mesId) {
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"400\">帖子名称</th>\n" +
            "                <th width=\"230\">发布人</th>\n" +
            "                <th width=\"120\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var tmessage of messageStr) {
            if (tmessage.mesId == mesId) {
                html += getMessageHtml(tmessage)
                $("#allUserMessage").html(html)
                $("#pageLine").hide()
                return
            }
        }
        //console.log(tmessage);
    }

    function getMessageHtml(tmessage) {
        //console.log(tmessage)
        return "<tr class=\"tableHeight\"><td width=\"400\" style=\"text-align: left\"><a onclick='findMessage(" + tmessage.mesId + ")'>" +
            tmessage.fullMessageSubject + "</a></td><td width=\"120\" >" +
            tmessage.userName + "</td><td width=\"200\" >" +
            tmessage.zancount + "</td>\n" +
            "<td width=\"120\"><input type=\"image\" src=\"img/shanchu.png\" " +
            "onclick=\"deleteMessage(" + tmessage.mesId + ")\"></td></tr>"
    }

    function findMessage(mesId) {
        window.location.href = "invitationDetails_m.jsp?mesID=" + mesId
    }

</script>

</html>
