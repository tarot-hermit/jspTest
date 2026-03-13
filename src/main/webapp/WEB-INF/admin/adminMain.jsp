<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 패널</title>
  <frameset cols="220px, *" border="0" framespacing="0">
    <frame src="AdminLeft.ad" name="adminLeft" scrolling="no" noresize>
    <frame src="AdminRight.ad" name="adminRight">
  </frameset>
</head>
<body>
</body>
</html>
