<%@ page import="bean.Tmessage" %>
<%@ page import="bean.Tuser" %>
<%@ page import="bean.Tcomment" %>
<%@ page import="service.MessageService" %>
<%@ page import="service.CommentService" %>
<%@ page import="service.UserService" %>
<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/15
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子详情</title>
    <link rel="stylesheet" type="text/css" href="css/invitationDetails_m.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <%
        MessageService messageService = new MessageService();
        int mesId = Integer.parseInt(request.getParameter("mesID"));
        Tmessage tmessage = messageService.queryMessageByMesId(mesId);
        Tuser tuser = new UserService().queryUserById((int) tmessage.getUserId());
    %>
    <div class="container">
        <!--标题及回复数开始-->
        <h3 class="invitation-title"><%=tmessage.getFullMessageSubject()%></h3>
        <!--标题及回复数结束-->
        <!--主贴开始-->
        <div class="main-invitation">
            <!--头像和昵称开始-->
            <div class="initiator">
                <img class="initiator-img" src='img/user/<%=tuser.getUserId()%>.png'>
                <a class="initiator-name" href="userDetails_m.jsp" target="_blank"><%=tuser.getUserName()%></a>
            </div>
            <!--头像和昵称结束-->
            <!--主贴内容开始-->
            <div class="invitation-content">
                <p style="text-indent: 2em"><%=tmessage.getMesText()%></p>
                <div class="invitation-else">
                    <span class="invitation-date"><%=tmessage.getMesDate()%></span>
                    <span class="reply-number">回复数：15558</span>
                </div>
            </div>
            <!--主贴内容结束-->
        </div>
        <!--主贴结束-->
        <!--回复开始-->
        <div class="answer-invitation">
            <!--头像和昵称开始-->
            <div class="answerer">
                <img class="answerer-img" src="img/user.png">
                <a class="answerer-name" href="userDetails_m.jsp" target="_blank">用户昵称用户昵称用户</a>
            </div>
            <!--头像和昵称结束-->
            <!--回复内容开始-->
            <div class="answer-content">
                <p style="text-indent: 2em">智能家居是以住宅为平台， 利用技术将家居生活有关的设施集成</p>
                <div class="answer-else">
                    <span class="answer-date">2020-03-27&nbsp;12:20:18</span>
                    <div class="check-comment">
                        <a class="check-all-comment" href="#">所有评论</a>
                    </div>
                    <a class="delete-answer">删除</a>
                </div>
                <!--评论开始-->
                <div class="all-comment">
                    <ul>
                        <li>
                            <img src="img/user.png">
                            <div class="comment-content">
                                <a class="comment-user-name" href="userDetails_m.jsp">此处显示用户名aaaa&nbsp;&nbsp;</a>
                                <span>此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容此处显示评论内容</span>
                                <div class="comment-else">
                                    <span class="comment-date">2020-04-08&nbsp;15:03:15</span>
                                    <a href="#">删除</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--评论结束-->
            </div>
            <!--回复内容结束-->
        </div>
        <!--回复结束-->
    </div>

</body>
</html>
