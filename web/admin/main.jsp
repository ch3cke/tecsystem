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
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="js/featherlight.min.js"></script> 
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
				</ul>
			</nav>
		</div>
	</header>

    <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_departmentname">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_statu">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
        <table id="tb_departments"></table>
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
</body>
</html>