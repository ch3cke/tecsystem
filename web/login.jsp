<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        用户登录
    </title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/login.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/app.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="header-nav">
    <div id="headerNav">
        <a class="fr" href="register.jsp" >
            <i class="fa fa-sign-out"></i>
            注册
        </a>
    </div>
</div>
<div class="header">
    <div class="banner"style="margin-top:20px">
        <img src="images/logo.png" alt=""/>
        <span id="appname">
                    企业差旅管理系统
                </span>
        <span id="current-term"></span>
    </div>
</div>
<section class="card"style="margin-top:3%">
    <%--@declare id="id"--%><%--@declare id="password"--%><%--@declare id="verify"--%>
    <label for="id">
        <i class="fa fa-user"></i>
        <input type="text" name="email" id="email" class="user" placeholder="请输入您的工号或邮箱" />
    </label>
    <br /><br />
    <label for="password">
        <i class="fa fa-lock"></i>
        <input type="password" name="password" id="password" class="password" placeholder="请输入您的密码" />
    </label>
    <br /><br />
    <label class="nor" for="verify"style="display:block;margin-left:2%"><br />
        <i class="fa fa-user"></i>
        <input type="text" name="code" class="code" id="code" placeholder="验证码"  style="width:125px"/>
        <img id="img" src="${pageContext.request.contextPath}/getcode.do" style="text-align:center"/>
        <a href="#" onclick="chaneImage()">换一张</a>
    </label>
    <br />
    <label>
        <a href="getcode.jsp">忘了密码？</a>

    </label>
    <br />
    <label>
        <button class="submit" id="login" onclick="check()" value="登录"/>
    </label>
</section>

<footer id="footer">
    <div class="copyright">
        ©️ 2019<i class="fa fa-mortar-board"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业差旅管理系统
    </div>
</footer>
</body>
<script type="text/javascript">
    $(function () {
    });
    function chaneImage() {
        var src = document.getElementById("img").src;
        document.getElementById("img").src = changUrl(src);
    }
    function changUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0,32);
        if((url.indexOf("&")>=0)){
            url = url +"×tamp=" + timestamp;
        }else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
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
    var flag = 0;
    function check(){
        myxmlHttpRequest=getXmlHttpObject();
        if(myxmlHttpRequest){
            flag = 1;
            //第一个参数表示请求的方式  get
            //第二个参数指定url,对那个页面发出ajax请求】
            var url="/login.do";
            //第三个参数true表示使用异步机制
            // 打开请求
            myxmlHttpRequest.open("POST",url,true);
            myxmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            //指定回调函数
            //var data={"email":$("email").value,"password":$("password").value,"code":$("code").value};
            console.log(myxmlHttpRequest.method);
            myxmlHttpRequest.onreadystatechange=chuli;
            var data="email="+$("email").value+"&password="+$("password").value+"&code="+$("code").value;
            //真的发送请求，如果是get方法 填入null  如果是post请求则填入实际的数据
            myxmlHttpRequest.send(data);
        }


    }
    function $(id){
        return document.getElementById(id);
    }
    function chuli(){
        //window.alert("处理函数被调用"+myxmlHttpRequest.readyState);
        if((myxmlHttpRequest.readyState==4) && (flag == 1)){
            //var info =myxmlHttpRequest.responseText;
            //取出值要根据返回值的格式而定，.text
            //window.alert("服务器返回了"+myxmlHttpRequest.responseText);
            var data =myxmlHttpRequest.responseText;
            var dataObj=JSON.parse(data);
            console.log(dataObj);
            if(dataObj.success==200){
                alert("登录成功");
                window.location.href="/worker/home.jsp";
                flag =0;
            }
            if(dataObj.success==202){
                alert("验证码错误");
                flag =0;
            }
            if(dataObj.success==203){
                window.location.href="/worker/home.jsp";
                flag =0;
            }
            if(dataObj.success==204){
                alert("密码不匹配");
                flag =0;
            }

        }
    }
    function upload() {
        var datas={"email":$("email").value,"password":$("password").value,"code":$("code").value};
        $.ajax({
            url : "/login.do",//后台请求的数据，用的是PHP
            dataType : "json",//数据格式
            type : "post",//请求方式
            data:   datas,
            async : false,//是否异步请求
            success : function(data) {
                console.log(data);
            }
        })
    }
</script>
</html>