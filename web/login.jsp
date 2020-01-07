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
            <form action="/login.do" method="POST">
                <%--@declare id="id"--%><%--@declare id="password"--%><%--@declare id="verify"--%>
                    <label for="id">
                        <i class="fa fa-user"></i>
                        <input type="text" name="email" class="user" placeholder="请输入您的工号或邮箱" />
                    </label>
                    <br /><br />
                <label for="password">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="password" class="password" placeholder="请输入您的密码" />
                </label>
                    <br /><br />
                <label class="nor" for="verify"style="display:block;margin-left:2%"><br />
                    <i class="fa fa-user"></i>
                    <input type="text" name="code" class="code" placeholder="验证码"  style="width:125px"/>
                    <img id="img" src="${pageContext.request.contextPath}/getcode.do" style="text-align:center"/>
                    <a href="#" onclick="chaneImage()">换一张</a>
                </label>
                    <br />
                     <label>
                      <a href="getcode.jsp">忘了密码？</a>
               
                </label>
                 <br />
                <label>
                        <input class="submit" type="submit" value="登录"/>
                </label>
            </form>
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
    </script>
</html>