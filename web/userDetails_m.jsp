<%@ page import="bean.Tuser" %>
<%@ page import="service.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Tmessage" %>
<%@ page import="service.MessageService" %><%--
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

<%!
    String developShow;
    String invitationShow;
%>

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
    <div class="title"><span>发&nbsp;&nbsp;表&nbsp;&nbsp;的&nbsp;&nbsp;文&nbsp;&nbsp;章</span></div>
    <!--发布的文章开始-->
    <%
        List<Tmessage> developList = new MessageService().queryDevelopByUserId(userId);

        StringBuilder developShowBuilder = new StringBuilder();
        for (Tmessage tdevelop : developList) {
            developShowBuilder.append("<tr><td width=\"600\"><a href=\"developDetails_m.jsp?mesID=");
            developShowBuilder.append(tdevelop.getMesId());
            developShowBuilder.append("\">");
            developShowBuilder.append(tdevelop.getMesSubject(30));
            developShowBuilder.append("</a></td><td width=\"200\" class=\"textC\">");
            developShowBuilder.append(tdevelop.getMesDate());
            developShowBuilder.append("</td></tr>");
        }
        developShow = developShowBuilder.toString();
    %>
    <div class="article">
        <table border="0" cellspacing="0" cellpadding="0" id="myDevelop"><%=developShow%></table>
    </div>
    <!--发布的文章结束-->
    <!--发布的帖子开始-->
    <div class="title"><span>发&nbsp;&nbsp;布&nbsp;&nbsp;的&nbsp;&nbsp;帖&nbsp;&nbsp;子</span></div>
    <%
        List<Tmessage> invitationList = new MessageService().queryInvitationByUserId(userId);

        StringBuilder invitationShowBuilder = new StringBuilder();
        for (Tmessage tinvitation : invitationList) {
            invitationShowBuilder.append("<tr><td width=\"600\"><a href=\"invitationDetails_m.jsp?mesID=");
            invitationShowBuilder.append(tinvitation.getMesId());
            invitationShowBuilder.append("\">");
            invitationShowBuilder.append(tinvitation.getMesSubject(30));
            invitationShowBuilder.append("</a></td><td width=\"200\" class=\"textC\">");
            invitationShowBuilder.append(tinvitation.getMesDate());
            invitationShowBuilder.append("</td></tr>");
        }
        invitationShow = invitationShowBuilder.toString();
    %>
    <div class="invitation">
        <table border="0" cellspacing="0" cellpadding="0" id="myInvitation"><%=invitationShow%></table>
    </div>
    <!--发布的文章结束-->
</div>
</body>
</html>
