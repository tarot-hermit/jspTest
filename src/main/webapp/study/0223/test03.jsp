<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test03.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>정적(static)파일 연습</h2>
  <p>jsp소스코드와는 별개로 webapp폴더 아래쪽에 독립적으로 폴더를 만들어서 관리한다.</p>
  <p>종류 : js / css / image / 템플릿파일 / font파일</p>
  <hr/>
  <div>
    <p>1.<img src="11.jpg" width="200px" alt="11.jpg" /> (X)</p>
    <p>2.<img src="../../images/12.jpg" width="200px" alt="12.jpg" /> (O)</p>
    <p>3.<img src="/images/13.jpg" width="200px" alt="13.jpg" /> (X)</p>
    <p>4.<img src="/springGreen/images/14.jpg" width="200px" alt="14.jpg" /> (O)</p>
    <p>5.<img src="/springGreen2/images/15.jpg" width="200px" alt="15.jpg" /> (X)</p>
    <p>6.<img src="<%=request.getContextPath()%>/images/16.jpg" width="200px" alt="16.jpg" /> (O)</p>
    <p>그림보기<br/>
      <%
        for(int i=11; i<=20; i++) {
        	out.println("<div><img src='"+request.getContextPath()+"/images/"+i+".jpg' width='200px' alt='"+i+".jpg' /></div>");
        }
      %>
    </p>
  </div>
</div>
</body>
</html>