<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style2.css">
    <link rel="stylesheet" href="../css/featherlight.min.css">
    <link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>

    <script src="../js/jquery-2.2.3.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        //var $jq=jQuery.noConflict();
        $(function(){
            $(".edit-label").click(function(){
                $(this).next(".holder").animate({height: 'toggle', opacity: 'toggle'}, "slow");
            });
        })
    </script>
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
                <li ><a  href="/logout">退出</a></li>

            </ul>
        </nav>
    </div>
</header>
<div id="page" class="page-min-width page-with-header" style="display: block;">
    <div class="wrapper settings-page">
        <div id="user_settings">
            <h1>个人中心</h1>
            <div class="setting-units">
                <div id="_set_profile" class="setting-unit">
                    <div class="title">个人资料
                        <div class="preview" id="id" style="opacity: 1;">###</div>
                    </div>
                    <a class="edit-label">编辑</a>
                    <div class="holder">
                        <div class="inner">
                            <table class="list">
                                <tbody>
                                <tr>
                                    <td class="name">姓名:</td>
                                    <td>
                                        <%--<input value="#" name="name" id="username" class="clear-input" readonly="readonly"><span>（姓名不可修改）</span>--%>
                                        <div id = "name"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name">性别:</td>
                                    <td class="sex">
                                        <label>
                                            <input type="radio" name="sex" value="1"checked="checked">男
                                        </label>
                                        <label>
                                            <input type="radio" name="sex" value="2">女
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name">年龄:</td>
                                    <td>
                                        <input value="#" name="age" id = "age" class="clear-input">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <a onclick="changes('info')" class="submit-btn btn rbtn">
                                            <strong>保存</strong>
                                            <span></span>
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="_set_avatar" class="setting-unit">
                    <div class="title">工号
                        <div id="userId" class="preview" style="opacity: 1;">
                            ############
                        </div>
                    </div>
                </div>
                <div id="_set_medal" class="setting-unit">
                    <div class="title">奖牌数
                        <div class="preview" id="Medals" style="opacity: 1;">
                            ############
                        </div>
                    </div>
                </div>
                <div id="_set_dno" class="setting-unit">
                    <div class="title">部门编号
                        <div class="preview" id = "Did" style="opacity: 1;">
                            #########
                        </div>

                    </div>
                </div>
                <div id="_set_dname" class="setting-unit">
                    <div class="title">部门名称
                        <div class="preview" id="Dname" style="opacity: 1;">
                            #########
                        </div>
                    </div>
                    <div id="_set_email" class="setting-unit">
                        <div class="title">邮箱
                            <div class="preview" id="Mail" style="opacity: 1;">
                                #########
                            </div>
                        </div>
                        <a class="edit-label">编辑</a>
                        <div class="holder">
                            <div class="inner">
                                <form id = "em" action="#" method="post">
                                    <table class="list">
                                        <tbody>
                                        <tr>
                                            <td class="name">新邮箱:</td>
                                            <td>
                                                <input value="#" id="newmail" name="mailbox" class="clear-input">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a href="#" onclick="changes('mail')" class="submit-btn btn rbtn">
                                                    <strong>保存</strong>
                                                    <span></span>
                                                </a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="_set_password" class="setting-unit">
                        <div class="title">密码
                            <div class="preview" style="opacity: 1;">
                                *******
                            </div>
                        </div>
                        <a class="edit-label">编辑</a>
                        <div class="holder">
                            <div class="inner">
                                <form id="passwd" action="#" method="post">
                                    <table class="list">
                                        <tbody>
                                        <tr>
                                            <td class="name">新密码:</td>
                                            <td>
                                                <input type="password"  name="newpassword" class="clear-input">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a href="#" onclick="changes('passwd')" class="submit-btn btn rbtn">
                                                    <strong>保存</strong>
                                                    <span></span>
                                                </a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url:"/mainfo",
            dataType:"JSON",
            type : "get",//请求方式
            async : false,//是否异步请求
            success : function(data) {   //如果请求成功，返回数据。
                console.log(data);
                document.getElementById("id").innerText = data.name;
                document.getElementById("name").innerText = data.name;
                document.getElementById("age").value = data.age;
                document.getElementById("userId").innerText = data.id;
                document.getElementById("Medals").innerText = data.Medals;
                document.getElementById("Did").innerText = data.Did;
                document.getElementById("Dname").innerText= data.Dname;
                document.getElementById("Mail").innerText = data.Mail;
                if(data.sex=="女"){
                    document.getElementsByName("sex")[1].checked = true;
                }
            }
        })
    })

    function checkMail(mail) {
        var email=mail
        var emreg=/^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/;
        if(emreg.test(email.value)===false)
            return false;
        else
            return true;
    }

    function changes(method) {
        console.log(method);
        var sex;
        var rsid = document.getElementsByName("sex");
        if(rsid[0].checked===true){
            sex = "男";
        }else {
            sex = "女";
        }
        var age = document.getElementById("age").value;
        var mail = document.getElementById("newmail").value;
        var password = $('input:password[name="newpassword"]').val();
        var datas = {"sex":sex,"age":age,"mail":mail,"password":password,"method":method};
        $.ajax({
                url:"/resetman",
                dataType: "JSON",
                type: "post",
                async:false,
                data:datas,
                success:function (data) {
                    console.log(data);
                    if(data.success===200){
                        document.getElementById("Mail").value=mail;
                        alert("修改成功");
                        window.location.reload();
                    }
                }
            })
    }
</script>
</body>
</html>
