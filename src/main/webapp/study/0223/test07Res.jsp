<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test07Res.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>학생 성적표(1인)</h2>
  <table class="table table-hover">
    <tr>
      <th>성명</th>
      <td><%= request.getAttribute("name") %></td>
    </tr>
    <tr>
      <th>학번</th>
      <td><%= request.getAttribute("hakbun") %></td>
    </tr>
    <tr>
      <th>국어</th>
      <td><%= request.getAttribute("kor") %></td>
    </tr>
    <tr>
      <th>영어</th>
      <td><%= request.getAttribute("eng") %></td>
    </tr>
    <tr>
      <th>수학</th>
      <td><%= request.getAttribute("mat") %></td>
    </tr>
    <tr>
      <th>사회</th>
      <td><%= request.getAttribute("soc") %></td>
    </tr>
    <tr>
      <th>과학</th>
      <td><%= request.getAttribute("sci") %></td>
    </tr>
    <tr>
      <th>총점</th>
      <td><%= request.getAttribute("total") %></td>
    </tr>
    <tr>
      <th>평균</th>
      <td><%= request.getAttribute("avg") %></td>
    </tr>
    <tr>
      <th>학점</th>
      <td><%= request.getAttribute("grade") %></td>
    </tr>
    <tr>
      <th>접속IP</th>
      <td><%= request.getAttribute("ip") %></td>
    </tr>
  </table>
  <hr/>
  <div><a href="../study/0223/test07.jsp" class="btn btn-success">돌아가기</a></div>
</div>
</body>
</html>