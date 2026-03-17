<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 대시보드</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #0f1117;
      --bg2: #161b27;
      --bg3: #1a2033;
      --border: rgba(255,255,255,0.07);
      --accent: #4f8ef7;
      --text: #dde3f0;
      --muted: #4e5872;
      --danger-bg: rgba(220, 53, 69, 0.1);
      --danger-border: rgba(220, 53, 69, 0.25);
      --danger-text: #f87171;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
      background: var(--bg);
      color: var(--text);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 2rem;
    }

    .dash {
      width: 100%;
      max-width: 480px;
      display: flex;
      flex-direction: column;
      gap: 0;
    }

    /* Header */
    .header {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-bottom: 1.75rem;
    }

    .icon-box {
      width: 44px;
      height: 44px;
      border-radius: 10px;
      background: var(--accent);
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .icon-box svg {
      width: 22px;
      height: 22px;
      stroke: white;
      fill: none;
      stroke-width: 1.8;
    }

    .h-title {
      font-size: 18px;
      font-weight: 700;
      color: var(--text);
    }

    .h-sub {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      color: var(--muted);
      letter-spacing: 2px;
      margin-top: 3px;
    }

    /* Metric cards */
    .grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 10px;
      margin-bottom: 12px;
    }

    .card {
      background: var(--bg2);
      border: 0.5px solid var(--border);
      border-radius: 10px;
      padding: 14px 16px;
    }

    .card-label {
      font-size: 12px;
      color: var(--muted);
      margin-bottom: 8px;
    }

    .card-value {
      font-size: 28px;
      font-weight: 700;
      color: var(--text);
      line-height: 1;
    }

    .card-unit {
      font-size: 12px;
      color: var(--muted);
      margin-top: 5px;
    }

    /* Divider */
    .divider {
      border: none;
      border-top: 0.5px solid var(--border);
      margin: 14px 0;
    }

    /* Alert card */
    .alert-card {
      background: var(--danger-bg);
      border: 0.5px solid var(--danger-border);
      border-radius: 10px;
      padding: 14px 16px;
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .alert-dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: var(--danger-text);
      flex-shrink: 0;
    }

    .alert-label {
      font-size: 13px;
      color: var(--danger-text);
    }

    .alert-value {
      font-size: 20px;
      font-weight: 700;
      color: var(--danger-text);
      margin-left: auto;
    }

    /* Hint */
    .hint {
      font-size: 13px;
      color: var(--muted);
      text-align: center;
      margin-top: 1.5rem;
    }
  </style>
</head>
<body>

  <div class="dash">

    <div class="header">
      <div class="icon-box">
        <svg viewBox="0 0 24 24">
          <rect x="3" y="3" width="7" height="7" rx="1"/>
          <rect x="14" y="3" width="7" height="7" rx="1"/>
          <rect x="3" y="14" width="7" height="7" rx="1"/>
          <rect x="14" y="14" width="7" height="7" rx="1"/>
        </svg>
      </div>
      <div>
        <div class="h-title">관리자 대시보드</div>
        <div class="h-sub">ADMIN PANEL</div>
      </div>
    </div>

    <div class="grid">
      <div class="card">
			  <div class="card-label">신규 회원 <span style="font-size:10px; color:var(--muted);">(7일)</span></div>
			  <div class="card-value">${memberCnt}</div>
			  <div class="card-unit">명</div>
			</div>
      <div class="card">
        <div class="card-label">방명록 새글</div>
        <div class="card-value">${guestCnt}</div>
        <div class="card-unit">건</div>
      </div>
      <div class="card">
        <div class="card-label">게시판 새글</div>
        <div class="card-value">${boardCnt}</div>
        <div class="card-unit">건</div>
      </div>
    </div>

    <hr class="divider"/>

<div class="alert-card">
    <div class="alert-dot"></div>
    <div class="alert-label">탈퇴 신청 중인 회원</div>
    <div class="alert-value">${memberDeleteCnt} 명</div>
</div>

<%-- ✅ 탈퇴 회원 목록 바로 표시 --%>
<c:if test="${not empty deleteMemberList}">
    <div style="margin-top: 10px;">
        <c:forEach var="vo" items="${deleteMemberList}">
            <div style="
                background: var(--bg2);
                border: 0.5px solid var(--danger-border);
                border-radius: 10px;
                padding: 12px 16px;
                margin-top: 8px;
                display: flex;
                justify-content: space-between;
                align-items: center;">
                <span style="color: var(--danger-text); font-weight: 600;">${vo.mid}</span>
                <span style="color: var(--muted); font-size: 12px;">${vo.nickName}</span>
                <span style="color: var(--muted); font-size: 12px;">${vo.deleteDate}</span>
            </div>
        </c:forEach>
    </div>
</c:if>

    <div class="hint">왼쪽 메뉴에서 항목을 선택하세요</div>

  </div>

</body>
</html>
