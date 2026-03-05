<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardInput.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>게시판 자료 등록</h2>
  <hr/>
  <div>메세지 : ${msg}</div>
  <hr/>
  <h3>게시판 글 등록</h3>
  <form name="myform" method="post" action="boardInputOk.re">
	  <table class="table table-bordered">
	    <tr>
	      <th>글쓴이</th>
	      <td><input type="text" name="name" value="홍길동" class="form-control" required /></td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" class="form-control" required></textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="submit" value="글등록하기" class="btn btn-success"/>
	        <input type="reset" value="다시입력" class="btn btn-warning"/>
	      </td>
	    </tr>
	  </table>
  </form>
  <hr/>
  <div><a href="___.do" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>