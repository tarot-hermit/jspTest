<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jstl1.jsp.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<jsp:include page="jstlMenu.jsp" />
  <h2>JSTL(Java Standard Tag Library)</h2>
  <table class="table table-bordered">
    <tr>
      <th>라이브러리</th>
      <th>주소(URI)</th>
      <th>접두어</th>
      <th>기본문법</th>
    </tr>
    <tr>
      <td>Core</td>
      <td>http://java.sun.com/jsp/jstl/core</td>
      <td>c</td>
      <td>< c : 태그명....  ></td>
    </tr>
    <tr>
      <td>Formatting</td>
      <td>http://java.sun.com/jsp/jstl/fmt</td>
      <td>fmt</td>
      <td>< fmt : 태그명... ></td>
    </tr>
    <tr>
      <td>Function</td>
      <td>http://java.sun.com/jsp/jstl/function</td>
      <td>fn</td>
      <td>$ { fn : 태그명....}</td>
    </tr>
    <tr>
      <td>SQL</td>
      <td>http://java.sun.com/jsp/jstl/sql</td>
      <td>sql</td>
      <td>< sql : 태그명... ></td>
    </tr>
  </table>
  <hr/>
  <div>
    <b>앞의 라이브러리를 사용하려면 반드시 jsp파일 상단에 'taglib'를 이용하여 주소를 선언후 사용한다.</b>
  </div>
  <hr/>
  <h2>Core 라이브러리</h2>
  <p>용도 : 변수제어(선언/값(일반,객체) 할당/출력/제거), 제어문(조건문, 반복문)</p>
  <p>
    변수선언 : < c : set var="변수명" value="값" /><br/>
    변수출력 : EL로 출력가능, 또는 < c : out value="값/수식/변수" /><br/>
    변수제거 : < c : remove var="변수명"/>
  </p>
  <hr/>
  su1변수를 선언후 초기값으로 100을 할당? <c:set var="su1" value="100" /><br/>
  su2변수를 선언후 초기값으로 100을 할당? <c:set var="su2" value="100" /><br/>
  su1값 출력1? <c:out value="${su1}"/><br/>
  su1값 출력2? ${su1}<br/>
  수식 출력1? <c:out value="${su1 + 100}"/><br/>
  수식 출력2? <c:out value="${'200' + 100}"/><br/>
  수식 출력3? <c:out value="${'200' + '100'}"/><br/>
  수식 출력4? <c:out value="${200 + su2}"/><br/>
  <%-- 수식 출력3? <c:out value="${'a200' + 100}"/><br/> --%>
  <%-- 수식 출력3? <c:out value="${'a200' + '100b'}"/><br/> --%>
  <hr/>
  <h4>제어문 : 조건문(if), 반목문(foreach)</h4>
  <p>
    사용법 : < c : if test="$ {조건식}" > __조건처리(참)내용__ < / c : if ><br/>
    단점1 : EL에는 조건무네 Else 없다.<br/>
    단점2 : jstl의 숫자비교는 문자형식으로 비교한다.<br/>
  </p>
  <c:set var="su3" value="300"/>
  <c:set var="su4" value="400"/>
  <c:set var="su5" value="80"/>
  1. su3 == su4 : <c:if test="${su3 == su4}">su3와 su4는 같다.</c:if><br/>
  2. su3 != su4 : <c:if test="${su3 != su4}">su3와 su4는 같지않다.</c:if><br/>
  3. su3 > su4 : <c:if test="${su3 > su4}">su3가 su4보다 크다.</c:if><br/>
  4. su3 <= su4 : <c:if test="${su3 <= su4}">su3가 su4보다 크지 않다.</c:if><br/>
  5. su3 < su4 : <c:if test="${su3 < su4}">su3가 su4보다 작다.</c:if><br/>
  6. su3 >= su4 : <c:if test="${su3 >= su4}">su3가 su4보다 작지 않다.</c:if><br/>
  7. su4 > su5 : <c:if test="${su4 > su5}">su4가 su5보다 크다.</c:if><br/>
  8. su4 <= su5 : <c:if test="${su4 <= su5}">su4가 su5보다 크지 않다.</c:if><br/>
  9. su4 &lt; su5 : <c:if test="${su4 lt su5}">su4가 su5보다 작다.</c:if><br/>
  10. su4 &le; su5 : <c:if test="${su4 le su5}">su4가 su5보다 작거나 같다.</c:if><br/>
  10. su4 &gt; su5 : <c:if test="${su4 gt su5}">su4가 su5보다 크다.</c:if><br/>
  10. su4 &ge; su5 : <c:if test="${su4 ge su5}">su4가 su5보다 크거나 같다.</c:if><br/>
  <br/>
  11.URL에 QueryString방식으로 값이 전송될때의 계산(주소?jum=75)<br/>
  <c:set var="jum" value="${param.jum}"/>
  <c:if test="${jum+0 >= 60}"><c:set var="grade" value="D"/></c:if>
  <c:if test="${jum+0 >= 70}"><c:set var="grade" value="C"/></c:if>
  <c:if test="${jum+0 >= 80}"><c:set var="grade" value="B"/></c:if>
  <c:if test="${jum+0 >= 90}"><c:set var="grade" value="A"/></c:if>
  <c:if test="${jum+0 < 60}"><c:set var="grade" value="F"/></c:if>
  입력받은 점수 : ${jum} 의 학점은 ${grade} 입니다.<br/>
  <br/>
  <h2>다중 조건비교 : choose ~ when</h2>
  <pre>
    사용법 : 
    < c : choose >
      < c : when test="조건식1">수행할 내용1< / c : when >
      < c : when test="조건식2">수행할 내용2< / c : when >
      < c : when test="조건식3">수행할 내용3< / c : when >
      < c : when test="조건식4">수행할 내용4< / c : when >
      ~~ ~~ 등 등 ~~
      < c : otherwise > 기타 수행할 내용 < / : otherwise >
    < / c : choose >
  </pre>
  <div>12.학점은?
    <c:choose>
      <c:when test="${jum+0 >= 90}">A</c:when>
      <c:when test="${jum+0 >= 80}">B</c:when>
      <c:when test="${jum+0 >= 70}">C</c:when>
      <c:when test="${jum+0 >= 60}">D</c:when>
      <c:otherwise>F</c:otherwise>
    </c:choose>
    학점 입니다.
  </div>
  <br/>
  <div>13.부장(B), 과장(K), 대리(D), 사원(S)<br/>
  <c:set var="ju" value="${param.ju}"/>
  <div>당신의 직급은? <b><font color='red'>
		<c:choose>
	    <c:when test="${ju=='B'}">부장</c:when>
	    <c:when test="${ju=='K'}">과장</c:when>
	    <c:when test="${ju=='D'}">대리</c:when>
	    <c:otherwise>사원</c:otherwise>
	  </c:choose>
	  </font></b>입니다.
  </div>
	<br/>
	<h2>반복문(forEach)</h2>
	<pre>
	  사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수"> ~처리내용~ < / c : forEach >
	         step이 1인경우는 생략가능하다.
	  사용법2 : < c : forEach var="변수" items=" $ {배열/객체명}" varStatus="매개변수"> ~처리내용~ < / c : forEach >
	</pre>
	<p>사용법1</p>
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="st">
		${i} /
	</c:forEach>
	<br/><br/>
