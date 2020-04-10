<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/4/8
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="css/myInfor.css">
    <script src="js/jquery-3.4.1.js" type="text/javascript"  charset="utf-8"></script>
</head>
<body>

    <jsp:include page="head_m.jsp" flush="true"/>
    <div class="tab-block">
        <!--选项卡开始-->
        <div class="tab-buttons">
            <h3 class="tab-button cur" data-tab="one">个人信息</h3>
            <h3 class="tab-button" data-tab="two">修改密码</h3>
            <h3 class="tab-button" data-tab="three">公告</h3>
            <h3 class="tab-button" data-tab="four">商品</h3>
        </div>
        <!--选项卡结束-->
        <!--选项卡内容开始-->
        <div class="tabs">
            <!--修改个人信息开始-->
            <div class="tab-item active" id="tab-one">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="Ltd">昵称：</td>
                        <td class="Rtd" style="width: 200px">管理员昵称哒哒哒哒哒</td>
                        <td class="myImg" rowspan="3">
                            <img src="img/user.png">
                            <button style="display: block">修改头像</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="Ltd">性别：</td>
                        <td class="Rtd" style="width: 200px">女</td>
                    </tr>
                    <tr>
                        <td class="Ltd">出生日期：</td>
                        <td class="Rtd" style="width: 200px">1997-11-29</td>
                    </tr>
                    <tr>
                        <td class="Ltd">电子邮箱：</td>
                        <td class="Rtd" colspan="2">
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <td class="Ltd">手机号码：</td>
                        <td class="Rtd" colspan="2">
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <td class="Ltd">所在地：</td>
                        <td class="Rtd" colspan="2">
                            <select></select>
                            <select></select>
                            <select></select>
                        </td>
                    </tr>
                </table>
                <div class="saveButton"><a href="#" class="saveMyInfo">保存修改</a></div>
                <!--保存按钮开始-->
                <div></div>
                <!--保存按钮结束-->
            </div>
            <!--修改个人信息结束-->
            <div class="tab-item" id="tab-two">
                <ul>
                    <li>
                        <label>原密码：</label>
                        <input type="password" class="oldPassWord">
                        <span></span>
                    </li>
                    <li>
                        <label>新密码：</label>
                        <input type="password" class="newPassWord">
                        <span></span>
                    </li>
                    <li>
                        <label>确认密码：</label>
                        <input type="password" class="finalPassWord">
                        <span></span>
                    </li>
                </ul>
            </div>
            <div class="tab-item" id="tab-three">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒1111111111</a></td>
                        <td class="rWidth">2015-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒2222222222</a></td>
                        <td class="rWidth">2016-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒3333333333</a></td>
                        <td class="rWidth">2017-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒4444444444</a></td>
                        <td class="rWidth">2018-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒5555555555</a></td>
                        <td class="rWidth">2019-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">哒哒哒哒哒哒哒哒哒6666666666</a></td>
                        <td class="rWidth">2020-10-22</td>
                    </tr>
                </table>
            </div>
            <div class="tab-item" id="tab-four">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品1111111111</a></td>
                        <td class="rWidth">2015-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品2222222222</a></td>
                        <td class="rWidth">2016-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品3333333333</a></td>
                        <td class="rWidth">2017-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品4444444444</a></td>
                        <td class="rWidth">2018-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品5555555555</a></td>
                        <td class="rWidth">2019-10-22</td>
                    </tr>
                    <tr>
                        <td class="lWidth"><a href="noticeDetails_m.jsp">商品商品商品6666666666</a></td>
                        <td class="rWidth">2020-10-22</td>
                    </tr>
                </table>
            </div>
        </div>
        <!--选项卡内容结束-->
    </div>

<script type="text/javascript">
    //tab切换
    $('.tab-button').click(function () {
        var tab = $(this).data('tab')
        $(this).addClass('cur').siblings('.tab-button').removeClass('cur');
        $('#tab-' + tab + '').addClass('active').siblings('.tab-item').removeClass('active');
    });

    //保存修改按钮
    const buttons = document.querySelectorAll('a');
    buttons.forEach(btn => {
        btn.addEventListener('click',function (e) {

            let x = e.clientX - e.target.offsetLeft;
            let y = e.clientY - e.target.offsetTop;

            let ripples = document.createElement('span');
            ripples.style.left = x + 'px';
            ripples.style.top = y + 'px';
            this.appendChild(ripples);

            setTimeout(() => {
                ripples.remove()
            },1000);
        })
    })
</script>

</body>

</html>
