<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>系统注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/app.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/register.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        .container_1{
            margin:2% 18%;
        }</style>
</head>

<body>
<div class="header-nav">
    <div id="headerNav">
        <a class="fr" href="login.jsp" ><i class="fa fa-sign-out"></i>登录</a>
    </div>
</div>
<div class="header">
    <div class="banner">
        <img src="images/logo.png" alt=""/><span id="appname">企业差旅管理系统</span>
        <span id="current-term">
        </span>
    </div>
</div>
<div class="container">
    <div class="container_1">
        <h1>系统注册</h1>
        <div class="model1">
            <h2>Set up your account</h2>
        </div>
        <section class="card">
            <label class="nor" for="userName"><br />
                <span><span>*&nbsp;&nbsp;</span>姓名:</span><br />
                <input type="text" name="userName" placeholder="请输入您的姓名" />
            </label>
            <br />
            <label class="nor" for="userId"><br />
                <span><span>*&nbsp;&nbsp;</span>工号:</span><br />
                <input type="text" name="userId" placeholder="请输入您的工号" />
            </label>
            <br/>
            <label class="nor" for="Dname"><br />
                <span><span>*&nbsp;&nbsp;</span>部门:</span><br />
                <input type="text" name="Dname" placeholder="请输入您的部门" />
            </label>
            <br />
            <label class="nor" for="email"><br />
                <span><span>*&nbsp;&nbsp;</span>邮箱:</span><br />
                <input type="text" name="email" placeholder="you@example.com" />
            </label>
            <br />

            <br />

            <label class="nor" for="password"><br />
                <span><span>*&nbsp;&nbsp;</span>密码:</span><br />
                <input type="password" name="password" placeholder="请输入密码" />
                <p>&nbsp;&nbsp;至少8个字符且至少包括一个数字字符和一个小写字母</p>
            </label>

            <label class="nor" for="repassword"><br />
                <span><span>*&nbsp;&nbsp;</span>确认密码:</span><br />
                <input type="password" name="repassword" placeholder="再次输入您的密码" />
            </label>
            <br /><br />
            <label class="nor" for="verify"><br />
                <span><span>*&nbsp;&nbsp;</span>验证:</span><br />
                <input type="text" name="code" placeholder="请输入验证码" />
                <img id="img" src="${pageContext.request.contextPath}/getcode" style="text-align:center"/>
                <a href="#" onclick="changImage()">换一张</a>
            </label>
            <br />
            <button onclick="check()">注册</button>
        </section>

    </div>
</div>
<footer id="footer">
    <div class="copyright">
        ©️ 2019&nbsp;&nbsp;<i class="fa fa-mortar-board"></i></i>企业差旅管理系统
    </div>
</footer>

<script>
    function $(id){
        return document.getElementById(id);
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
        var userName=document.getElementsByName("userName")[0].value;
        var userId=document.getElementsByName("userId")[0].value;
        var Dname = document.getElementsByName("Dname")[0].value;
        var email=document.getElementsByName("email")[0].value;
        var password=document.getElementsByName("password")[0].value;
        var repassword=document.getElementsByName("repassword")[0].value;
        var code = document.getElementsByName("code")[0].value;
        if(userName==""||userId==""||password!=repassword||email.match("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")==null||password.match(/^(?=.*[0-9])(?=.*[a-z])[^]{8,15}$/)==null)
        {
            alert("请检查必填项是否符合要求！！");
            return false;
        }
        myxmlHttpRequest=getXmlHttpObject();
        if(myxmlHttpRequest){
            flag = 1;
            //第一个参数表示请求的方式  get
            //第二个参数指定url,对那个页面发出ajax请求】
            var url="/register";
            //第三个参数true表示使用异步机制
            // 打开请求
            myxmlHttpRequest.open("POST",url,true);
            myxmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            //指定回调函数
            //var data={"email":$("email").value,"password":$("password").value,"code":$("code").value};
            console.log(myxmlHttpRequest.method);
            myxmlHttpRequest.onreadystatechange=chuli;
            var data="Dname="+Dname+"&userName="+userName+"&userId="+userId+"&email="+email+"&password="+password+"&repassword="+repassword+"&code="+code;
            //真的发送请求，如果是get方法 填入null  如果是post请求则填入实际的数据
            myxmlHttpRequest.send(data);
        }
    }
    function changImage() {
        var src = document.getElementById("img").src;
        document.getElementById("img").src = changUrl(src);
    }
    function changUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0,29);
        if((url.indexOf("&")>=0)){
            url = url +"×tamp=" + timestamp;
        }else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
    function chuli(){
        //window.alert("处理函数被调用"+myxmlHttpRequest.readyState);
        if((myxmlHttpRequest.readyState==4) && (flag == 1)){
            //var info =myxmlHttpRequest.responseText;
            //取出值要根据返回值的格式而定，.text
            //window.alert("服务器返回了"+myxmlHttpRequest.responseText);
            var data =myxmlHttpRequest.responseText;
            console.log(data);
            var dataObj=JSON.parse(data);
            console.log(dataObj);
            if(dataObj.success==200){
                alert("注册成功");
                window.location.href="login.jsp";
                flag =0;
            }
            if(dataObj.success==201){
                alert("邮件未发送");
                flag =0;
            }
            if(dataObj.success==202){
                alert("用户已存在");
                flag =0;
            }
            if(dataObj.success==203){
                alert("验证码错误");
                flag =0;
            }
            if(dataObj.success==204){
                alert("密码不匹配");
                flag =0;
            }
        }
    }

</script>
</body>
</html>