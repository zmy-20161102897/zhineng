<%@ page import="utils.Img2StrUtils" %>
<%@ page import="service.AdminService" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/3/23
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int adminId = Integer.parseInt(request.getParameter("adminID"));
    String headImgData = request.getParameter("file_data");

    File headImg = new File("D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\admin\\" + adminId + ".png");
    headImg.delete();
    int update = new AdminService().updateHeadImg(adminId,headImgData);

    response.sendRedirect("information_m.jsp?adminID=" + adminId);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
