<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>password.jsp</title>
	<%@ include file="/include/bs5.jsp" %>
	<script>
		'use strict';
		
		function fCheck(flag) {
			let pwd = myform.pwd.value;
			if(pwd.trim() == "" || pwd.length > 10) {
				alert("비밀번호를 확인하세요")
				myform.pwd.focus();
			}
			else {
				myform.flag.value = flag;
				myform.action = "PasswordCheck.st";
				myform.submit();
			}
		}
	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>비밀번호 암호화</h2>
	<pre>
		* 솔트(salt) *
		암호학에서 salt는 데이터, 비밀번호, 통과하는 암호를 해시처리하기위한 단방향함수의 추가 키로서 랜덤하게 처리하는 데이터이다.
		솔트는 레인보우 테이블(rainbow table : 해시테이블) 과 같은 미리 계산된 테이블을 사용한다.
	</pre>
	<p>(비밀번호는 10자 이내로 작성한다.)
	<form name="myform" method="post">
		<table class="table table-bordered">
			<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" id="pwd" value="1234" maxlength="10" required class="form-control" /></td>
			</tr>
			<tr>
			<td colspan="2" class="text-center"> 
				<input type="button" value="숫자비밀번호" onclick="fCheck(1)" class="btn btn-success" />
				<input type="button" value="문자비밀번호" onclick="fCheck(2)" class="btn btn-success" />
				<input type="button" value="SHA암호화" onclick="fCheck(3)" class="btn btn-success" />
				<input type="button" value="SHA256+Salt" onclick="fCheck(4)" class="btn btn-danger" />
				<input type="button" value="SHA256+Salt 확인" onclick="fCheck(5)" class="btn btn-danger" />
			</td>
			</tr>
		</table>
		<input type="hidden" name="flag"/>
	</form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>