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
	<link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
	<script src="../js/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$("#nav-cta").click(function(){
			$("#navigation_b").toggle(1000);
		});
	});
</script>
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
				</ul>
			</nav>
		</div>
	</header>
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
	      <img src="../images/img_fjords_wide.jpg">
	    </div>
	    <div class="carousel-item">
	      <img src="../images/img_nature_wide.jpg">
	    </div>
	    <div class="carousel-item">
	      <img src="../images/img_mountains_wide.jpg">
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
</body>
</html>