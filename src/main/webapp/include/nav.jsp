<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
  String login = session.getAttribute("sLogin")==null ? "" : (String) session.getAttribute("sLogin");
%>

<script>
  'use strict';
  function memberDeleteCheck() {
	  let ans = confirm("회원에 탈퇴 하시겠습니까?");
	  if(ans) {
		  ans = confirm("회원에 탈퇴하시면 같은 아이디로 1개월동안 사용하실수 없습니다.\n그래도 탈퇴 하시겠습니까?");
		  if(ans) location.href = 'MemberDelete.mem';
	  }
  }
  
</script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="http://192.168.50.51:9090/springGreen/Main">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/GuestList.gu">Guest</a>
      </li>
      <c:if test= "${sLevel <= 4 }">  
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <c:if test= "${sLevel != 1 }">  
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>
      <li>
	      <div class="dropdown me-2">
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
			      <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study/0303/t3_lifeCycle.jsp">생명주기연습</a></li>
			    </ul>
			  </div>
		  </li>
      <li>
	      <div class="dropdown me-2">
			    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Study2</button>
			    <ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="${ctp}/study2/Test1">프론트파일 보안연습</a></li>
			      <li><a class="dropdown-item" href="${ctp}/mapping/Test1">디렉토리 패턴</a></li>
			      <li><a class="dropdown-item" href="___.do">확장자 패턴</a></li>
			      <li><a class="dropdown-item" href="DbTest.db">데이터베이스연습</a></li>
			      <li><a class="dropdown-item" href="MemberPwdCheck.mem">비밀번호수정</a></li>
			    	<li><a class="dropdown-item" href="AjaxForm.st">AJax연습</a></li>
			    	<li><a class="dropdown-item" href="UUIDForm.st">UUID연습</a></li>
			    	<li><a class="dropdown-item" href="ModalForm.st">Modal연습</a></li>
			    </ul>
			  </div>
		  </li>
		  </c:if>
      <li>
	      <div class="dropdown">
			    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">MyPage</button>
			    <ul class="dropdown-menu">
			      <li ><a class="dropdown-item" href="MemberMain.mem">회원메인방</a></li>
			     <c:if test="${sLevel != 1 }"> <li><a class="dropdown-item" href="MemberList.mem">회원리스트</a></li></c:if>
			      <li><a class="dropdown-item" href="___.do">회원정보수정</a></li>
			      <li><a class="dropdown-item" href="MemberPwdCheckForm.mem">비밀번호수정</a></li>
			      <li><a class="dropdown-item" href="javascript:memberDeleteCheck()">회원탈퇴</a></li>
			      <c:if test="${sLevel == 0}"><li><a class="dropdown-item" href="AdminMain.ad">관리자메뉴</a></li></c:if>
			    </ul>
			  </div>
		  </li>
		  <li class="nav-item">
        <a class="nav-link" href="MemberLogout.mem">Logout</a>
      </li>
      </c:if>
      <c:if test="${not empty sLevel and sLevel > 4}">
		      <li class="nav-item"><a class="nav-link" href="MemberLogin.mem">Login</a></li>
		      <li class="nav-item"><a class="nav-link" href="MemberJoin.mem">Join</a></li>
     	</c:if>
    </ul>
  </div>
</nav>