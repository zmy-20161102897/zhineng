<%@ page import="bean.Tuser" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="service.UserService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="css/user_m.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<!--搜索开始-->
<div class="userSearch">
    <form>
        <input class="search01" type="text" id="autocomplete-ajax"/>
        <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>
        <input class="search02" type="image" src="img/search.png"/>
    </form>
</div>
<!--搜索结束-->
<!--用户表格开始-->
<div class="userTable">
    <%
        List<Tuser> userList = new UserService().queryAllUsers();

        Map<Long, String> userMap = new HashMap<>();
        for (Tuser tuser : userList) {
            userMap.put(tuser.getUserId(), tuser.getUserName());
        }
    %>
    <table border="0" cellspacing="0" cellpadding="0" id="allUser">
    </table>
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
<script>

    $(function () {
        userStr =
        <%=JSON.toJSONString(userList)%>

        var userArray = $.map(<%=JSON.toJSONString(userMap)%>, function (value, key) {
            return {value: value, data: key}
        })
        console.log(userArray)
        pagiantion(userStr, 3)
        search(userArray)
    })

    function getPageData(pageNum, pageSize) {
        var users = userStr.slice(pageNum * pageSize, (pageNum + 1) * pageSize)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "            <th width=\"150\"></th>\n" +
            "            <th width=\"200\">昵称</th>\n" +
            "            <th width=\"70\">性别</th>\n" +
            "            <th width=\"120\">生日</th>\n" +
            "            <th width=\"160\">联系电话</th>\n" +
            "            <th width=\"190\">电子邮箱</th>\n" +
            // "            <th width=\"90\">用户详情</th>\n" +
            "            <th width=\"90\">删除用户</th>\n" +
            "        </tr>"
        for (var tuser of users) {
            html += getUserHtml(tuser)
        }
        $("#allUser").html(html)
    }

    function showSelectMsg(userId) {
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "            <th width=\"150\"></th>\n" +
            "            <th width=\"200\">昵称</th>\n" +
            "            <th width=\"70\">性别</th>\n" +
            "            <th width=\"120\">生日</th>\n" +
            "            <th width=\"160\">联系电话</th>\n" +
            "            <th width=\"190\">电子邮箱</th>\n" +
            // "            <th width=\"90\">用户详情</th>\n" +
            "            <th width=\"90\">删除用户</th>\n" +
            "        </tr>"
        for (var tuser of userStr) {
            if (tuser.userId = userId) {
                html += getUserHtml(tuser)
                $("#allUser").html(html)
                $("#pageLine").hide()
                return
            }
        }
    }

    function getUserHtml(tuser) {
        return "<tr>\n" +
            "            <td width=\"150\"><img src='img/user/" + tuser.userId + ".png' >" + "</td>\n" +
            "            <td width=\"200\"><a onclick='findUser(" + tuser.userId + ")'>" + tuser.userName + "</a></td>\n" +
            "            <td width=\"70\">" + tuser.userSex + "</td>\n" +
            "            <td width=\"120\">" + tuser.userBirthday + "</td>\n" +
            "            <td width=\"120\">" + tuser.userMobile + "</td>\n" +
            "            <td width=\"190\">" + tuser.userEmail + "</td>\n" +
            // "            <td width=\"90\"><a onclick='findUser(" + tuser.userId + ")'>详&nbsp;&nbsp;情</a></td>\n" +
            "            <td width=\"90\"><input class=\"delete\" type=\"image\" src=\"img/shanchu.png\"" +
            "onclick=\"deleteUser(" + tuser.userId + ")\"></td></tr>" + "/></td>\n" +
            "        </tr>"
    }

    function findUser(userId) {
        window.location.href = "userDetails_m.jsp?userID=" + userId
    }

    function deleteUser(userId) {
        if (confirm("确认要删除吗?"))
            window.location.href = "delete.jsp?type=user&userID=" + userId;
    }

</script>

</html>
