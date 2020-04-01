<%--
  Created by IntelliJ IDEA.
  User: 44137
  Date: 2020/3/30
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="css/uploadGoodsImg.css">
<body>
<%--    <div class="aui-content-up">--%>
    <div class="uploadPhotoBox uploadImg clear">
        <section class="uploadBackImg fl">
            <img src="img/up.png" class="addImg">
            <input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png" multiple/>
        </section>
    </div>
<%--    </div>--%>
    <!-- mask begin -->
    <div class="mask aui-works-mask">
        <div class="maskContent">
            <p class="deleteText">确定要删除你上传的资料？</p>
            <p class="delCheckText">
                <span class="deleteImg aui-accept-ok">确定</span>
                <span class="aui-accept-no">取消</span>
            </p>
        </div>
    </div>
<!-- mask end -->
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<%--<script type="text/javascript" src="js/up.js"></script>--%>
</body>

<script>

    $(function() {
        var delParent;
        var defaults = {
            fileType: ["jpg", "png", "bmp", "jpeg"],
            // 上传图片支持的格式
            //fileSize: 1024 * 1024 * 10 // 上传的图片大小不得超过 10M
        };
        /*点击图片*/
        $(".file").change(function() {
            var idFile = $(this).attr("id");
            var file = document.getElementById(idFile);
            var imgContainer = $(this).parents(".uploadPhotoBox");
            //存放图片的父元素
            var fileList = file.files;
            //获取的图片文件
            console.log(fileList + "======filelist=====");
            var input = $(this).parent();
            //文本框的父亲元素
            var imgArr = [];
            //遍历得到的图片
            var numUp = imgContainer.find(".showImgSection").length;
            var totalNum = numUp + fileList.length;
            //图片总的数量可自定义
            if (fileList.length > 5 || totalNum > 5) {
                alert("你好！上传图片不得超过5张，请重新选择");
                //一次选择上传超过3个  自己定义
            } else if (numUp < 5) {
                fileList = validateUp(fileList);
                for (var i = 0; i < fileList.length; i++) {
                    var imgUrl = window.URL.createObjectURL(fileList[i]);
                    imgArr.push(imgUrl);
                    var $section = $("<section class='showImgSection fl loading'>");
                    imgContainer.prepend($section);
                    var $span = $("<span class='aui-up-span'>");
                    $span.appendTo($section);

                    var $img0 = $("<img class='closeShowImg'>").on("click", function(event) {
                        event.preventDefault();
                        event.stopPropagation();
                        $(".aui-works-mask").show();
                        delParent = $(this).parent();
                    });
                    $img0.attr("src", "img/close.png").appendTo($section);
                    var $img = $("<img class='aui-to-up-img aui-up-clarity'>");
                    $img.attr("src", imgArr[i]);
                    $img.appendTo($section);
                    var $p = $("<p class='imgNameP'>");
                    $p.html(fileList[i].name).appendTo($section);
                    var $input = $("<input id='actionId' name='actionId' value='' type='hidden'>");
                    $input.appendTo($section);
                    var $input2 = $("<input id='tags' name='tags' value='' type='hidden'/>");
                    $input2.appendTo($section);

                }
            }
            setTimeout(function() {
                $(".showImgSection").removeClass("loading");
                $(".aui-to-up-img").removeClass("aui-up-clarity");
            }, 4100);
            numUp = imgContainer.find(".showImgSection").length;
            if (numUp >= 5) {
                $(this).parent().hide();
            }

            $(this).val("");
        });

        $(".uploadPhotoBox").delegate(".closeShowImg", "click", function() {
            $(".aui-works-mask").show();
            delParent = $(this).parent();
        });

        $(".aui-accept-ok").click(function() {
            $(".aui-works-mask").hide();
            var numUp = delParent.siblings().length;
            if (numUp < 5) {
                delParent.parent().find(".uploadBackImg").show();
            }
            delParent.remove();

        });

        $(".aui-accept-no").click(function() {
            $(".aui-works-mask").hide();
        });

        function validateUp(files) {
            var arrFiles = [];
            //替换的文件数组
            for (var i = 0, file; file = files[i]; i++) {
                //获取图片上传的后缀名
                var newStr = file.name.split("").reverse().join("");
                if (newStr.split(".")[0] != null) {
                    var type = newStr.split(".")[0].split("").reverse().join("");
                    console.log(type + "===type===");
                    if (jQuery.inArray(type, defaults.fileType) > -1) {
                        // 符合图片格式，可以上传
                        if (file.size >= defaults.fileSize) {
                            alert(file.size);
                            alert('您这个"' + file.name + '"文件大小过大');
                        } else {
                            arrFiles.push(file);
                        }
                    } else {
                        alert('您这个"' + file.name + '"上传类型不符合');
                    }
                } else {
                    alert('您这个"' + file.name + '"没有类型, 无法识别');
                }
            }
            return arrFiles;
        }
    });

</script>

</html>
