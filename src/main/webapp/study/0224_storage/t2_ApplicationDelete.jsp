<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t2_ApplicationDelete.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict'
    
    function applicationDelete() {
    	let applicationSw = document.getElementById("applicationSw").value;
    	
    	if(applicationSw == "") {
    		alert("삭제할 값을 선택하세요");
    		return false;
    	}
    	
    	location.href = "t2_ApplicationDeleteOk.jsp?applicationSw=" + applicationSw;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>어플리케이션 부분 삭제</h2>
  <select name="applicationSw" id="applicationSw" onchange="applicationDelete()">
  	<option value="">선택</option>
  	<option value="aMid">아이디</option>
  	<option value="aNickName">닉네임</option>
  	<option value="aName">성명</option>
  </select>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>