<%
  String[] cards = {"국민","BC","LG","삼성","현대","농협","신한"};
  pageContext.setAttribute("cards", cards);
%>
  <c:forEach var="card" items="${cards}">
    ${card} /
  </c:forEach>
  <br/><br/>
  <c:set var="hobbys" value="등산/낚시/수영/바둑/바이크/요리/독서" />
  취미 : ${hobbys}<br/>
  <c:forTokens var="hobby" items="${hobbys}" delims="/">
  	${hobby} ,
  </c:forTokens>
  <br/>
  <h4>상태변수: varStatus='st'</h4>
  <c:forEach var="card" items="${cards}" varStatus="st">
    ${card} / 상태: ${st.count} , ${st.index} , ${st.first} , ${st.last}<br/>
  </c:forEach>
  <br/>
  <div>첫번째 카드는 노랑색으로, 마지막카드는 빨강색 출력</div>
  <c:forEach var="card" items="${cards}" varStatus="st">
    <c:if test="${st.first}"><font color='yellow'>${card}</font></c:if>
    <c:if test="${st.last}"><font color='red'>${card}</font></c:if>
    <c:if test="${!st.first && !st.last}">${card}</c:if>
    <br/>
  </c:forEach>
  <br/>
  <hr/>
  <pre>
    구구단.....
    5 * 1 = 5
    5 * 2 = 10
    5 * 3 = 15
    ~~~
  </pre>
  <div>
    <form>
      <div class="input-group">
	      <input type="number" name="dan" value="5" class="form-control" />
	      <input type="submit" value="출력" class="btn btn-success" />
      </div>
    </form>
  </div>
  <div>
    <c:set var="dan" value="${param.dan}"/>
    * ${dan}단 *<br/>
    <c:forEach var="i" begin="1" end="9">
      ${dan} * ${i} = ${dan * i}<br/>
    </c:forEach>
  </div>
</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>