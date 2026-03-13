<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- certification.jsp -->
<%
	String login = session.getAttribute("sLogin")==null ? "" : (String)session.getAttribute("sLogin");
  System.out.println("1.login : " + login);
	if(login.equals("")) {
	  System.out.println("2.login : " + login);
		out.println("<script>");
		out.println("alert('로그인후 사용하세요.');");
		out.println("location.href='"+request.getContextPath()+"/Login?loginSw=main_Login'");
		out.println("</script>");
	}
%>