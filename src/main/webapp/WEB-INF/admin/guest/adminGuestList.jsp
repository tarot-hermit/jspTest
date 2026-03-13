<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminGuestList.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <link rel="stylesheet" type="text/css" href="${ctp}/css/orangeLink.css"/>
  <script>
    'use strict';
    function deleteCheck(idx) {
      let ans = confirm("현재 게시글을 삭제하시겠습니까?");
      if(ans) location.href = "GuestDelete.gu?idx="+idx;
    }
  </script>
  <style>
    th {
      background-color: #eee !important;
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">방 명 록 리 스 트</h2>

  <!-- 상단 페이지 이동 -->
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-start"></td>
      <td class="text-end">
        <c:if test="${currentPage > 1}">
          <a href="AdminGuestList.ad?page=1" title="첫페이지">◁◁</a>
          <a href="AdminGuestList.ad?page=${currentPage - 1}" title="이전페이지">◀</a>
        </c:if>
        <b>${currentPage}</b>/${totalPage}
        <c:if test="${currentPage < totalPage}">
          <a href="AdminGuestList.ad?page=${currentPage + 1}" title="다음페이지">▶</a>
          <a href="AdminGuestList.ad?page=${totalPage}" title="마지막페이지">▷▷</a>
        </c:if>
      </td>
    </tr>
  </table>

  <!-- 게시글 목록 -->
  <c:forEach var="vo" items="${vos}" varStatus="st">
    <table class="table table-borderless m-0 p-0">
      <tr>
        <td>
          번호 : ${totalCount - start - st.index} &nbsp;
          <a href="javascript:deleteCheck(${vo.idx})" class="badge bg-danger">삭제</a> 
        </td>
        <td class="text-end">방문IP : ${vo.clientIp}</td>
      </tr>
    </table>
    <table class="table table-bordered">
      <tr>
        <th>성명</th>
        <td>${vo.name}</td>
        <th>방문일자</th>
        <td>${vo.visitDate}</td>
      </tr>
      <tr>
        <th>메일주소</th>
        <td colspan="3">
          <c:choose>
            <c:when test="${empty vo.email || fn:length(vo.email) <= 6 || fn:indexOf(vo.email, '.') == -1 || fn:indexOf(vo.email, '@') == -1}">
              - 없음 -
            </c:when>
            <c:otherwise>${vo.email}</c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th>홈페이지</th>
        <td colspan="3">
          <c:choose>
            <c:when test="${empty vo.homePage || fn:length(vo.homePage) <= 10 || fn:indexOf(vo.homePage, '.') == -1}">
              - 없음 -
            </c:when>
            <c:otherwise>
              <a href="${vo.homePage}" target="_blank">${vo.homePage}</a>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th>방문소감</th>
        <td colspan="3" style="height:180px">${fn:replace(vo.content, newLine, "<br/>")}</td>
      </tr>
    </table>
  </c:forEach>
</div>

<!-- 블록 페이지네이션 -->
<ul class="pagination justify-content-center">

  <!-- 첫페이지 -->
  <c:if test="${currentPage > 1}">
    <li class="page-item">
      <a class="page-link text-secondary" href="${ctp}/AdminGuestList.ad?page=1">첫페이지</a>
    </li>
  </c:if>

  <!-- 이전블록 -->
  <c:if test="${curBlock > 0}">
    <li class="page-item">
      <a class="page-link text-secondary" href="${ctp}/AdminGuestList.ad?page=${(curBlock - 1) * scrSize + 1}">이전블록</a>
    </li>
  </c:if>

  <!-- 페이지 번호 -->
  <c:forEach var="i" begin="${(curBlock * scrSize) + 1}" end="${(curBlock * scrSize) + scrSize}">
    <c:if test="${i <= totalPage}">
      <c:choose>
        <c:when test="${i == currentPage}">
          <li class="page-item active">
            <a class="page-link bg-secondary border-secondary" href="${ctp}/AdminGuestList.ad?page=${i}">${i}</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link text-secondary" href="${ctp}/AdminGuestList.ad?page=${i}">${i}</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:if>
  </c:forEach>

  <!-- 다음블록 -->
  <c:if test="${curBlock < lastBlock}">
    <li class="page-item">
      <a class="page-link text-secondary" href="${ctp}/AdminGuestList.ad?page=${(curBlock + 1) * scrSize + 1}">다음블록</a>
    </li>
  </c:if>

  <!-- 마지막페이지 -->
  <c:if test="${currentPage < totalPage}">
    <li class="page-item">
      <a class="page-link text-secondary" href="${ctp}/AdminGuestList.ad?page=${totalPage}">마지막페이지</a>
    </li>
  </c:if>

</ul>

<p><br/></p>
</body>
</html>