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
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章管理</title>
    <link rel="stylesheet" type="text/css" href="css/develop_m.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<jsp:include page="head_m.jsp" flush="true"/>
<div class="developDIV">
    <!--选项卡开始-->
    <div class="developContent">
        <ul class="develop-tab">
            <li class="active" id="hotMesTable">热门文章</li>
            <li id="originMesTable">智能家居的起源</li>
            <li id="compareMesTable">与传统家居比较</li>
            <li id="futureMesTable">智能家居的未来</li>
            <li class="line"></li>
        </ul>
    </div>
    <!--选项卡结束-->
    <!--开始-->
    <div class="develop-list">
        <!--热帖开始-->
        <div class="develop-item">
            <%
                List<Tmessage> hotMessageList = new MessageService().queryHotMessage();

                Map<Long, String> hotMessageMap = new HashMap<>();
                for (Tmessage tmessage : hotMessageList) {
                    hotMessageMap.put(tmessage.getMesId(), tmessage.getFullMessageSubject());
                }
            %>
            <table border="0" cellspacing="0" cellpadding="0" id="allHotMessage"></table>
        </div>
        <!--热帖结束-->
        <!--起源开始-->
        <div class="develop-item hide">
            <%
                List<Tmessage> originMessageList = new MessageService().queryOriginMessage();

                Map<Long, String> originMessageMap = new HashMap<>();
                for (Tmessage tmessage : originMessageList) {
                    originMessageMap.put(tmessage.getMesId(), tmessage.getFullMessageSubject());
                }
            %>
<%--            <div class="developSearch">--%>
<%--                <form>--%>
<%--                    <input class="search01" type="text" id="autocomplete-ajax"/>--%>
<%--                    <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>--%>
<%--                    <input class="search02" type="image" src="img/search.png"/>--%>
<%--                </form>--%>
<%--            </div>--%>
            <table border="0" cellspacing="0" cellpadding="0" id="allOriginMessage"></table>
<%--            <div id="pageLine" class="pageLine"></div>--%>
        </div>
        <!--起源结束-->
        <!--比较开始-->
        <div class="develop-item hide">
            <%
                List<Tmessage> compareMessageList = new MessageService().queryCompareMessage();

                Map<Long, String> compareMessageMap = new HashMap<>();
                for (Tmessage tmessage : compareMessageList) {
                    compareMessageMap.put(tmessage.getMesId(), tmessage.getFullMessageSubject());
                }
            %>
            <table border="0" cellspacing="0" cellpadding="0" id="allCompareMessage"></table>
        </div>
        <!--比较结束-->
        <!--未来-->
        <div class="develop-item hide">
            <%
                List<Tmessage> futureMessageList = new MessageService().queryFutureMessage();

                Map<Long, String> futureMessageMap = new HashMap<>();
                for (Tmessage tmessage : futureMessageList) {
                    futureMessageMap.put(tmessage.getMesId(), tmessage.getFullMessageSubject());
                }
            %>
            <table border="0" cellspacing="0" cellpadding="0" id="allFutureMessage"></table>
        </div>
        <!--未来-->
    </div>
    <!--结束-->
</div>

<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        //tab切换
        $('.develop-tab li').hover(function () {
            $('.develop-tab li.line').stop().animate({
                'left': $(this).position().left
            });
            $('.develop-list .develop-item').stop().eq($(this).index()).show().siblings().hide();
        });

        //热帖显示
        hotMessageStr = <%=JSON.toJSONString(hotMessageList)%>
        console.log(hotMessageStr)
        var messages = hotMessageStr.slice(0,10)
        //console.log(messages)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"500\">文章名称</th>\n" +
            "                <th width=\"200\">发布人</th>\n" +
            "                <th width=\"100\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var message of messages) {
            html += getMessageHtml(message)
        }
        $("#allHotMessage").html(html)

        //起源显示
        orginMessageStr = <%=JSON.toJSONString(originMessageList)%>
        //console.log(hotMessageStr)
        var messages_origin = orginMessageStr
        //console.log(messages)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"500\">文章名称</th>\n" +
            "                <th width=\"200\">发布人</th>\n" +
            "                <th width=\"100\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var message_origin of messages_origin) {
            html += getMessageHtml(message_origin)
        }
        $("#allOriginMessage").html(html)

        //比较显示
        compareMessageStr = <%=JSON.toJSONString(compareMessageList)%>
        //console.log(compareMessageStr)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"500\">文章名称</th>\n" +
            "                <th width=\"200\">发布人</th>\n" +
            "                <th width=\"100\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var message_compare of compareMessageStr) {
            html += getMessageHtml(message_compare)
        }
        $("#allCompareMessage").html(html)

        //未来显示
        futureMessageStr = <%=JSON.toJSONString(futureMessageList)%>
        //console.log(futureMessageStr)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"500\">文章名称</th>\n" +
            "                <th width=\"200\">发布人</th>\n" +
            "                <th width=\"100\">点赞数</th>\n" +
            "                <th width=\"50\">删除</th>\n" +
            "            </tr>"
        for (var message_future of futureMessageStr) {
            html += getMessageHtml(message_future)
        }
        $("#allFutureMessage").html(html)

    })

    //添加
    function getMessageHtml(message) {
        //console.log(message)
        return "<tr><td width=\"500\" style=\"text-align: left\"><a onclick='findMessage(" + message.mesId + ")'>" +
            message.fullMessageSubject + "</a></td><td width=\"200\" >" +
            message.userName + "</td><td width=\"100\" >" +
            message.zancount + "</td>\n" +
            "<td width=\"50\"><input type=\"image\" src=\"img/shanchu.png\" " +
            "onclick=\"deleteHotMessage(" + message.mesId + ")\"></td></tr>"
    }

    //查看详情和删除
    function findMessage(mesId) {
        window.location.href = "developDetails_m.jsp?mesID=" + mesId
    }

    function deleteHotMessage(mesId) {
        if (confirm("确认要删除吗?"))
            window.location.href = "delete.jsp?type=developMessage&mesID=" + mesId;
    }
</script>

</body>
</html>
