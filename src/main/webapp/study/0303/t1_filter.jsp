<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<jsp:include page="/include/certification.jsp" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t1_filter.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    function fCheck(flag) {
    	if(flag == 'NO') myform.action = "${ctp}/j0303/T1_filterNO";
    	else myform.action = "${ctp}/j0303/T1_filterOK";
    	
    	myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>Filter한글처리 연습</h2>
  <form name="myform" method="post">
    <div><input type="text" name="content" value="간단한 소개입니다." class="form-control" autofocus /></div>
    <div><textarea rows="5" name="introduce" class="form-control">자기소개란 입니다.</textarea></div>
    <div class="mt-3">
      <input type="button" value="필터NO" onclick="fCheck('NO')" class="btn btn-success" />
      <input type="button" value="필터OK" onclick="fCheck('OK')" class="btn btn-warning" />
    </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>