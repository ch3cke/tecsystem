<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>历史出差查询</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/normalize.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/featherlight.min.css">
	<link href="../css/css.css" rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="../js/jquery-2.2.3.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

form{
	width:800px;
	margin:20px;
}
  .midle{
background-color:#fff;
margin:3% 20%;
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
                <a href="audit.html">报表审核</a>
            </li>
                     <li>  
                <a href="hischel1.jsp">报表统计</a>
            </li>
                    <li>  
                <a href="hischel.jsp">报表查询</a>
            </li>
					<li><a class="nav-cta" href="userinfo.jsp" >个人中心</a></li>
					<li ><a  href="../login.jsp">退出</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="midle">
	<div  class="mindle_table">
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
    $(document).ready(function() {
        $.ajax({
            url : "/userinfoapplicant.do",//后台请求的数据，用的是PHP
            dataType : "json",//数据格式
            type : "get",//请求方式
            async : false,//是否异步请求
            success : function(data) {   //如果请求成功，返回数据。
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
                for(var i=0;i<data.length;i++){    //遍历data数组
                    var ls = data[i];
                    html +="<tr><td><a href=/worker/infos.jsp?Sid="+ls.Sid+">"+ls.Sid;
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