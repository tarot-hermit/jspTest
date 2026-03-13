<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #0d0f14;
      --surface: #141720;
      --surface2: #1a1e2a;
      --border: #252a38;
      --accent: #4f8ef7;
      --accent2: #7c5af5;
      --text: #e2e6f0;
      --muted: #5a6178;
      --hover: #1f2433;
      --active-bg: linear-gradient(135deg, #1a2a4a, #1e1a3a);
      --active-border: #4f8ef7;
    }

    html, body {
      height: 100%;
      overflow: hidden;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
      background: var(--bg);
      color: var(--text);
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    /* Header / Brand */
    .brand {
      padding: 24px 20px 20px;
      border-bottom: 1px solid var(--border);
      position: relative;
      overflow: hidden;
    }

    .brand::before {
      content: '';
      position: absolute;
      top: -30px; left: -30px;
      width: 120px; height: 120px;
      background: radial-gradient(circle, rgba(79,142,247,0.15) 0%, transparent 70%);
      pointer-events: none;
    }

    .brand-icon {
      width: 36px; height: 36px;
      background: linear-gradient(135deg, var(--accent), var(--accent2));
      border-radius: 10px;
      display: flex; align-items: center; justify-content: center;
      margin-bottom: 10px;
      box-shadow: 0 4px 15px rgba(79,142,247,0.3);
    }

    .brand-icon svg { width: 18px; height: 18px; fill: white; }

    .brand-title {
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 2px;
    }

    .brand-name {
      font-size: 15px;
      font-weight: 700;
      color: var(--text);
    }

    /* Navigation */
    .nav-container {
      flex: 1;
      overflow-y: auto;
      padding: 16px 12px;
      scrollbar-width: none;
    }
    .nav-container::-webkit-scrollbar { display: none; }

    .home-btn {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px 12px;
      border-radius: 8px;
      text-decoration: none;
      color: var(--muted);
      font-size: 13px;
      font-weight: 500;
      transition: all 0.2s ease;
      margin-bottom: 8px;
    }
    .home-btn:hover {
      background: var(--hover);
      color: var(--text);
    }
    .home-btn svg { width: 16px; height: 16px; flex-shrink: 0; }

    .nav-section {
      margin-bottom: 6px;
    }

    .nav-label {
      font-family: 'JetBrains Mono', monospace;
      font-size: 9px;
      font-weight: 600;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: var(--muted);
      padding: 12px 12px 6px;
      display: block;
    }

    .nav-item {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 9px 12px;
      border-radius: 8px;
      text-decoration: none;
      color: #8892a8;
      font-size: 13px;
      font-weight: 400;
      transition: all 0.2s ease;
      border: 1px solid transparent;
      margin-bottom: 2px;
      position: relative;
    }

    .nav-item:hover {
      background: var(--hover);
      color: var(--text);
      border-color: var(--border);
    }

    .nav-item.active {
      background: var(--active-bg);
      color: var(--accent);
      border-color: rgba(79,142,247,0.3);
    }

    .nav-item svg {
      width: 15px; height: 15px;
      flex-shrink: 0;
      opacity: 0.7;
    }

    .nav-item:hover svg, .nav-item.active svg { opacity: 1; }

    .nav-badge {
      margin-left: auto;
      background: rgba(79,142,247,0.2);
      color: var(--accent);
      font-size: 10px;
      font-weight: 600;
      padding: 1px 7px;
      border-radius: 20px;
      font-family: 'JetBrains Mono', monospace;
    }

    .divider {
      height: 1px;
      background: var(--border);
      margin: 8px 12px;
    }

    /* Footer */
    .sidebar-footer {
      padding: 14px 20px;
      border-top: 1px solid var(--border);
      background: var(--surface);
    }

    .footer-status {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .status-dot {
      width: 7px; height: 7px;
      border-radius: 50%;
      background: #22c55e;
      box-shadow: 0 0 8px rgba(34,197,94,0.6);
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.5; }
    }

    .footer-text {
      font-size: 11px;
      color: var(--muted);
      font-family: 'JetBrains Mono', monospace;
    }

    /* Slide-in animation */
    .nav-item {
      animation: slideIn 0.3s ease both;
    }
    @keyframes slideIn {
      from { opacity: 0; transform: translateX(-8px); }
      to { opacity: 1; transform: translateX(0); }
    }
    .nav-item:nth-child(1) { animation-delay: 0.05s; }
    .nav-item:nth-child(2) { animation-delay: 0.1s; }
    .nav-item:nth-child(3) { animation-delay: 0.15s; }
    .nav-item:nth-child(4) { animation-delay: 0.2s; }
  </style>
</head>
<body>

  <div class="brand">
    <div class="brand-icon">
      <svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
    </div>
    <div class="brand-title">Admin Panel</div>
    <div class="brand-name">관리자 콘솔</div>
  </div>

  <nav class="nav-container">

    <a href="${ctp}/Main" target="_top" class="home-btn">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/>
      </svg>
      홈으로 돌아가기
    </a>

    <div class="divider"></div>

    <div class="nav-section">
      <span class="nav-label">방명록</span>
      <a href="AdminGuestList.ad" target="adminRight" class="nav-item active">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/>
          <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/>
        </svg>
        방명록 리스트
        <span class="nav-badge">NEW</span>
      </a>
    </div>

    <div class="nav-section">
      <span class="nav-label">게시판</span>
      <a href="#" target="adminRight" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="3" y="3" width="18" height="18" rx="2"/><line x1="3" y1="9" x2="21" y2="9"/>
          <line x1="3" y1="15" x2="21" y2="15"/><line x1="9" y1="9" x2="9" y2="21"/>
        </svg>
        게시판 리스트
      </a>
    </div>

    <div class="nav-section">
      <span class="nav-label">회원관리</span>
      <a href="AdminMemberList.ad" target="adminRight" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/>
          <path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/>
        </svg>
        회원 리스트
      </a>
      <a href="" target="adminRight" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>
          <line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/>
        </svg>
        신고 리스트
        <span class="nav-badge" style="background:rgba(239,68,68,0.15);color:#f87171;">!</span>
      </a>
    </div>

  </nav>

  <div class="sidebar-footer">
    <div class="footer-status">
      <div class="status-dot"></div>
      <span class="footer-text">SYSTEM ONLINE</span>
    </div>
  </div>

</body>
</html>
