<%@ page import="bean.Tgoods" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="service.GoodsService" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="css/goods_m.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<!--搜索开始-->
<div class="goodsSearch">
    <button class="btnGoods" onclick="window.location.href='goodsAdd_m.jsp'">添加推荐商品</button>
    <form>
        <input class="search01" type="text" id="autocomplete-ajax"/>
        <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"/>
        <input class="search02" type="image" src="img/search.png"/>
    </form>
</div>
<!--搜索结束-->
<!--商品管理表格开始-->
<%
    List<Tgoods> goodsList = new GoodsService().queryAllGoods();

    Map<Long, String> goodsMap = new HashMap<>();
    for (Tgoods tgoods : goodsList) {
        goodsMap.put(tgoods.getGoodsId(), tgoods.getGoodsName());
    }
%>
<div class="goodsTable">
    <table border="0" cellspacing="0" cellpadding="0" id="allGoods"></table>
</div>
<!--商品管理表格结束-->
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
        goodsStr =
            <%=JSON.toJSONString(goodsList)%>
            console.log(goodsStr)
        var goodArray = $.map(<%=JSON.toJSONString(goodsMap)%>, function (value, key) {
            return {value: value, data: key};
        })

        // console.log(goodsStr)
        // console.log(goodArray)

        pagiantion(goodsStr, 3)
        search(goodArray)

        $("td").each(function (i, el) {
            var td = parseFloat($(el).text());
            if (!isNaN(td)) {
                $(el).text(td.toFixed(2));
            }
        });
    })

    function getPageData(pageNum, pageSize) {
        var goods = goodsStr.slice(pageNum * pageSize, (pageNum + 1) * pageSize)
        console.log(goods)
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"190\"></th>\n" +
            "                <th width=\"450\">商品名称</th>\n" +
            "                <th width=\"110\">价格</th>\n" +
            // "                <th width=\"120\">详&nbsp;&nbsp;情</th>\n" +
            "                <th width=\"110\">操&nbsp;&nbsp;作</th>\n" +
            "            </tr>"
        for (var tgoods of goods) {
            html += getGoodsHtml(tgoods)
        }
        $("#allGoods").html(html)
    }

    function showSelectMsg(goodsId) {
        var html = "<tr bgcolor=\"#FFCF9F\" height=\"40\">\n" +
            "                <th width=\"190\"></th>\n" +
            "                <th width=\"450\">商品名称</th>\n" +
            "                <th width=\"110\">价格</th>\n" +
            // "                <th width=\"120\">详&nbsp;&nbsp;情</th>\n" +
            "                <th width=\"110\">操&nbsp;&nbsp;作</th>\n" +
            "            </tr>"
        for (var tgoods of goodsStr) {
            if (tgoods.goodsId == goodsId) {
                html += getGoodsHtml(tgoods)
                $("#allGoods").html(html)
                $("#pageLine").hide()
                return
            }
        }
    }

    function getGoodsHtml(tgoods) {
        return "<tr height=\"120px\">\n" +
            "                <td width=\"190\"><img src=\"img/goods/" + tgoods.goodsId + "_cover1.png\" height=\"100px\" width=\"100px\"/></td>\n" +
            "                <td width=\"450\" style=\"text-align: left\"><a href=\"goodsDetails_m.jsp?goodsID=" + tgoods.goodsId + "\">" + tgoods.goodsName + "</a></td>\n" +
            "                <td width=\"110\">" + tgoods.goodsPrice + "</td>\n" +
            // "                <td width=\"120\"><a href=\"goodsDetails_m.jsp?goodsID=" + tgoods.goodsId + "\">详&nbsp;&nbsp;情</a></td>\n" +
            "                <td width=\"110\">\n" +
            "                    <input class=\"revise\" type=\"image\" src=\"img/xiugai.png\" />\n" +
            "                    <input class=\"delete\" type=\"image\" src=\"img/shanchu.png\" onclick='deleteGoods(" +
            tgoods.goodsId + ")'/>\n" +
            "                </td>\n" +
            "            </tr>"
    }

    function deleteGoods(goodsId) {
        if (confirm("确认要删除吗?"))
            window.location.href = "delete.jsp?type=goods&goodsID=" + goodsId
    }

</script>

</html>
