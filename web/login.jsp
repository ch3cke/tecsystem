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
<div class="login-inner"style="overflow: hidden">
    <img src="images/background.jpg" class="background-img">
    <div class="header-nav">
        <div id="headerNav"></div>
    </div>
    <div class="header">
        <div class="banner">
            <img src="images/logo.png" alt="" style="vertical-align: bottom" />
            <div class="description">
                <div class="description-title">思拓易公司差旅报销系统</div>
                <div class="description-content"></div>
            </div>
            <span id="current-term"></span>
        </div>
    </div>
    <div class="card" style="margin-top:3%;opicity:1;"> <%--@declare id="id"--%><%--@declare id="password"--%><%--@declare id="verify"--%>
        <div class="form" style="text-align: center">
            <div style="font-size:20px;color:#337ab7;padding:62px 0 30px;">登 录</div>
            <div style="font-size: 18px; float: top"></div>
            <label for="id"> <i class="fa fa-user"></i> <input
                    type="text" name="email" id="email" class="user"
                    placeholder="请输入您的工号或邮箱" />
            </label> <br /> <br /> <label for="password"> <i class="fa fa-lock"></i>
            <input type="password" name="password" id="password"
                   class="password" placeholder="请输入您的密码" />
        </label> <br /> <br /> <label class="nor" for="verify"
                                      style="display: block; margin-left: 2%"><br /> <i
                class="fa fa-user"></i> <input type="text" name="code" class="code"
                                               id="code" placeholder="验证码" style="width: 125px" /> <img id="img"
                                                                                                        src="${pageContext.request.contextPath}/getcode"
                                                                                                        style="text-align: center" /> <a href="#" onclick="chaneImage()">换一张</a>
        </label> <br /> <label>
            <button class="submit" id="login" onclick="check()"
                    style="margin-bottom: 3px">
                <span>登录</span>
            </button>
        </label>
            <div style="margin-top:5px;">
                <a href="getcode.jsp"
                   style="color: #337ab7; margin-bottom: 3px; font-size: 12px;display:block;margin-bottom:3px;">忘了密码？</a>
                <a class="fr" href="register.jsp"style="color: #337ab7; margin: 0 76px 3px 0; font-size: 12px"><span style="color:black">还没有注册？立即去</span> 注册>></a>
            </div>
        </div>
    </div>

    <div id="scene"
         style="transform: translate3d(0px, 0px, 0px) rotate(0.0001deg); transform-style: preserve-3d; backface-visibility: hidden; pointer-events: none;">
        <div data-depth="0.2"
             style="transform: translate3d(-8.9px, 7.5px, 0px); transform-style: preserve-3d; backface-visibility: hidden; position: absolute; display: block; left: 0px; top: 0px;">
            <img src="images/move1.png">
        </div>
        <div data-depth="0.4"
             style="transform: translate3d(-17.8px, 15.1px, 0px); transform-style: preserve-3d; backface-visibility: hidden; position: absolute; display: block; left: 0px; top: 0px;">
            <img src="images/move2.png">
        </div>
        <div data-depth="0.6"
             style="transform: translate3d(-26.8px, 22.6px, 0px); transform-style: preserve-3d; backface-visibility: hidden; position: absolute; display: block; left: 0px; top: 0px;">
        </div>
    </div>
</div>
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
            var url="/login";
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
                window.location.href="/"+dataObj.statue+"/home.html";
                flag =0;
            }else if(dataObj.success==201){
                alert("用户名或密码错误");
                location.reload();
            }
            else if(dataObj.success==202){
                alert("验证码错误");
                flag =0;
                location.reload();
            }
             else if(dataObj.success==203){
                 alert("用户已经登录");
                window.location.href="/"+dataObj.statue+"/home.html";
                flag =0;
            }
            else if(dataObj.success==204){
                alert("密码不匹配");
                flag =0;
                location.reload();
            }else if(dataObj.success==205){
                alert("用户不存在");
                location.reload();
                flag =0;
            }

        }
    }
</script>
</html>