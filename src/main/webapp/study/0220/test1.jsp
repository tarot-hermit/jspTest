<!-- < % @  지시자(Directive Tag)    % > -->
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test1.jsp</title>
  <script>
    'use strict';
    
    // 자바스크립트 한줄 주석
    /* 자바스크립트 여러줄 주석 */
  </script>
  <style>
    /* css 주석 */
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>각종 주석</h2>
  <!-- HTML 주석 -->
  
  <div>스클립틀릿(scriptlet) : < % ~~~~ % ></div>
<%
	// 이곳은 자바 한줄주석
	/* 자바 여러줄 주석 */
	
	int tot = 0;

  for(int i = 1; i<=100; i++) {
  	tot += i;
  }
  out.println("1~100까지의 합은? " + tot + "입니다.............");
	
%>
	<%--  JSP 주석 <%  %> --%>
	<br/><br/>
	<div>< % = 표현식(Expression) % ></div>
  <p>1에서 100까지의 합은 <%=tot %> 입니다.</p>
  
<%!
	// 선언문 작성시 사용....(함수/메소드 정의)
	Date date = new Date();
%>  
  <div>오늘 날짜는? <%=date %></div>
  
</div>
</body>
</html>