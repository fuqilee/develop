<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
   <title>500 系统内部错误！</title>
	<jsp:include page="/common/jsp/com.jsp" />
	<base href="${basePath }/">
	<jsp:include page="/common/jsp/head.jsp" />
</head>
<body>
<div id="container">
	<!-- 头部 -->
	<div class="header">
		<%@include file="/common/jsp/header.jsp"%>
	</div>
    
<table width="652" height="286" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right" valign="top" class="paddingtop22">

	<table width="86%" height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left" class="hong16">404页面未找到</td>
      </tr>
    </table>
	<table width="86%" height="30" border="0" cellpadding="0" cellspacing="0" class="margainTOP10">
      <tr>
        <td align="left" class="paddingtop22 ziti14 paddingright50">您访问的页面不存在。给您带来的不便，敬请谅解。如有疑问，请拨打客服电话。</td>
      </tr>
    </table>
    <table width="86%" height="30" border="0" cellpadding="0" cellspacing="0" class="margainTOP10">
      <tr>
        <td align="left" class="paddingtop22 ziti14 paddingright50"><a href="${pageContext.request.contextPath}/">返回首页</a>
        　　<a href="javascript:void();" onclick="history.go(-1);">返回上一页</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
	<!-- 尾部 -->
	<div class="" id="footer">
		<jsp:include page="/common/jsp/footer.jsp" />
	</div>
</body>
</html>
