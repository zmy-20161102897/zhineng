<%@ page import="bean.Tuser" %>
<%@ page import="service.UserService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户详情</title>
    <link rel="stylesheet" type="text/css" href="css/userDetails_m.css">
</head>
<body>
<%
    int userId = Integer.parseInt(request.getParameter("userID"));
    Tuser user = new UserService().queryUserById(userId);
%>
<jsp:include page="head_m.jsp" flush="true"/>
<div class="userBox">
    <div class="title"><span>用&nbsp;&nbsp;户&nbsp;&nbsp;信&nbsp;&nbsp;息</span></div>
    <!--用户信息表格开始-->
    <div class="userMsg">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th rowspan="3" width="200"><img src="img/user/<%=user.getUserId()%>.png" /></th>
                <td width="120" class="textR">昵&nbsp;&nbsp;称：&nbsp;</td>
                <td width="200" class="textL"><%=user.getUserName()%></td>
                <td width="120" class="textR">性&nbsp;&nbsp;别：&nbsp;</td>
                <td width="180" class="textL"><%=user.getUserSex()%></td>
            </tr>
            <tr>
                <td width="120" class="textR">生&nbsp;&nbsp;日：&nbsp;</td>
                <td width="200" class="textL"><%=user.getUserBirthday()%></td>
                <td width="120" class="textR">联系方式：&nbsp;</td>
                <td width="180" class="textL"><%=user.getUserMobile()%></td>
            </tr>
            <tr>
                <td width="120" class="textR">住&nbsp;&nbsp;址：&nbsp;</td>
                <td width="200" class="textL"><%=user.getUserAddress()%></td>
                <td width="120" class="textR">邮箱地址：&nbsp;</td>
                <td width="180" class="textL"><%=user.getUserEmail()%></td>
            </tr>
        </table>
    </div>
    <!--用户信息表格结束-->
    <div class="title"><span>发&nbsp;&nbsp;表&nbsp;&nbsp;文&nbsp;&nbsp;章</span></div>
    <!--发布的文章开始-->

    <div class="article">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="600"><a href="invitationDetails_m.jsp">用户发布的文章一的名称</a></td>
                <td width="200" class="textC">2020-01-01</td>
            </tr>
            <tr>
                <td width="600"><a href="invitationDetails_m.jsp">用户发布的文章二的名称</a></td>
                <td width="200" class="textC">2020-01-02</td>
            </tr>
            <tr>
                <td width="600"><a href="invitationDetails_m.jsp">用户发布的文章三的名称</a></td>
                <td width="200" class="textC">2020-01-03</td>
            </tr>
            <tr>
                <td width="600"><a href="invitationDetails_m.jsp">用户发布的文章四的名称</a></td>
                <td width="200" class="textC">2020-01-04</td>
            </tr>
            <tr>
                <td width="600"><a href="articleDetails_m.jsp">用户发布的文章五的名称</a></td>
                <td width="200" class="textC">2020-01-05</td>
            </tr>
        </table>
    </div>
    <!--发布的文章结束-->
</div>
</body>
</html>
