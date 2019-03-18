<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isErrorPage="true" %>
<jsp:include page="/common/jsp/com.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${basePath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>401页面未找到!</title>
<!-- <link href="quantization/css/style.css" rel="stylesheet" type="text/css" /> -->
</head>
<body>
<div id="container">
	<div class="header">
    
    	<%-- <%@include file="/common/jsp/header.jsp" %> --%>
    </div>
    
    
  <table width="652" height="286" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right" valign="top" class="paddingtop22">

	<table width="86%" height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left" class="hong16">401页面未找到</td>
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
<div class="footer" id="footer">
 <%--  <jsp:include page="/common/jsp/footer.jsp"/> --%>
</div> 

</body>
<script src="${basePath}/js/jquery.js"></script>
</html>
