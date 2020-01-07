<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>历史出差页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/featherlight.min.css">
    <link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
        form{
            width:800px;
            margin:20px;
        }
        .midle{
            background-color:#fff;
            margin:22px;
            margin-top:40px;
            margin-left:100px;
            height:500px;
            background-color:rgb(255,240,245,0);
        }
        .midle_so{
            border:1px solid rgba(0,0,0,0.2);
            margin:20px;
        }

        input{
            width:20%;
            height: 35px;
            line-height: 40px;
            margin: 10px 0;
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
            margin 5%;
            width:20%;
            border-radius:20%;
            border:2px solid green;
            color:green;
        }
        .list{
            cursor: pointer;
            height:60%;
            color:green;
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

                <li><a class="nav-cta" id="nav-cta" href="userinfo.jsp">个人中心</a></li>

                <li ><a  href="/logout.do">退出</a></li>
            </ul>
        </nav>
    </div>
</header>
<div class="midle">
    <div  class="mindle_table">
        <p id = "test"></p>
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
<script type="text/javascript">
    function getXmlHttpObject(){
        var xmlHttpRequest;
        /*不同的浏览器获取对象xmlhttprequest 对象的方法不同*/
        if(window.ActiveXObject){
            xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
        }
        else
            xmlHttpRequest=new XMLHttpRequest();
        return xmlHttpRequest;
    }

    $(document).ready(function() {
        $.ajax({
            url : "/userinfoapplicant.do",//后台请求的数据，用的是PHP
            dataType : "json",//数据格式
            type : "get",//请求方式
            async : false,//是否异步请求
            success : function(data) {   //如果请求成功，返回数据。
                console.log(data);
                var html = "<table class=\"table\">\n" +
                    "            <thead>\n" +
                    "            <tr>\n" +
                    "                <th>记录编号</th>\n" +
                    "                <th>出差地点</th>\n" +
                    "                <th>费用</th> <th>状态</th>\n" +
                    "            </tr>\n" +
                    "            </thead>\n" +
                    "            <tbody>";
                for(var i=0;i<data.length;i++){    //遍历data数组
                    var ls = data[i];
                    html +="<tr><td>"+ls.Sid;
                    html +="</td><td>"+ls.Aplace;
                    html +="</td><td>"+ls.Amoney+"</td><td>";
                    if(ls.isgive == 1){
                        html = html+"given</td></tr>";
                    }else {
                        html = html+"not</td></tr>";
                    }
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