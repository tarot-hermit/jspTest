<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t6_Login.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    // localStorage는 Redis TTL 기능(자동삭제)이 없기에 미리 읽어와서 기간이 만료되었으면 localStorage제거하게한다.
    const expire = localStorage.getItem("expire");
    if (expire && new Date() > new Date(expire)) {
  	  localStorage.removeItem("savedId");
  	  localStorage.removeItem("expire");
  	}

    window.onload = function () {
	    const mid = document.getElementById("mid");
	    const saveId = document.getElementById("saveId");
	    
      const savedId = localStorage.getItem("savedId");
      if (savedId) {
        mid.value = savedId;
        saveId.checked = true;
      }
    };

    function loginCheck() {
    	const mid = document.getElementById("mid");
    	const pwd = document.getElementById("pwd");
	    const saveId = document.getElementById("saveId");
	    
	    if(mid.value.trim() == "" || pwd.value.trim() == "") {
	    	alert("아이디와 비밀번호는 필수입력입니다.\n확인후 다시 로그인해주세요");
	    	mid.focus();
	    	return false;
	    }
	    
      if (saveId.checked) {
        localStorage.setItem("savedId", mid.value);
        
        let now = new Date();
        now.setDate(now.getDate() + 7);
        localStorage.setItem("expire", now.toISOString());
      } else {
        localStorage.removeItem("savedId");
        localStorage.removeItem("expire");
      }
			
      document.myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="<%=request.getContextPath()%>/study/0224_storage/t6_LoginOk.jsp">
  	<table class="table table-bordered text-center">
  	  <tr>
  	    <td colspan="2"><font size="5">로 그 인</font></td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" autofocus required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호</th>
  	    <td><input type="password" name="pwd" id="pwd" value="1234" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <button type="button" onclick="loginCheck()" class="btn btn-success btn-sm me-2">로그인</button>
  	      <button type="reset" class="btn btn-warning btn-sm me-2">다시입력</button>
  	      <button type="button" onclick="location.href='<%=request.getContextPath()%>/'" class="btn btn-info btn-sm me-2">돌아가기</button>
  	      <input type="checkbox" id="saveId" class="ms-4" checked /> 아이디 저장
  	    </td>
  	  </tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>