<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/featherlight.min.css">
    <link href='../css/css.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <script src="../js/jquery-latest.min.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        html, body {
            font-size: 100%;
        //background: url(../images/img1.png) no-repeat 0px 0px;
            background-size: cover;
        }

        #top{
            background-color:rgb(255,240,245,0);
        }
    </style>
</head>
<body>
<header id="top">
    <div class="wrapper">
        <h1 class="logo"><a href="#">Chase</a></h1>
        <nav>
            <ul id="navigation">
                <li><a href="home.jsp">主页</a></li>
                <li>
                    <a href="applicant.jsp">出差申请</a></li>
                <li>
                    <a href="finance.jsp">报销申请</a>
                </li>
                <li>
                    <a href="hischel.jsp">报表查询</a>
                </li>

                <li><a class="nav-cta" href="#">个人中心</a></li>
            </ul>
        </nav>
    </div>
</header>
<div id="middle">
    <div id="demo" class="carousel slide" data-ride="carousel" data-interval="3000">

        <!-- 指示符 -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- 轮播图片 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
            </div>
            <div class="carousel-item">
                <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
            </div>
            <div class="carousel-item">
                <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
            </div>
        </div>

        <!-- 左右切换按钮 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <div class="right-table">
        <div id="test"></div>
    </div>
</div>
<section class="text-section">
</section>
<footer>
    <div class="wrapper">
        <a class="logo" href="#">Chase</a>
        <div class="footer-left">
            <p class="footer-links"><a href="#">Contact Us</a> I <a href="#">Terms &amp; Conditions</a> I<a href="#">Privacy</a></p>
        </div>
        <div class="footer-right">
            <a href="#" class="social facebook">Facebook</a>
            <a href="#" class="social twitter">Facebook</a>
            <a href="#" class="social google">Facebook</a>
        </div>
        <div class="clear"></div>
    </div>
</footer>
<script type="text/javascript">
    $(document).ready(function() {
        $.ajax({
            url : "/getten",//后台请求的数据，用的是PHP
            dataType : "json",//数据格式
            type : "get",//请求方式
            async : false,//是否异步请求
            success : function(data) {   //如果请求成功，返回数据。
                console.log(data);
                var html = "<table class=\"table table-striped\">\n" +
                    "            <thead>\n" +
                    "            <h2 style=\"text-align:center\"><img src=\"../images/medal.png\" style=\"width:40px;height:40px;margin-right:3px\">奖 牌 榜</h1>\n"+
                "            <tr>\n" +
                "                <th>工号</th>\n" +
                "                <th>姓名</th>\n" +
                "                <th>奖牌数</th>\n" +
                "            </tr>\n" +
                "            </thead>\n" +
                "            <tbody>";
                for(var i=0;i<data.length;i++){    //遍历data数组
                    var ls = data[i];
                    html +="<tr><td>"+ls.id;
                    html +="</td><td>"+ls.username;
                    html +="</td><td>"+ls.medals+"</td><td>";
                }
                html+"</tbody>\n" +
                "\n" +
                "        </table>"
                $("#test").html(html); //在html页面id=test的标签里显示html内容
                console.log(html)
            },
        })
    })
</script>
</body>
</html>