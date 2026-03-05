<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");

  String delItem = request.getParameter("delItem");

  if ("sMid".equals(delItem) || "sNickName".equals(delItem) || "sName".equals(delItem)) {
    session.removeAttribute(delItem);
  }
%>

<script>
  alert("선택한 세션이 삭제되었습니다.");
  location.href = "t1_Session.jsp";
</script>