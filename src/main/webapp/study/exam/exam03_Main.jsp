<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exam03_Main.jsp</title>
  <jsp:include page="/include/bs5.jsp" />
  <script>
    'use strict';
    
    if('${mid}' != '') alert("${mid}님 로그인 되었습니다.");
    
    function searchCheck() {
    	let str = '';
    	str += '접속아이피 : <%=request.getRemoteAddr()%><br/>';
    	str += '접속 URL : <%=request.getRequestURL()%><br/>';
    	str += 'ContextPath명 : <%=request.getContextPath()%><br/>';
    	str += '접속프로토콜 : <%=request.getProtocol()%><br/>';
    	str += '접속방식 : <%=request.getMethod()%><br/>';
    	str += '<hr/>';
    	
    	demo.innerHTML = str;
    }
    
    function logoutCheck() {
    	alert("${mid}님 로그아웃 되었습니다.");
    	location.href = '<%=request.getContextPath()%>/Logout?logoutSw=exam03';
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container text-center">
  <h2>회원 전용방</h2>
  <br/>
  <p>현재 <font color='blue'><b>${mid}</b></font>님 로그인 중이십니다.</p>
  <hr/>
  <p><img src="<%=request.getContextPath()%>/images/12.jpg" width="300px"/></p>
  <hr/>
  <div class="row">
    <div class="col"></div>
    <div class="col"><button type="button" onclick="searchCheck()" class="btn btn-primary">접속조회</button></div>
    <div class="col"><a href="javascript:logoutCheck()" class="btn btn-warning">로그아웃</a></div>
    <div class="col"></div>
  </div>
  <hr/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>