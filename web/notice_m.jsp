<%@ page import="bean.Tnotice" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="service.NoticeService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告管理</title>
    <link rel="stylesheet" type="text/css" href="css/notice_m.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<!--搜索开始-->
<div class="noticeSearch">
    <button class="btnNotice" onclick="window.location.href='noticeAdd_m.jsp'">发布公告</button>
    <form>
        <input class="search01" type="text" id="autocomplete-ajax"/>
        <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>
        <input class="search02" type="image" src="img/search.png"/>
    </form>
</div>
<!--搜索结束-->
<%
    List<Tnotice> noticeList = new NoticeService().queryAllNotice();

    Map<Long, String> noticeMap = new HashMap<>();
    for (Tnotice tnotice : noticeList) {
        noticeMap.put(tnotice.getNoticeId(), tnotice.getFullNoticeTitle());
    }
%>
<!--用户表格开始-->
<div class="noticeTable">
    <table border="0" cellspacing="0" cellpadding="0" id="allAdminNotice"></table>
</div>
<!--用户表格结束-->
<!--页码部分开始-->
<div id="pageLine" class="pageLine"></div>
<!--页码部分结束-->
</body>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jquery.mockjax.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/SearchPagination.js"></script>
<%--<script type="text/javascript" src="js/demo.js"></script>--%>
<%--<script type="text/javascript" src="js/countries.js"></script>--%>

<script>
    $(function () {
        noticeStr =
        <%=JSON.toJSONString(noticeList)%>
        console.log(noticeStr)
        var noticesArray = $.map(<%=JSON.toJSONString(noticeMap)%>, function (value, key) {
            return {value: value, data: key};
        });
        console.log(noticesArray)
        pagiantion(noticeStr, 6)
        search(noticesArray)
    })

    function getPageData(pageNum, pageSize) {
        var notices = noticeStr.slice(pageNum * pageSize, (pageNum + 1) * pageSize)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"400\">公告标题</th>\n" +
            "                <th width=\"120\">公告发布时间</th>\n" +
            "                <th width=\"200\">管理员</th>\n" +
            // "                <th width=\"130\">公告详情</th>\n" +
            "                <th width=\"120\">删除公告</th>\n" +
            "            </tr>"
        for (var notice of notices) {
            html += getNoticeHtml(notice)
        }
        $("#allAdminNotice").html(html)
    }

    function deleteNotice(noticeId) {
        if (confirm("确认要删除吗?"))
            window.location.href = "delete.jsp?type=notice&noticeID=" + noticeId;
    }

    function showSelectMsg(noticeId) {
        // console.log(noticeId)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"400\">公告标题</th>\n" +
            "                <th width=\"120\">公告发布时间</th>\n" +
            "                <th width=\"200\">管理员</th>\n" +
            // "                <th width=\"130\">公告详情</th>\n" +
            "                <th width=\"120\">删除公告</th>\n" +
            "            </tr>"
        for (var tnotice of noticeStr) {
            if (tnotice.noticeId == noticeId) {
                html += getNoticeHtml(tnotice)
                $("#allAdminNotice").html(html)
                $("#pageLine").hide()
                return
            }
        }
    }

    function getNoticeHtml(notice) {
        return "<tr><td width=\"400\" class=\"tbTitle name\" style=\"text-align: left\"><a onclick='findNotice(" + notice.noticeId + ")'>" +
            notice.noticeTitle + "</a></td><td width=\"120\" class=\"tbTitle\">" +
            notice.noticeDate + "</td><td width=\"200\" class=\"tbTitle\">" +
            notice.adminName + "</td>\n" +
            "<td width=\"120\"><input class=\"delete\" type=\"image\" src=\"img/shanchu.png\" " +
            "onclick=\"deleteNotice(" + notice.noticeId + ")\"></td></tr>"
    }

    function findNotice(noticeId) {
        window.location.href = "noticeDetails_m.jsp?noticeID=" + noticeId
    }

</script>

</html>
