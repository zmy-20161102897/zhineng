<%@ page import="bean.Tadmin" %>
<%@ page import="bean.Tnotice" %>
<%@ page import="service.AdminService" %>
<%@ page import="service.NoticeService" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Tgoods" %>
<%@ page import="service.GoodsService" %>
<%@ page import="com.mysql.cj.x.protobuf.MysqlxDatatypes" %>
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
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="css/information_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
</head>
<body>
<jsp:include page="head_m.jsp" flush="true"/>
<%!
    String showChangeHeadImgButton;
    Tadmin checkAdmin;
    String noticeShow;
    String goodsShow;
%>
<%
    int curAdminId = Integer.parseInt(request.getParameter("adminID"));
    Tadmin tadmin = (Tadmin) request.getSession().getAttribute("admin");
    if (curAdminId == tadmin.getAdminId()) {
        showChangeHeadImgButton = "<tr id=\"changeHeadImg\">\n" +
                "                <td width=\"120\" style=\"border-bottom-style: none;text-align: center\">\n" +
                "                    <input type=\"file\" style=\"display: none\" id=\"btn_file\">\n" +
                "                    <button onclick=\"F_Open_dialog()\">修改头像</button>\n" +
                "                </td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "            </tr>";
    } else {
        showChangeHeadImgButton = "<tr id=\"changeHeadImg\">\n" +
                "                <td width=\"120\" style=\"border-bottom-style: none;text-align: center\"></td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "                <td style=\"border-bottom-style: none\"></td>\n" +
                "            </tr>";
    }

    checkAdmin = new AdminService().queryAdminById(curAdminId);
%>
<div class="myBox">
    <div class="title1"><span>管&nbsp;&nbsp;理&nbsp;&nbsp;员&nbsp;&nbsp;信&nbsp;&nbsp;息</span></div>
    <!--管理员信息表格开始-->
    <div class="myMsg">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th rowspan="3" width="200" id="adminHeadImg"><img src='img/admin/<%=checkAdmin.getAdminId()%>.png'
                                                                   id="headImg"></th>
                <td width="120" class="textR">昵&nbsp;&nbsp;称：&nbsp;</td>
                <td width="200" class="textL" id="adminName"><%=checkAdmin.getAdminName()%>
                </td>
                <td width="120" class="textR">性&nbsp;&nbsp;别：&nbsp;</td>
                <td width="180" class="textL" id="adminSex"><%=checkAdmin.getAdminSex()%>
                </td>
            </tr>
            <tr>
                <td width="120" class="textR">生&nbsp;&nbsp;日：&nbsp;</td>
                <td width="200" class="textL" id="adminBirthday"><%=checkAdmin.getAdminBirthday()%>
                </td>
                <td width="120" class="textR">联系方式：&nbsp;</td>
                <td width="180" class="textL" id="adminMobile"><%=checkAdmin.getAdminMobile()%>
                </td>
            </tr>
            <tr>
                <td width="120" class="textR">住&nbsp;&nbsp;址：&nbsp;</td>
                <td width="200" class="textL" id="adminAddress"><%=checkAdmin.getAdminAddress()%>
                </td>
                <td width="120" class="textR">邮箱地址：&nbsp;</td>
                <td width="180" class="textL" id="adminEmail"><%=checkAdmin.getAdminEmail()%>
                </td>
            </tr>
            <%=showChangeHeadImgButton%>
        </table>
    </div>
    <!--管理员信息表格结束-->
    <div class="title2"><span>发&nbsp;&nbsp;表&nbsp;&nbsp;公&nbsp;&nbsp;告</span></div>
    <!--发布的公告开始-->
    <%
        List<Tnotice> noticeList = new NoticeService().queryNoticeByAdminId(curAdminId);

        StringBuilder noticeShowBuilder = new StringBuilder();
        for (Tnotice tnotice : noticeList) {
            noticeShowBuilder.append("<tr><td width=\"600\"><a href=\"noticeDetails_m.jsp?noticeID=");
            noticeShowBuilder.append(tnotice.getNoticeId());
            noticeShowBuilder.append("\">");
            noticeShowBuilder.append(tnotice.getNoticeTitle(18));
            noticeShowBuilder.append("</a></td><td width=\"200\" class=\"textC\">");
            noticeShowBuilder.append(tnotice.getNoticeDate());
            noticeShowBuilder.append("</td></tr>");
        }
        noticeShow = noticeShowBuilder.toString();
    %>
    <div class="myNotice">
        <table border="0" cellspacing="0" cellpadding="0" id="allNotice"><%=noticeShow%>
        </table>
    </div>
    <!--发布的公告结束-->
    <!--发布的商品开始-->
    <div class="title3"><span>发&nbsp;&nbsp;布&nbsp;&nbsp;商&nbsp;&nbsp;品</span></div>
    <%
        List<Tgoods> goodsList = new GoodsService().queryGoodsByAdminId(curAdminId);

        StringBuilder goodsShowBuilder = new StringBuilder();
        for (Tgoods tgoods : goodsList) {
            goodsShowBuilder.append("<tr><td width=\"600\"><a href=\"goodsDetails_m.jsp?goodsID=?");
            goodsShowBuilder.append(tgoods.getGoodsId());
            goodsShowBuilder.append("\">");
            goodsShowBuilder.append(tgoods.getGoodsName());
            goodsShowBuilder.append("</a></td><td width=\"200\" class=\"textC myGoodsPrice\">");
            goodsShowBuilder.append(tgoods.getGoodsPrice());
            goodsShowBuilder.append("</td></tr>");
        }
        goodsShow = goodsShowBuilder.toString();
    %>
    <div class="myGoods">
        <table border="0" cellspacing="0" cellpadding="0" id="myGoods"><%=goodsShow%>
        </table>
    </div>

    <!--发布的商品结束-->
</div>
</body>

<script>

    $(function () {
        document.querySelector("#btn_file").onchange = function () {
            if (this.files.length) {
                let file = this.files[0];
                let reader = new FileReader();
                //新建 FileReader 对象
                reader.onload = function () {
                    if (confirm("确定要修改吗")) {
                        // 当 FileReader 读取文件时候，读取的结果会放在 FileReader.result 属性中
                        document.querySelector('#headImg').src = this.result;
                        console.log(this.result.split(",")[1])
                        alert("修改成功")

                        $.post("updateHeadImg.jsp", {
                            adminID:${sessionScope.admin.adminId},
                            file_data: this.result.split(",")[1]
                        }, "json")
                    }
                };
                // 设置以什么方式读取文件，这里以base64方式
                reader.readAsDataURL(file);
            }
        }
    })

    function F_Open_dialog() {
        var headImg = document.getElementById("btn_file")
        headImg.click()
    }

    $(".myGoodsPrice").each(function (i, el) {
        var td = parseFloat($(el).text());
        if (!isNaN(td)) {
            $(el).text(td.toFixed(2));
        }
    });

</script>

</html>
