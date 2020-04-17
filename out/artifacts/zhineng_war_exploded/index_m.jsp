<%@ page import="bean.Tadmin" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="service.AdminService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>智惠生活——智能家居网后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/index_m.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<!--搜索开始-->
<div class="adminSearch">
    <form>
        <input class="search01" type="text" id="autocomplete-ajax"/>
        <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>
        <input class="search02" type="image" src="img/search.png"/>
    </form>
</div>
<!--搜索结束-->
<!--管理员表格开始-->
<div class="adminTable">
    <%
        List<Tadmin> adminList = new AdminService().queryAllAdmin();
        Tadmin curAdmin = (Tadmin) session.getAttribute("admin");
        int remove = -1;
        for (int i = 0; i < adminList.size(); i++) {
            if (adminList.get(i).getAdminId() == curAdmin.getAdminId()) {
                remove = i;
                break;
            }
        }
        adminList.remove(remove);

        Map<Long, String> adminMap = new HashMap<>();
        for (Tadmin tadmin : adminList) {
            adminMap.put(tadmin.getAdminId(), tadmin.getAdminName());
        }
    %>
    <table border="0" cellspacing="0" cellpadding="0" id="allAdmin"></table>
</div>
<!--管理员表格结束-->
<!--页码部分开始-->
<div id="pageLine" class="pageLine"></div>
<!--页码部分结束-->

</body>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jquery.mockjax.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/SearchPagination.js"></script>
<script>

    $(function () {
        adminStr =
        <%=JSON.toJSONString(adminList)%>
        var adminArray = $.map(<%=JSON.toJSONString(adminMap)%>, function (value, key) {
            return {value: value, data: key};
        })

        pagiantion(adminStr, 10)
        search(adminArray)
    })

    function getPageData(pageNum, pageSize) {
        var admins = adminStr.slice(pageNum * pageSize, (pageNum + 1) * pageSize)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "            <th width=\"150\"></th>\n" +
            "            <th width=\"200\">昵称</th>\n" +
            "            <th width=\"70\">性别</th>\n" +
            "            <th width=\"120\">生日</th>\n" +
            "            <th width=\"160\">联系电话</th>\n" +
            "            <th width=\"190\">电子邮箱</th>\n" +
            // "            <th width=\"90\">详&nbsp;&nbsp;情</th>\n" +
            "            <th width=\"90\"></th>\n" +
            "        </tr>"
        for (var tadmin of admins) {
            html += getAdminHtml(tadmin)
        }
        $("#allAdmin").html(html)
    }

    function showSelectMsg(adminId) {
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "            <th width=\"150\"></th>\n" +
            "            <th width=\"200\">昵称</th>\n" +
            "            <th width=\"70\">性别</th>\n" +
            "            <th width=\"120\">生日</th>\n" +
            "            <th width=\"160\">联系电话</th>\n" +
            "            <th width=\"190\">电子邮箱</th>\n" +
            // "            <th width=\"90\">详&nbsp;&nbsp;情</th>\n" +
            "            <th width=\"90\"></th>\n" +
            "        </tr>"
        for (var tadmin of adminStr) {
            if (tadmin.adminId == adminId) {
                html += getAdminHtml(tadmin)
                $("#allAdmin").html(html)
                $("#pageLine").hide()
                return
            }
        }
    }

    function getAdminHtml(tadmin) {
        return "<tr>\n" +
            "            <td width=\"150\"><img src='img/admin/" + tadmin.adminId + ".png' >" + "</td>\n" +
            "            <td width=\"200\">" + "<a onclick='findAdmin(" + tadmin.adminId + ")'>" + tadmin.adminName + "</a></td>\n" +
            "            <td width=\"70\">" + tadmin.adminSex + "</td>\n" +
            "            <td width=\"120\">" + tadmin.adminBirthday + "</td>\n" +
            "            <td width=\"160\">" + tadmin.adminMobile + "</td>\n" +
            "            <td width=\"190\">" + tadmin.adminEmail + "</td>\n" +
            // "            <td width=\"90\"><a onclick='findAdmin(" + tadmin.adminId + ")'>详&nbsp;&nbsp;情</a></td>\n" +
            "            <td width=\"90\"></td>\n" +
            //    留&nbsp;&nbsp;言
            "        </tr>"
    }

    function findAdmin(adminId) {
        window.location.href = "information_m.jsp?adminID=" + adminId
    }

</script>
</html>
