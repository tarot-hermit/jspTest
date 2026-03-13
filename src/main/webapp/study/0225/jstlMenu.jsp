<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:set var="ctp" value="<%=request.getContextPath()%>"/> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- jstlMenu.jsp -->
	<hr/>
	<div class="row">
	  <div class="col"><input type="button" value="배열출력" onclick="location.href='<%=request.getContextPath()%>/study/0225/jstl2.jsp'" class="btn btn-success"/></div>
	  <%-- <div class="col"><input type="button" value="vos출력" onclick="location.href='<%=request.getContextPath()%>/j0225/Jstl3'" class="btn btn-primary"/></div> --%>
	  <div class="col"><a href='${ctp}/j0225/Jstl3' class="btn btn-primary">vos출력</a></div>
	  <div class="col"><a href='${ctp}/j0225/Jstl4' class="btn btn-secondary">JSTL함수</a></div>
	  <div class="col"><a href='${ctp}/j0225/Jstl5' class="btn btn-info">JSTL포멧</a></div>
	</div>
	<hr/>