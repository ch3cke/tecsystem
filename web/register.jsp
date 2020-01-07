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
           <form action="${pageContext.request.contextPath}/register.do" method="POST" onsubmit="return check()">
                <label class="nor" for="userName"><br />
                    <span><span>*&nbsp;&nbsp;</span>姓名:</span><br />
                    <input type="text" name="userName" placeholder="请输入您的姓名" />
                </label>
                <br />
                <label class="nor" for="userId"><br />
                    <span><span>*&nbsp;&nbsp;</span>工号:</span><br />
                    <input type="text" name="userId" placeholder="请输入您的工号" />
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
                     <img id="img" src="${pageContext.request.contextPath}/getcode.do" style="text-align:center"/>
                    <a href="#" onclick="changImage()">换一张</a>
                </label>
                <br />
                <label class="nor">
                <input class="submit" type="submit" value="注册" />
                </label>
            </form>
        </section>

    </div>
    </div>
    <footer id="footer">
        <div class="copyright">
            ©️ 2019&nbsp;&nbsp;<i class="fa fa-mortar-board"></i></i>企业差旅管理系统
        </div>
    </footer>

    <script>
        function check(){
            var userName=document.getElementsByName("userName")[0].value;
            var userId=document.getElementsByName("userId")[0].value;
            var email=document.getElementsByName("email")[0].value;
            var password=document.getElementsByName("password")[0].value;
            var repassword=document.getElementsByName("repassword")[0].value;
            if(userName==""||userId==""||identity==""||password!=repassword||email.match("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")==null||password.match(/^(?=.*[0-9])(?=.*[a-z])[^]{8,15}$/)==null)
            	{
            	alert("请检查必填项是否符合要求！！");
            	console.log("hhh");
            	return false;	
            	}
        }
        function changImage() {
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
    </script>
</body>
</html>