<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
%>

  <h2>이곳은 test01Ok.jsp 입니다.</h2>
  <hr/>
  <p>아이디 : <%=mid%></p>
  <p>비밀번호 : <%=pwd%></p>
  <p><a href="test01.jsp" class="btn btn-success mt-3">돌아가기1</a></p>
