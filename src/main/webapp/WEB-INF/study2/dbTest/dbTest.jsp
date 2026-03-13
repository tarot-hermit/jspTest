<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>dbTest.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    function nameSearch(flag) {
    	let str = '<div class="input-group">';
    	str += '<div class="input-group-text">검색할 성명</div>';
    	str += '<input type="text" name="name" id="name" placeholder="검색할 성명을 입력하세요." class="form-control"/>';
    	str += '<input type="button" value="검색" onclick="searchName(\''+flag+'\')" class="btn btn-info" />';
    	str += '</div>';
    	demo.innerHTML = str;
    }
    
    function searchName(flag) {
    	let name = document.getElementById("name").value;
    	if(flag == 'u')	location.href = "HoewonUpdate.db?name="+name;
    	else if(flag == 'd') location.href = "HoewonDelete.db?name="+name;
    	else if(flag == 's') location.href = "HoewonSearch.db?name="+name;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">데이터베이스 연습</h2>
  <br/>
  <hr/>
  <div class="row">
    <div class="col"><a href="HoewonList.db" class="btn btn-success">회원리스트</a></div>
    <div class="col"><a href="HoewonInput.db" class="btn btn-primary">회원등록</a></div>
    <div class="col"><a href="javascript:nameSearch('u')" class="btn btn-warning">회원수정</a></div>
    <div class="col"><a href="javascript:nameSearch('d')" class="btn btn-danger">회원삭제</a></div>
    <div class="col"><a href="javascript:nameSearch('s')" class="btn btn-info">회원조회</a></div>
	</div>
  <hr/>
  <div id="demo" class="text-center"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>