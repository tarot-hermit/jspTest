<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jstl4.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <jsp:include page="jstlMenu.jsp" />
  <h2>JSTL Function 라이브러리</h2>
  <pre>
    사용법 : $ { fn:함수명(값/변수,...) }
  </pre>
	<hr/>
	<div>
	  메세지 내용 : ${message}<br/>
	  1-1.길이(length) : ${fn:length(message)}<br/>	<%-- message.length() --%>
	  1-2.길이(members배열길이) : ${fn:length(members)}<br/>	<%-- members.length --%>
	  1-3.길이(vos객체 길이) : ${fn:length(vos)}<br/>	<%-- vos.size() --%>
	  <br/>
	  2-1.대문자변환(toUpperCase()) : ${fn:toUpperCase(message)}<br/>
	  2-2.소문자변환(toLowerCase()) : ${fn:toLowerCase(message)}<br/>
	  <br/>
	  3-1.문자열추출(substring()) : ${fn:substring(message, 0, 5)}<br/>
	  3-2.문자열추출(substring()) : ${fn:substring(message, 5, fn:length(message))}<br/>
	  <br/>
	  4-1.특정문장의 위치(indexOf()) : - 첫번째 'o'의 위치는? ${fn:indexOf(message, 'o')}<br/>
	  <pre> (과제)
	      - 두번째 'o'의 위치?
	      - message변수안에 들어있는 'o'의 전체 개수와 위치는?(forEach활용....)
	      
	  </pre>
	  <%-- 
	      검색문자열의 뒤쪽 전제 자료 추출 : substringAfter() 
	      검색문자열의 앞쪽 전제 자료 추출 : substringBefore() 
	  --%>
	  4-2.- message변수내용중 두번째 'o'의 위치?substringAfter()
	        ${fn:indexOf(message, fn:substringAfter(fn:substringAfter(message, 'o'), 'o'))-1}<br/>
	  4-2.- substringBefore() : ${fn:substringBefore(message,'o')}<br/>
	  <br/>
	  5-1.문자열분리(split(변수,분리할문자)) : 'o'문자를 기준으로 각각을 분리시켜 출력?<br/>
	  <c:set var="strs" value="${fn:split(message, 'o')}"/>
	  <c:forEach var="str" items="${strs}" varStatus="st">
	    ${st.count}. ${str}<br/>
	  </c:forEach>
	  message변수안의 'o'문자의 개수는? ${fn:length(strs)-1} 개<br/>
	  <br/>
	  6.치환(replace())<br/>
	  str변수안의 'o'를 'O'로 치환? ${fn:replace(message, 'o', 'O')}<br/>
	  <br/>
	  7-1.포함(contains()) :<br/> 
	  'My'를 포함하는가? ${fn:contains(message, 'My')}<br/>
	  'my'를 포함하는가? ${fn:contains(message, 'my')}<br/>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>