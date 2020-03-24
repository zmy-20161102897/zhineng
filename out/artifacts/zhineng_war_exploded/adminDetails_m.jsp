<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/13
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员详情</title>
    <link rel="stylesheet" type="text/css" href="css/adminDetails_m.css">
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <div class="adminBox">
        <div class="title1"><span>管&nbsp;&nbsp;理&nbsp;&nbsp;员&nbsp;&nbsp;信&nbsp;&nbsp;息</span></div>
        <!--管理员信息表格开始-->
        <div class="adminMsg">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th rowspan="3" width="200"><img src="img/user.png" /></th>
                    <td width="120" class="textR">昵&nbsp;&nbsp;称：&nbsp;</td>
                    <td width="200" class="textL">&nbsp;我的昵称</td>
                    <td width="120" class="textR">性&nbsp;&nbsp;别：&nbsp;</td>
                    <td width="180" class="textL">&nbsp;男</td>
                </tr>
                <tr>
                    <td width="120" class="textR">生&nbsp;&nbsp;日：&nbsp;</td>
                    <td width="200" class="textL">&nbsp;1997-11-29</td>
                    <td width="120" class="textR">联系方式：&nbsp;</td>
                    <td width="180" class="textL">&nbsp;13811112222</td>
                </tr>
                <tr>
                    <td width="120" class="textR">住&nbsp;&nbsp;址：&nbsp;</td>
                    <td width="200" class="textL">&nbsp;内蒙古自治区锡林郭勒盟</td>
                    <td width="120" class="textR">邮箱地址：&nbsp;</td>
                    <td width="180" class="textL">&nbsp;1317137103@qq.com</td>
                </tr>
            </table>
        </div>
        <!--管理员信息表格结束-->
        <div class="title2"><span>发&nbsp;&nbsp;表&nbsp;&nbsp;公&nbsp;&nbsp;告</span></div>
        <!--发布的公告开始-->
        <div class="adminNotice">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="600"><a href="noticeDetails_m.jsp">管理员发布公告一的名称</a></td>
                    <td width="200" class="textC">2020-01-01</td>
                </tr>
                <tr>
                    <td width="600"><a href="noticeDetails_m.jsp">管理员发布公告二的名称</a></td>
                    <td width="200" class="textC">2020-01-02</td>
                </tr>
                <tr>
                    <td width="600"><a href="noticeDetails_m.jsp">管理员发布公告三的名称</a></td>
                    <td width="200" class="textC">2020-01-03</td>
                </tr>
            </table>
        </div>
        <!--发布的公告结束-->
    </div>
</body>
</html>
