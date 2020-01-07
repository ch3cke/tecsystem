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
	
</head>
<body>
 <header id="top">
   <div class="wrapper">
	<h1 class="logo"><a href="#">主页</a></h1>
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
  <div id="page" class="page-min-width page-with-header" style="display: block;">
   <div class="wrapper settings-page">
    <div id="user_settings">
	 <h1>个人中心</h1>
	  <div class="setting-units">
	   <div id="_set_profile" class="setting-unit">
		<div class="title">姓名
		 <div class="preview" style="opacity: 1;">${dataobj.getname }</div>
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
				 <input value=" " name="username" class="clear-input">
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
				 <a href="#" onclick="submit()" class="submit-btn btn rbtn">
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
     <div id="_set_avatar" class="setting-unit user-avatar">
	   <div class="title">工号
		  <div class="preview" style="opacity: 1;">
			${dataobj.getdid }
		  </div>
	   </div>
	 </div>
	 <div id="_set_dno" class="setting-unit">
	   <div class="title">部门编号
		 <div class="preview" style="opacity: 1;">
			${dataobj.getdname }
		 </div>

	   </div>
	   <a class="edit-label">编辑</a>
	   <div class="holder">
	   <div class="inner">
		 <form id="dn" action="#" method="post">
		   <table class="list">
		     <tbody>
			   <tr>
			    <td class="name">编号:</td>
			    <td>
				 <input value="#" name="Did" class="clear-input">
			    </td>
			   </tr>
			   <tr>
				 <td></td>
				 <td>
				   <a href="#" onclick="submit();" class="submit-btn btn rbtn">
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
	<div id="_set_dname" class="setting-unit">
	  <div class="title">部门名称
		<div class="preview" style="opacity: 1;">
		   ${dataobj.getdname }
		</div>
	  </div>
	  <a class="edit-label">编辑</a>
	  <div class="holder">
	    <div class="inner">
		  <form id="dna" action="#" method="post">
		    <table class="list">
			  <tbody>
			    <tr>
				  <td class="name">名称:</td>
 	      		    <td>
					  <input value="#" name="dname" class="clear-input">
					</td>
				</tr>
				<tr>
				  <td></td>
				  <td>
				    <a href="#" onclick="submit()" class="submit-btn btn rbtn">
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
	<div id="_set_email" class="setting-unit">
      <div class="title">邮箱
	    <div class="preview" style="opacity: 1;">
			${dataobj.getmailbox }
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
				    <a href="#" onclick="submit();" class="submit-btn btn rbtn">
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
					<input type="password"  name="password" class="clear-input">
				  </td>
				</tr>
				<tr>
				  <td class="name">新密码:</td>
				  <td>
					<input type="password"  name="repassword" class="clear-input">
				  </td>
				</tr>
				<tr>
				  <td></td>
					<td>
					  <a href="#" onclick="submit();" class="submit-btn btn rbtn">
						<strong>保存</strong>
						<span></span>
					  </a>
					</td>
				  </tr>
				</tbody>
			  </table>
			</form>
		  </div>
		<v>
	  </div>
	</div>
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
window.onload =function(){
	 myxmlHttpRequest=getXmlHttpObject();
	if(myxmlHttpRequest){
		//第一个参数表示请求的方式  get
		//第二个参数指定url,对那个页面发出ajax请求
		var url="#"+$("").value;
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
		var dataObj =data.parseJSON();
	   
	   
		
	}
	
}
</script>
	<script>
		//var $jq=jQuery.noConflict();
		 $(function(){
			$(".edit-label").click(function(){
				$(this).next(".holder").animate({height: 'toggle', opacity: 'toggle'}, "slow");
			});
			})
		</script>
	</body>
</html>
