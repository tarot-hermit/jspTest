<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t1_SessionDelete.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    function sessionDelete() {
    	let sessionSw = document.getElementById("sessionSw").value;
    	
    	if(sessionSw == "") {
    		alert("삭제할 세션명을 선택하세요");
    		return false;
    	}
    	
    	location.href = "t1_SessionDeleteOk.jsp?sessionSw=" + sessionSw;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>세션 부분 삭제</h2>
  <select name="sessionSw" id="sessionSw" onchange="sessionDelete()">
  	<option value="">선택</option>
  	<option value="sMid">아이디</option>
  	<option value="sNickName">닉네임</option>
  	<option value="sName">성명</option>
  </select>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>