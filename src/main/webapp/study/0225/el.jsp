<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>el.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language) 표현식 연습</h2>
  <pre>
    역할 : 저장소(서버 - ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당. 
    사용방법(용도) : 사용자 '변수/값/수식/객체'등을 전송받은후에 저장, 계산, 기타 처리하는 용도로 사용함.
    표기법 : $ {변수/값/수식/객체}
    서버저장소 : Application /Session / PageContext / Request
  </pre>
<%
  String name1 = "홍길동";
  String name2 = "atom";
  int su1=100, su2=200;
  String su3="300", su4="400";
%>
  <h4>스크립틀릿을 이용한 출력</h4>
  <div>
    name1 = <%=name1%><br/>
    name2 = <%=name2%><br/>
    su1 = <%=su1%><br/>
    su2 = <%=su2%><br/>
    su3 = <%=su3%><br/>
    su4 = <%=su4%><br/>
    su1 + su2 = <%=(su1 + su2)%><br/>
    su3 + su4 = <%=(su3 + su4)%><br/>
  </div>
<%
  pageContext.setAttribute("name1", name1);
  pageContext.setAttribute("name2", name2);
  pageContext.setAttribute("su1", su1);
  pageContext.setAttribute("su2", su2);
  pageContext.setAttribute("su3", su3);
  pageContext.setAttribute("su4", su4);
%>
  ------------------------<br/>
  <h4>EL을 이용한 출력</h4>
  name1 = ${name1}<br/>
  name2 = ${name2}<br/>
  su1 = ${su1}<br/>
  su2 = ${su2}<br/>
  su3 = ${su3}<br/>
  su4 = ${su4}<br/>
  su1 + su2 = ${su1 + su2}<br/>
  su3 + su4 = ${su3 + su4}<br/>
  su3 / su4 = ${su3 / su4}<br/>
  ------------------------<br/>
  <h4>파라메터를 통해서 넘어온 값의 처리(QueryString형식)</h4>
  <div>주소창에 현재주소뒤에 '?mbc=200&kbs=50'을 입력후 아래내용 처리</div>
  mbc = ${param.mbc}<br/>
  kbs = ${param.kbs}<br/>
  mbc - kbs = ${param.mbc - param.kbs}<br/>
  <hr/>
  <div>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/j0225/ElTest">
    	<h2>Form 자료(Post형식) 전송 연습</h2>
    	<div class="input-group">
    	  <div class="input-group-text">성명</div>
    	  <input type="text" name="name" value="홍길동" class="form-control mb-3"/>
    	</div>
    	<div class="input-group mb-3">
    	  <div class="input-group-text">취미</div>
    	  <input type="checkbox" name="hobby" value="등산" checked />등산 &nbsp;
    	  <input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
    	  <input type="checkbox" name="hobby" value="수영" />수영 &nbsp;
    	  <input type="checkbox" name="hobby" value="바둑" />바둑 &nbsp;
    	  <input type="checkbox" name="hobby" value="승마" />승마 &nbsp;
    	  <input type="checkbox" name="hobby" value="바이크" />바이크
    	</div>
    	<div>
    	  <input type="submit" value="전송" class="btn btn-success form-control"/>
    	</div>
    </form>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>