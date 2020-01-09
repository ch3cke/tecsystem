<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>申请表页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/normalize.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/featherlight.min.css"> 
	<link href="../css/css.css" rel='stylesheet' type='text/css'>
	<script src="..js/jquery-2.2.3.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-latest.min.js"></script>
	
<style>
  /* Make the image fully responsive */
  html, body {
	font-size: 100%;
	//background: url(../images/img1.png) no-repeat 0px 0px;
	background-size: cover;
}
 
#top{
background-color:rgb(255,240,245,0);

}
 .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  .midle{

margin:3% 25%;
background-color:rgb(255,240,245,0);
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
	width:10%;
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
                <a href="audit.jsp">报表审核</a>
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
	<!-- 职工申请表的填写 -->
<div class="midle">
<div  class="mindle_table">
<form action=  "<%=request.getContextPath() %>/add" onsubmit="return check()">
<label for="name" style="margin:15px 0">职工编号：</label>
<input class="list1" type="text" name="userId"   value="">
<label for="name" style="margin:15px 0">住宿说明：</label>
          <textarea name="Areason1"  rows="3"></textarea><br/>
<label for="name" style="margin:15px 0">部门名称：</label>
<input class="list1" type="text" name="Dname"   value="">
<label for="name" style="margin:15px 0">车费说明：</label>
      <textarea name="Areason2"  rows="3"></textarea><br/>
<label for="name" style="margin:15px 0">出差地点：</label>
 <input class="list1" type="text" name="Aplace"   value="">            
<label for="name" style="margin:15px 0">其他费用：</label>
       <textarea name="Areason3" rows="3"></textarea><br/>
<label for="name" style="margin:15px 0">出差开始时间：</label>
 <input class="list" type="date"  name="Atime1"   value="">  
 <label for="name" style="margin:15px 0">出差结束时间：</label>
 <input class="list" type="date"  name="Atime2"   value=""><br/>            
<label for="name" style="margin:15px 0">出差预算：</label>
 <input class="list1" type="text" name="Amoney"   value="">                       
<label for="name" style="margin:15px 0">紧急原因：</label>
       <textarea name="Urgent"  rows="3"></textarea><br/>
<input class="sub"  type="submit" value="申请">
</form>
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
var myxmlHttpRequest;
function check(){
	 myxmlHttpRequest=getXmlHttpObject();
	if(myxmlHttpRequest){
		//第一个参数表示请求的方式  get
		//第二个参数指定url,对那个页面发出ajax请求】
		var url="#";
        //第三个参数true表示使用异步机制
        // 打开请求
		myxmlHttpRequest.open("get",url,true);
		//指定回调函数
		myxmlHttpRequest.onreadystatechange=chuli;
		//真的发送请求，如果是get方法 填入null  如果是post请求则填入实际的数据
         myxmlHttpRequest.send(null);
         			}

}
function $(id){
	return document.getElementById(id);
}
function chuli(){
	//window.alert("处理函数被调用"+myxmlHttpRequest.readyState);
	if(myxmlHttpRequest.readyState=4){
		//取出值要根据返回值的格式而定，.text
		//window.alert("服务器返回了"+myxmlHttpRequest.responseText);
		var data =myxmlHttpRequest.responseText;
		var dataobj=data.parseJSON();
		if(dataObj.success==true){
			alert("员工申请表填写成功");
		}
		else
			alert("员工申请表填写失败");
		
	}
	else
		alert("员工申请表填写失败");
}
</script>
</body>
</html>