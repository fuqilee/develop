<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%--<link rel="stylesheet" href="${basePath}/common/css/header_foot.css"/>
<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap.css"/>
<script type="text/javascript" src="${basePath}/common/js/jquery/jquery-1.10.2.min.js"></script>
<script src="${basePath}/common/bootstrap/js/bootstrap.js"></script> --%>
<style>
	<!--
	#headerjsp > .firstHead{
	 	height:100px;
	}
	.headbg >  li.actives > a{
		background-color: #e18a19;
	    color: #E3E9EF;
	}
	 .headbg{
		background-color: rgb(62, 127, 195);
		clear:both;
	}
	.headbg > li >a:hover {
	    background-color: #e18a19;
	    color: #E3E9EF;
	}
	.headbg > li > a:focus {
	    background-color: #e18a19;
	    color: #E3E9EF;
	}
	.headbg > li > a {
	    color: white;
	    text-decoration: none;
	}
	h1{
		margin-top: 16px;
	    margin-left: 16px;
	    font-size: 16px;
	    font-weight: BOLD;
	}
	
	-->
</style>
	<div id="headerjsp">
		<!--头部  -->
		<div class="head_logo fl firstHead" >
			<img width="100%" src="${basePath}/common/image/logo.png">
		</div>
		<!--头部 -->
		<!--导航  -->
		<div>
			<ul class="nav nav-pills headbg">
			  <li class="actives" style="margin-left:100px;"><a href="##">首页</a></li>
			  <li><a href="${basePath}/baseInfo/toFindBaseInfo?id=50">sql管理</a></li>
			  <li><a href="${basePath}/baseInfo/toBaseTableConfig">表信息列表</a></li>
			  <li><a href="${basePath}/bootInfo/tobootinfo">数据列表</a></li>
			  <li><a href="${basePath}/bootInfo/tobootinfoBase">基本操作</a></li>
			  <li><a href="${basePath}/bootInfo/toboottable">表信息</a></li>
			  <li><a href="${basePath}/bootInfo/tobootcolumn">表属性信息</a></li>
			  <%-- <li><a href="${basePath}/bootInfo/tobootmodaltype">模板配置</a></li> --%>
			  <li><a href="${basePath}/bootInfo/tosql">sql管理</a></li>
			  <li><a href="${basePath}/bootInfo/tobootuser">用户管理</a></li>
			  <li><a href="${basePath}/bootInfo/tobootrole">角色管理</a></li>
			  <li><a href="${basePath}/bootInfo/tobootprivilege">功能管理</a></li>
			  <li><a href="${basePath}/logout">退出</a></li>
			</ul>
		</div>
		<!--导航  -->
 </div>
<script>
	$(function () {
		$(".nav > li ").click(function(){
			$(".nav > li").removeClass('actives');
			$(this).addClass('actives');
		});
		
		var menus=$(".nav > li");
		for(var i=0;i<menus.length;i++){
			var href=menus.eq(i).find('a').attr('href');
			var name=menus.eq(i).find('a').html().trim();
			var _currentUrl=window.location.href.substr(basePath.length+1);
			if(href.indexOf(_currentUrl)>0){
				$(".nav > li").removeClass('actives');
				menus.eq(i).addClass('actives');
			}
		}
	});
	function logout() {
	}
</script>
