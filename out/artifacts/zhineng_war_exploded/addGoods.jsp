<%@ page import="java.util.List" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.GoodsService" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/4/26
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String type = request.getParameter("type");
    if ("goods".equals(type)) {
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        String productName = request.getParameter("productName");
        String recommendedReason = request.getParameter("recommendedReason");
        String commodityPrice = request.getParameter("commodityPrice");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        List<String> coverList = (List<String>) session.getAttribute("cover");
        List<String> introList = (List<String>) session.getAttribute("intro");

        int insert = new GoodsService().insertGoods(adminId, productName, recommendedReason, commodityPrice
                , brand, model, coverList, introList);
        response.sendRedirect("goods_m.jsp");
    } else if ("cover".equals(type) || "intro".equals(type)) {
        List<String> blobList = (List<String>) session.getAttribute(type);
        session.removeAttribute(type);
        if (blobList == null) {
            blobList = new ArrayList<>();
        }

        String data = request.getParameter("data");
        blobList.add(data);
        session.setAttribute(type, blobList);
    } else if ("cover_del".equals(type) || "intro_del".equals(type)) {
        String newType = type.split("_")[0];
        List<String> blobList = (List<String>) session.getAttribute(newType);
        session.removeAttribute(newType);

        String data = request.getParameter("data");
        blobList.removeIf(blob -> blob.equals(data));
        session.setAttribute(newType, blobList);
    }
%>
</body>
</html>
