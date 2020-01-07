<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>重置密码</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/app.css">
</head>
<body>
<div class="header-nav">
	<div id="headerNav">
	</div>
</div>
<div class="header">
	<div class="banner"style="margin-top:20px">
		<img src="./image/logo.png" alt=""/>
		<span id="appname">
                    企业差旅管理系统
                </span>
		<span id="current-term"></span>
	</div>
</div>
<div id="frame" style="height: 268px;margin-top:;">
	<div class="reset">
		<div class="holder">
			<div class="with-line">找回密码</div>
			<form class="reset-form" action="/reset.do" method="post">
				<input type="text" name="username" class="clear" placeholder="请输入用户名">
				<a class="button1" href="reset.jsp">获取验证码</a>
			</form>
		</div>
	</div>
</div>
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