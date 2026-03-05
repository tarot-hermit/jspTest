<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl5.jsp</title>
	<%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<jsp:include page="jstlMenu.jsp"/>
	<h2>JSTL 포멧</h2>
	1.원본 : ${won1} / ${won2} / ${won3}<br/>
	2.천단위 심표 :  <br/>
	won1 → <fmt:formatNumber value="${won1}" pattern="#,###"/><br/>
	won2 → <fmt:formatNumber value="${won2}" pattern="#,###.#"/><br/>
	won2 → <fmt:formatNumber value="${won2}" pattern="#,###.#"/><br/>
</div>
 3.화폐단위<br/>
 원화 : <fmt:formatNumber value="${won1}" type="currency" /> <br/> 
 US원화1 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD" /> <br/> 
 US원화2 : <fmt:formatNumber value="${won2}" type="currency" currencyCode="USD" minFractionDigits="2" maxFractionDigits="2" /> <br/> 
 US원화2 : <fmt:formatNumber value="${won2}" type="currency" currencyCode="USD" pattern="$#,##0.00"/> <br/> 
 <br/>
 4.백분율<br/>
  백분율 : <fmt:formatNumber value="${won3 }" type="percent" /> / <fmt:formatNumber value="${won3 }" type="percent" pattern="0.0%" />	
	<br/>
 5.날짜<br/>
 	날짜 : <fmt:formatDate value="${today }"/><br/>
	날짜(short) : <fmt:formatDate value="${today}" type="date" dateStyle="short"/><br/>
	날짜(medium) : <fmt:formatDate value="${today}" type="date" dateStyle="medium"/><br/>
	날짜(long) : <fmt:formatDate value="${today}" type="date" dateStyle="long"/><br/>
	날짜(full) : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br/>
	시간 : <fmt:formatDate value="${today}" type="time"/><br/>
	날짜+시간 : <fmt:formatDate value="${today}" type="both"/><br/>
	날짜 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
	날짜 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일"/><br/>
	날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
	<br/>
	6.국가별설정(로케일)<br/>
	톰캣서버의 기본 로케일 : ${pageContext.response.locale}<br/>
	<fmt:setLocale value="ko_KR"/>
	한국 : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br/>

	<fmt:setLocale value="en_US"/>
	미국 : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br/>

	<fmt:setLocale value="ja_JP"/>
	일본 : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br/>
	<hr/>
	<div>
		초기 변수의 값 : ${logoName2}<br/>
	</div>
	
<jsp:include page="/include/footer.jsp" />
</body>
</html>