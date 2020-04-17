<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/12
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加公告</title>
    <link rel="stylesheet" type="text/css" href="css/noticeAdd_m.css">
</head>
<body>
    <jsp:include page="head_m.jsp" flush="true"/>
    <div class="noticeBox">
        <h1>发&nbsp;&nbsp;布&nbsp;&nbsp;公&nbsp;&nbsp;告</h1>
        <form action="addNotice.jsp" method="post">
            <div class="noticeTitle">
                <span>标题：</span>
                <input type="text" name="title" required onkeyup="noticeTitleLength(this)"/>
            </div>
            <div class="noticeText">
                <span>正文：</span>
                <textarea name="text" required></textarea>
            </div>
            <div class="noticeBtn">
                <button type="submit" class="btnSave">发&nbsp;&nbsp;布</button>
                <button type="button" class="btnQuit" onclick="history.back(-1)">退&nbsp;&nbsp;出</button>
            </div>
        </form>
    </div>

    <script type="text/javascript">
        function noticeTitleLength(which) {
            var maxChars = 30; //
            if(which.value.length > maxChars){
                alert("最多输入30个字!");
                // 超过限制的字数了就将 文本框中的内容按规定的字数 截取 从第一个字符开始到上限
                which.value = which.value.substring(0,maxChars);
                return false;
            }
        }
    </script>

</body>
</html>
