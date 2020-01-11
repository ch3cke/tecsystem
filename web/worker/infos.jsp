<%--
  Created by IntelliJ IDEA.
  User: ch3ck
  Date: 2020/1/7
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>财务详细</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/featherlight.min.css">
    <link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script  src="../js/jquery-2.2.3.min.js"></script>

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


        }

        .midle{
            margin:3% 25%;

            width:60%;
        }
        .midle_so{
            border:1px solid rgba(0,0,0,0.2);
            margin:5%;

        }
        .sub{
            text-align:center;
            border-radius: 4px;
            margin: 5% 18%;
            width:15%;
        }
        .list1{
            width:40%;
            height: 40px;
            line-height: 40px;
            margin: 10px 0;
            border:1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 5px;
            /* 内容区width=padding+border */
            box-sizing: border-box;
        }
        .list{
            width:30%;
            height: 40px;
            line-height: 40px;
            margin: 10px 0;
            border:1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 5px;
            /* 内容区width=padding+border */
            box-sizing: border-box;
        }
        textarea{
            width:40%;
            height: 10%;
            line-height: 40px;
            margin: 10px 0;
            border:1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 5px;
            /* 内容区width=padding+border */
            box-sizing: border-box;
        }
        .fil{
            width:20%;
            height: 35px;
            line-height: 40px;
            margin: -5% 7% 0 9.5%;
            border:1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 5px;
            /* 内容区width=padding+border */
            box-sizing: border-box;
        }
        .nav-cta{
            cursor: pointer;
        }
        #navigation_b{
            display:none;
            float:left;
            position:relative;
            margin:5%;
            width:20%;
            border-radius:20%;
            border:2px solid green;
            color:green;
        }
        .list_b{
            cursor: pointer;
            height:60%;
            color:green;
        }</style>
</head>
<body>
<header id="top">
    <div class="wrapper">
        <h1 class="logo"><a href="#">Chase</a></h1>

        <nav>
            <ul id="navigation">
                <li><a href="home.html">主页</a></li>
                <li>
                    <a href="applicant.jsp">出差申请</a></li>
                <li>
                    <a href="finance.jsp">报销申请</a>
                </li>
                <li>
                    <a href="hischel.jsp">报表查询</a>
                </li>

                <li><a class="nav-cta" id="nav-cta" href="userinfo.jsp">个人中心</a></li>



                    <li class="list_b"><a  href="/logout">退出</a></li>

            </ul>
        </nav>
    </div>
</header>
<div class="midle">
    <div  class="mindle_table">
            <div  style="margin:15px 0;">
                申请编号：
                <nobr id = "Sid">
                </nobr>
            </div>
            <div  style="margin:15px 0">
                住宿说明：
                <textarea id = "Areason1">
                </textarea>
            </div>
            <div  style="margin:15px 0">车费说明：<textarea id = "Areason2">
                </textarea></div>
            <div  style="margin:15px 0">其他费用：<textarea id = "Areason3">
                </textarea></div>
            <div  style="margin:15px 0">预算：<nobr id = "Amoney"></nobr>
            </div>
            <div  style="margin:15px 0">申请时间：<nobr id= "Atime"></nobr></div>
            <div  style="margin:15px 0">票据：
                 <img id = path src="#"/>
            </div>
    </div>
</div>
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
<script  type="text/javascript">
    var sid = window.location.href.split("=")[1];
    console.log(sid);
    $(document).ready(function() {
        $.ajax({
            url: "/getschedulesne",//后台请求的数据，用的是PHP
            dataType: "json",//数据格式
            data: {'Sid':sid},
            type: "get",//请求方式
            async: false,//是否异步请求
            success: function (data) {
                $("#Sid").html(data.Sid);
                $("#Areason1").html(data.Areason1);
                $("#Areason2").html(data.Areason2);
                $("#Areason3").html(data.Areason3);
                $("#Amoney").html(data.Amoney);
                $("#Atime").html(data.Atime);
                document.getElementById("path").src="../upload/"+data.path;
                console.log(data);
            },
        })
    })
</script>
</body>
</html>
