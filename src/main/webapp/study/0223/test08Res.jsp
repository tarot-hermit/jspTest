<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>	
<!--  SungjukVO vo = new SungjukVO();   -->
<jsp:useBean id="vo" class="study.vo.SungjukVO" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test08Res.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <%-- 
  <jsp:setProperty property="name" name="vo" value="irum"/>
  <jsp:setProperty property="hakbun" name="vo"/>
  <jsp:setProperty property="kor" name="vo"/>
  <jsp:setProperty property="eng" name="vo"/>
  <jsp:setProperty property="mat" name="vo"/>
  <jsp:setProperty property="soc" name="vo"/>
  <jsp:setProperty property="sci" name="vo"/>
  <jsp:setProperty property="hostIp" name="vo"/>
  --%>
  <jsp:setProperty property="*" name="vo"/>
  <h2>학생 성적표(1인)</h2>
  <table class="table table-hover">
    <tr>
      <th>성명</th>
      <td>${vo.name}/<jsp:getProperty property="name" name="vo"/></td>
    </tr>
    <tr>
      <th>학번</th>
      <td>${vo.hakbun}/<jsp:getProperty property="hakbun" name="vo"/></td>
    </tr>
    <tr>
      <th>국어</th>
      <td>${vo.kor}/<jsp:getProperty property="kor" name="vo"/></td>
    </tr>
    <tr>
      <th>영어</th>
      <td>${vo.eng}/<jsp:getProperty property="eng" name="vo"/></td>
    </tr>
    <tr>
      <th>수학</th>
      <td>${vo.mat}/<jsp:getProperty property="mat" name="vo"/></td>
    </tr>
    <tr>
      <th>사회</th>
      <td>${vo.soc}/<jsp:getProperty property="soc" name="vo"/></td>
    </tr>
    <tr>
      <th>과학</th>
      <td>${vo.sci}/<jsp:getProperty property="sci" name="vo"/></td>
    </tr>
    <%-- 
    <tr>
      <th>총점</th>
      <td>${vo.tot}</td>
    </tr>
    <tr>
      <th>평균</th>
      <td>${vo.avg}</td>
    </tr>
    <tr>
      <th>학점</th>
      <td>${vo.grade}</td>
    </tr>
     --%>
    <tr>
      <th>접속IP</th>
      <td>${vo.hostIp}</td>
    </tr>
  </table>
  <hr/>
  <div><a href="test08.jsp" class="btn btn-success">돌아가기</a></div>
</div>
</body>
</html>