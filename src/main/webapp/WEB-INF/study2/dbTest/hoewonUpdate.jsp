<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>hoewonUpdate.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    function fCheck() {
    	let age = document.getElementById("age");
    	
    	if(age.value.trim() == "") {
    		alert("나이를 입력하세요");
    		age.focus();
    		return false;
    	}
    	else {
    		document.myform.submit();
    	}
    }
  </script>
  <style>
    th {
      text-align: center;
      background-color: #eee !important;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">회 원 정 보 수 정</h2>
  <form name="myform" method="post" action="HoewonUpdateOk.db">
	  <table class="table table-bordered">
	    <tr>
	      <th>성명</th>
	      <%-- <td>${vo.name}</td> --%>
	      <td><input type="text" name="name" value="${vo.name}" class="form-control" readonly /></td>
	    </tr>
	    <tr>
	      <th>나이</th>
	      <td><input type="number" name="age" id="age" value="${vo.age}" class="form-control" required /></td>
	    </tr>
	    <tr>
	      <th>성별</th>
	      <td>
	        <input type="radio" name="gender" value="남자" ${vo.gender=='남자' ? 'checked' : ''}>남자 &nbsp;
	        <input type="radio" name="gender" value="여자" ${vo.gender=='여자' ? 'checked' : ''}>여자
	      </td>
	    </tr>
	    <tr>
	      <th>주소</th>
	      <td><input type="text" name="address" id="address" value="${vo.address}" class="form-control" /></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="수정하기" onclick="fCheck()" class="btn btn-success"/>
	        <input type="reset" value="다시입력" class="btn btn-warning"/>
				  <a href="DbTest.db" class="btn btn-info">돌아가기</a>
	      </td>
	    </tr>
	  </table>
	  <%-- <input type="hidden" name="name" value="${vo.name}"/> --%>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>