<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2020/3/21
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/jquery.mockjax.js"></script>
    <script type="text/javascript" src="js/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="js/demo.js"></script>
    <script type="text/javascript" src="js/countries.js"></script>
</head>
<body>

<div style="position: relative; height: 80px;">
    <input type="text" name="country" id="autocomplete-ajax"
           style="position: absolute; z-index: 2; background: transparent;"/>
    <input type="text" name="country" id="autocomplete-ajax-x" disabled="disabled"
           style="color: #CCC; position: absolute; background: transparent; z-index: 1;"/>
</div>
<div id="selction-ajax"></div>

</body>
</html>
