<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>报表审核页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/normalize.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/featherlight.min.css">
	<script type="text/javascript" src="../js/FileUpload.js" ></script>
	<link href="../css/css.css" rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="../js/jquery-2.2.3.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="../js/jquery-latest.min.js"></script>
	<script type="text/javascript" src="..js/featherlight.min.js"></script> 
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <script src="../js/bootstrap-table.min.js"></script>
    <script src="../js/bootstrap-table-zh-CN.min.js"></script>
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
    html, body {
	font-size: 100%;
	// background: url(../images/img1.png) no-repeat 0px 0px;
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
.btn{
	text-shadow: none;
	background: #F0F8FF;
	box-shadow: none;
	border: 1px solid #ec414d;
	display: inline-block;
	line-height: 1;
	border-radius: 2px;
	font-size: 14px;
	padding: 0 12px;
	height: 28px;
	line-height: 28px;
	cursor: pointer;
	text-decoration: none;
	border: 1px solid #ededed;
	white-space: nowrap;
	user-select:none;
	text-align: center;
	box-shadow: 0 0 0 transparent;
}
.one a:link{
   color:black;
  
	}
.one a:visited{
   color:red;
  
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
                <a href="audit.jsp">报表审核</a>
            </li>
                     <li>  
                <a href="hischel.jsp">报表统计</a>
            </li>
                    <li>  
                <a href="hischel1.jsp">报表查询</a>
            </li>
					<li><a class="nav-cta" href="userinfo.jsp" >个人中心</a></li>
					<li ><a  href="../login.jsp">退出</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="midle">
	<div  class="mindle_table">
<table class="table">

	<thead>
		<tr>
<th>申请编号</th>
<th>申请人姓名</th>
<th>申请人部门</th>
<th>车费原因</th>
<th>住宿费原因</th>
<th>其他费用原因</th>
<th>审核材料</th>
<th>审核</th>
</tr>
	</thead>
<tbody>
		  <c:forEach items="${sapplicants}" var="sapplicant">
	   <tr>
	  
	    
	  <td>${sapplicant.getAid() }</td>
	  <td>${sapplicant.getName }</td>
	  <td>${sapplicant.getDname}</td>
	  <td>${sapplicant.getAreason1 }</td>
	  <td>${sapplicant.getAreason2}</td>
	  <td>${sapplicant.getAreason3 }</td>

	<td><img id="img" src="${pageContext.request.contextPath}/getfile" style="text-align:center"/>
	</td>
	  <td ><a id="id1" class="btn" href="#" onclick="change()">审核</a></td>
	  
	  </tr>
	  </c:forEach>
	</tbody>
	
</table>
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
function $(id){
	return document.getElementById(id);
}
function chuli(){
	//window.alert("处理函数被调用"+myxmlHttpRequest.readyState);
	if(myxmlHttpRequest.readyState=4){
		//取出值要根据返回值的格式而定，.text
		//window.alert("服务器返回了"+myxmlHttpRequest.responseText);
		var data =myxmlHttpRequest.responseText;
		var sapplicants =data.parseJSON();
		
	}
}
function change(){
	alert('您通过了他的申请');
	 var div1 = document.getElementById('id1');
     div1.style.color="red";
     div1.innerHTML="同意";
     myxmlHttpRequest=getXmlHttpObject();
 	if(myxmlHttpRequest){
 		//第一个参数表示请求的方式  get
 		//第二个参数指定url,对那个页面发出ajax请求
 		var url="#"+$("#").value;
         //第三个参数true表示使用异步机制
         // 打开请求
 		myxmlHttpRequest.open("get",url,true);
 		//指定回调函数
 		myxmlHttpRequest.onreadystatechange=chuli;
 		//真的发送请求，如果是get方法 填入null  如果是post请求则填入实际的数据
          myxmlHttpRequest.send(null);
          			}    
}
</script>
</body>
</html>