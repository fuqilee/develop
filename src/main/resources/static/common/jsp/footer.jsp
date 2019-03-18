<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${basePath}/common/css/header_foot.css"/>
<script type="text/javascript">
	$(function(){
	  	var today = new Date();//获得当前日期
	    var year = today.getFullYear();//获得年份
		$('#copyright').html('&copy; 2010-'+year+' 我的公司ICP备10041486号-1');
	});
</script>
<div class="footer_fs" id="copyright">
</div>