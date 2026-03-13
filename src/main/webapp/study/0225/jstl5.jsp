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
  <jsp:include page="jstlMenu.jsp" />
  <h2>JSTL포멧(양식)</h2>
  1.원본 : ${won1} / ${won2} / ${won3}<br/>
  2.천단위 쉼표 :
  <fmt:formatNumber value="${won1}"/> / <fmt:formatNumber value="${won2}"/><br/>
  <fmt:formatNumber value="${won1}" pattern="0,000" /> / <fmt:formatNumber value="${won2}" pattern="0,000.0"/><br/>
  <fmt:formatNumber value="${won1}" pattern="0,000,000" /> / <fmt:formatNumber value="${won2}" pattern="0,000,000.0"/><br/>
  <fmt:formatNumber value="${won1}" pattern="0,000,000" /> / <fmt:formatNumber value="${won2}" pattern="#,###,##0.0"/><br/>
  <br/>
  3.화폐단위<br/>
  원화 : <fmt:formatNumber value="${won1}" type="currency" /><br/>
  US달러1 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD" /><br/>
  <%-- US달러2 : <fmt:formatNumber value="${won2}" pattern="#,##0.00" type="currency" currencyCode="USD"/><br/> --%>
  <br/>
  4.백분율<br/>
  백분율 : <fmt:formatNumber value="${won3}" type="percent" /> / <fmt:formatNumber value="${won3}" type="percent" pattern="0.0%" />
  <br/><br/>
  5.날짜<br/>
  오늘 날짜1 : ${today}<br/>
  오늘 날짜2 : <fmt:formatDate value="${today}"/><br/>
  오늘 날짜3 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
  오늘 날짜4 : <fmt:formatDate value="${today}" pattern="yy-MM"/><br/>
  오늘 날짜5 : <fmt:formatDate value="${today}" pattern="yyyy-M-d"/><br/>
  오늘 날짜5 : <fmt:formatDate value="${today}" pattern="yyyy년 M월 d일"/><br/>
  현재 시간1 : <fmt:formatDate value="${today}" pattern="hh : mm : ss"/><br/>
  현재 시간2 : <fmt:formatDate value="${today}" pattern="h : m : s"/><br/>
  현재 시간3 : <fmt:formatDate value="${today}" pattern="HH : mm : ss"/><br/>
  현재 시간4 : <fmt:formatDate value="${today}" pattern="HH시 mm분 ss초"/><br/>
  <br/>
  6.국가별설정(로케일)<br/>
  톰캣서버의 기본 로케일 : <%=response.getLocale() %><br/>
  톰캣서버의 기본 로케일을 미국식으로 변경 : <fmt:setLocale value="en_US"/>
  <fmt:formatNumber value="${won1}" type="currency" /><br/>
  <hr/>
  <div>
    초기화 변수의 값 : ${logoName2}
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>