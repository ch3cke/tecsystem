<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="UTF-8">
	<title>报表申请页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/normalize.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/featherlight.min.css">
	<link href="../css/css.css" rel='stylesheet' type='text/css'>
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-2.2.3.min.js"></script>
	<script src="../js/jquery-latest.min.js"></script>
	<script src="../js/bootstrap-table.min.js"></script>
	 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
  
  .midle{
margin:3% 25%;
background-color:rgb(255,240,245,0);
width:60%;
height:500px;
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
					<li ><a  href="logout">退出</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="midle">
<div id="test" class="mindle_table">

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
                url : "/getschedule",//后台请求的数据，用的是PHP
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
                        "                <th>预算</th> <th>状态</th>\n" +
                        "            </tr>\n" +
                        "            </thead>\n" +
                        "            <tbody>";
                    for(var i=0;i<data.length;i++){    //遍历data数组
                        var ls = data[i];
                        if(ls.index == 1){
                            html +="<tr><td><a href=/worker/finance1.jsp?sid="+ls.Aid+">"+ls.Aid;
                            html +="</td><td>"+ls.Aplace;
                            html +="</td><td>"+ls.Amoney+"</td><td>";
                            html = html+"已通过</td></tr>";
                        }else if(ls.index==="-1") {
                            html +="<tr><td>"+ls.Aid;
                            html +="</td><td>"+ls.Aplace;
                            html +="</td><td>"+ls.Amoney+"</td><td>";
                            html = html+"被驳回</td></tr>";
                        }else {
                            html +="<tr><td>"+ls.Aid;
                            html +="</td><td>"+ls.Aplace;
                            html +="</td><td>"+ls.Amoney+"</td><td>";
                            html = html+"未审核</td></tr>";
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