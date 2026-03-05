<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>부분 삭제 선택</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    function delCheck() {
      const v = document.getElementById('delItem').value;
      if(v === '') {
        alert('삭제할 항목을 선택하세요.');
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />

<p><br/></p>
<div class="container">
  <h2 class="text-center">삭제할 세션 선택</h2>
  <hr/>

  <form method="post" action="t1_SessionPartDelete.jsp" onsubmit="return delCheck();">
    <table class="table table-bordered text-center">
      <tr>
        <th style="width:30%;">삭제 항목</th>
        <td>
          <select name="delItem" id="delItem" class="form-select">
            <option value="">선택</option>
            <option value="sMid">아이디 삭제</option>
            <option value="sNickName">닉네임 삭제</option>
            <option value="sName">성명 삭제</option>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit" class="btn btn-danger btn-sm me-2">삭제</button>
          <a href="t1_Session.jsp" class="btn btn-secondary btn-sm">메인으로</a>
        </td>
      </tr>
    </table>
  </form>
</div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>