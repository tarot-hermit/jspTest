<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exam04.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <style>
    .gugu td, .gugu th { padding: 4px 10px; white-space: nowrap; }
    .img-box { display:flex; align-items:center; gap:10px; margin:10px 0; }

    .thumb {
      width: 180px; height: 120px;
      object-fit: cover;
      border-radius: 10px;
      border: none;                
    }
    .border-strong { border: 4px solid #000 !important; }
  </style>
</head>

<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />

<div class="container mt-4">

  <div class="alert alert-secondary">
    <pre class="m-0">
1. 시작단과 끝단을 입력받아서 시작단과 끝단을 출력하시오.
2. 1번은 세로로 출력하고, 2번은 한줄에 입력된단 열의 수만큼 출력하시오.
3. images폴더의 그림 10장(11.jpg~20.jpg)를 순차적으로 출력하시오
   단, 첫번째 그림과 마지막 그림에는 테두리를 표시하시오. 또, 각 출력된 그림앞에는 순차번호(1,2,3,)을 표시하시오.
4. '11.jpg~20.jpg'그림을 배열에 저장시킨후, 배열에 저장된 그림을 차례대로 출력하시오.
    </pre>
  </div>

  <form method="get" class="row g-2 mb-4">
    <div class="col-md-3">
      <label class="form-label">시작단</label>
      <input type="number" name="sDan" class="form-control" min="1" max="19"
             value="${empty param.sDan ? '' : param.sDan}">
    </div>
    <div class="col-md-3">
      <label class="form-label">끝단</label>
      <input type="number" name="eDan" class="form-control" min="1" max="19"
             value="${empty param.eDan ? '' : param.eDan}">
    </div>
    <div class="col-md-3">
      <label class="form-label">한 줄 열 수(col)</label>
      <input type="number" name="col" class="form-control" min="1" max="10"
             value="${empty param.col ? 3 : param.col}">
    </div>

    <div class="col-md-3 d-grid gap-2">
      <button class="btn btn-primary" name="work" value="12" type="submit">1·2번 출력</button>
      <button class="btn btn-success" name="work" value="3"  type="submit">3번 출력</button>
      <button class="btn btn-warning" name="work" value="4"  type="submit">4번 출력</button>
    </div>
  </form>

  <c:if test="${param.work == '12'}">

    <c:if test="${empty param.sDan or empty param.eDan}">
      <div class="alert alert-warning">1·2번은 시작단/끝단을 입력해야 합니다.</div>
    </c:if>

    <c:if test="${not empty param.sDan and not empty param.eDan}">
      <c:set var="sDan" value="${param.sDan + 0}" />
      <c:set var="eDan" value="${param.eDan + 0}" />
      <c:set var="col"  value="${(empty param.col ? 3 : param.col) + 0}" />

      <c:if test="${sDan > eDan}">
        <c:set var="tmp" value="${sDan}" />
        <c:set var="sDan" value="${eDan}" />
        <c:set var="eDan" value="${tmp}" />
      </c:if>

      <c:if test="${col < 1}">
        <c:set var="col" value="1" />
      </c:if>

      <h4>1) 구구단 세로 출력 (${sDan}단 ~ ${eDan}단)</h4>
      <div class="table-responsive">
        <table class="table table-bordered gugu align-middle">
          <tbody>
          <c:forEach var="dan" begin="${sDan}" end="${eDan}">
            <tr>
              <th style="width:90px;" class="text-center">${dan}단</th>
              <td>
                <c:forEach var="i" begin="1" end="9" varStatus="st">
                  ${dan} × ${i} = ${dan*i}
                  <c:if test="${!st.last}"> &nbsp; | &nbsp; </c:if>
                </c:forEach>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <h4 class="mt-4">2) 한 줄에 ${col}단씩 가로 출력</h4>
      <div class="table-responsive">
        <table class="table table-bordered gugu text-center align-middle">
          <tbody>

          <tr class="table-light">
            <c:forEach var="dan" begin="${sDan}" end="${eDan}" varStatus="st">
              <th>${dan}단</th>
              <c:if test="${(st.count % col) == 0 and !st.last}">
                </tr><tr class="table-light">
              </c:if>
            </c:forEach>
          </tr>

          <c:forEach var="i" begin="1" end="9">
            <tr>
              <c:forEach var="dan" begin="${sDan}" end="${eDan}" varStatus="st">
                <td>${dan}×${i}=${dan*i}</td>
                <c:if test="${(st.count % col) == 0 and !st.last}">
                  </tr><tr>
                </c:if>
              </c:forEach>
            </tr>
          </c:forEach>

          </tbody>
        </table>
      </div>

    </c:if>
  </c:if>

  <c:if test="${param.work == '3'}">
    <h4 class="mt-4">3) images/11.jpg ~ 20.jpg 순차 출력</h4>

    <c:forEach var="n" begin="11" end="20" varStatus="st">
      <c:set var="cls" value="thumb" />
      <c:if test="${st.first or st.last}">
        <c:set var="cls" value="thumb " />
      </c:if>

      <div class="img-box">
        <div class="fw-bold" style="width:30px;">${st.count}.</div>
        <img class="${cls}" src="${pageContext.request.contextPath}/images/${n}.jpg" alt="${n}.jpg" />
        <div class="text-muted">${n}.jpg</div>
      </div>
    </c:forEach>
  </c:if>

  <c:if test="${param.work == '4'}">
    <h4 class="mt-4">4) 배열에 저장 후 출력 (fn:split)</h4>

    <c:set var="filesStr" value="11.jpg,12.jpg,13.jpg,14.jpg,15.jpg,16.jpg,17.jpg,18.jpg,19.jpg,20.jpg" />
    <c:set var="files" value="${fn:split(filesStr, ',')}" />

    <div class="row">
      <c:forEach var="f" items="${files}" varStatus="st">
        <c:set var="cls2" value="thumb" />
        <c:if test="${st.first or st.last}">
          <c:set var="cls2" value="thumb border-strong" />
        </c:if>

        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
          <div class="card p-2">
            <div class="small fw-bold mb-1">${st.count}. ${f}</div>
            <img class="${cls2}" src="${pageContext.request.contextPath}/images/${f}" alt="${f}" />
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>

</div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>