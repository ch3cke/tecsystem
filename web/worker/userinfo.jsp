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
        <h1 class="logo"><a href="#">主页</a></h1>
        <nav>
            <ul id="navigation">
                <li><a href="#home">出差申请</a></li>
                <li><a href="#about">报销申请</a></li>
                <li><a href="#services">报表查询</a></li>
                <li><a class="nav-cta" href="#">个人中心</a></li>
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
                            <form id="info" action="#" method="post">
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
                                            <input value="#" name="age" class="clear-input">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <a onclick="document.getElementById('info').submit()" class="submit-btn btn rbtn">
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
                <div id="_set_avatar" class="setting-unit">
                    <div class="title">工号
                        <div id="userId" class="preview" style="opacity: 1;">
                            ############
                        </div>
                    </div>
                </div>
                <div id="_set_medal" class="setting-unit">
                    <div class="title">奖牌数
                        <div class="preview" style="opacity: 1;">
                            ############
                        </div>
                    </div>
                </div>
                <div id="_set_dno" class="setting-unit">
                    <div class="title">部门编号
                        <div class="preview" style="opacity: 1;">
                            #########
                        </div>

                    </div>
                </div>
                <div id="_set_dname" class="setting-unit">
                    <div class="title">部门名称
                        <div class="preview" style="opacity: 1;">
                            #########
                        </div>
                    </div>
                    <div id="_set_email" class="setting-unit">
                        <div class="title">邮箱
                            <div class="preview" style="opacity: 1;">
                                #########
                            </div>
                        </div>
                        <a class="edit-label">编辑</a>
                        <div class="holder">
                            <div class="inner">
                                <form id = "em"action="#" method="post">
                                    <table class="list">
                                        <tbody>
                                        <tr>
                                            <td class="name">新邮箱:</td>
                                            <td>
                                                <input value="#" name="mailbox" class="clear-input">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a href="#" onclick="document.getElementById('em').submit();" class="submit-btn btn rbtn">
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
                                            <td class="name">旧密码:</td>
                                            <td>
                                                <input type="password"  name="password[old]" class="clear-input">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name">新密码:</td>
                                            <td>
                                                <input type="password"  name="password[new]" class="clear-input">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a href="#" onclick="document.getElementById('passwd').submit();" class="submit-btn btn rbtn">
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
            url:"/mainfo.do",
            dataType:"JSON",
            type : "get",//请求方式
            async : false,//是否异步请求
            success : function(data) {   //如果请求成功，返回数据。
                console.log(data);

            }
        })
    })
</script>
</body>
</html>
