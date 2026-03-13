<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberPwdCheck.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';

    function pwdCheck() {
      let pwd = document.getElementById("pwd").value.trim();

      if (pwd == '') {
        alert("기존 비밀번호를 입력하세요.");
        document.getElementById("pwd").focus();
        return false;
      }

      let xhr = new XMLHttpRequest();
      xhr.open("POST", "${ctp}/MemberPwdCheck.mem", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
          let result = xhr.responseText.trim();
          if (result == "ok") {
        	  
            document.getElementById("pwdForm").innerHTML = `
              <hr/>
              <div class="input-group mt-2">
                <div class="input-group-text">새 비밀번호</div>
                <input type="password" name="newPwd" id="newPwd" class="form-control" placeholder="새 비밀번호 입력" required />
              </div>
              <div class="input-group mt-2">
                <div class="input-group-text">비밀번호 확인</div>
                <input type="password" name="newPwdChk" id="newPwdChk" class="form-control" placeholder="비밀번호 재입력" required />
              </div>
              <div class="mt-2 text-end">
                <input type="button" value="변경완료" onclick="pwdUpdate()" class="btn btn-primary" />
              </div>
            `;

            document.getElementById("pwd").readOnly = true;
          } else {

        	  document.getElementById("pwdForm").innerHTML =
              `<div class="text-danger mt-2">❌ 비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>`;
            document.getElementById("pwd").value = '';
            document.getElementById("pwd").focus();
          }
        }
      };
      xhr.send("pwd=" + encodeURIComponent(pwd));
    }

    function pwdUpdate() {
      let newPwd    = document.getElementById("newPwd").value.trim();
      let newPwdChk = document.getElementById("newPwdChk").value.trim();

      if (newPwd == '') {
        alert("새 비밀번호를 입력하세요.");
        document.getElementById("newPwd").focus();
        return false;
      }
      if (newPwd.length < 4 || newPwd.length > 12) {
        alert("비밀번호는 4~12자리로 입력하세요.");
        document.getElementById("newPwd").focus();
        return false;
      }
      if (newPwd != newPwdChk) {
        alert("새 비밀번호가 일치하지 않습니다.");
        document.getElementById("newPwdChk").value = '';
        document.getElementById("newPwdChk").focus();
        return false;
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
  <h2>비밀번호 변경</h2>
  <form name="myform" method="post" action="${ctp}/MemberPwdCheckOk.mem">
    <div class="input-group">
      <div class="input-group-text">기존 비밀번호</div>
      <input type="password" name="pwd" id="pwd" class="form-control" autofocus required />
      <input type="button" value="비밀번호 확인" onclick="pwdCheck()" class="btn btn-success" />
    </div>
    <div id="pwdForm"></div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
