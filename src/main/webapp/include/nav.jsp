<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
  String login = session.getAttribute("sLogin")==null ? "" : (String) session.getAttribute("sLogin");
%>

<script>
  'use strict';
  
  function logoutCheck() {
	  alert("로그아웃 처리 되었습니다.");
	  location.href = "<%=request.getContextPath()%>/login/Logout?logoutSw=main";
  }
</script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="http://192.168.50.51:9090/springGreen/Main">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/GuestList">Guest</a>
      </li>
      <% if(login.equals("OK")) { %>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>
      <li>
	      <div class="dropdown">
			    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Study1</button>
			    <ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0223/test06.jsp">서버환경변수</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t1_Session.jsp">세션연습</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t2_Application.jsp">어플리케이션연습</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t3_StorageTest.jsp">Storage Test1</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t4_ServerStorage.jsp">Storage Test2</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t0_Cookie.jsp">쿠키연습</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t5_Login.jsp">로그인연습1</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0224_storage/t6_Login.jsp">로그인연습2</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/Login?loginSw=Exam03_Login">로그인연습3</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0225/el.jsp">EL연습</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0225/jstl1.jsp">JSTL연습1</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0225/jstl2.jsp">JSTL연습2</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0303/t1_filter.jsp">한글필터연습</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0303/t2_init.jsp">초기값확인</a></li>
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0303/t3_lifeCycle.jsp">생명주기확인</a></li>
			    </ul>
			  </div>
		  </li>
      <li>
	      <div class="dropdown">
			    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Study2</button>
			    <ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="${ctp}/study2/Test1">프론트보안연습</a></li>		      
			      <li><a class="dropdown-item" href="${ctp}/mapping/Test1">디렉토리패턴연습</a></li>		      
			      <li><a class="dropdown-item" href=".do">확장자패턴연습</a></li>		      
			      <li><a class="dropdown-item" href="dbTest.mi">데이터베이스연습</a></li>		      
			    </ul>
			  </div>
		  </li>
		  <li class="nav-item">
        <a class="nav-link" href="javascript:logoutCheck()">Logout</a>
      </li>
      <% } %>
      <% if(!login.equals("OK")) { %>
      <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login/Join">Join</a></li>
      <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login/Login?loginSw=main_Login">Login</a></li>
      <% } %>
    </ul>
  </div>
</nav>