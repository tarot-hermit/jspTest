<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMain.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Black+Han+Sans&display=swap');

    body {
      background: #0f0f13;
      color: #e8e8f0;
      font-family: 'Noto Sans KR', sans-serif;
      min-height: 100vh;
    }

    .main-wrapper {
      padding: 50px 20px 80px;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 24px;
    }

    .glass-card {
      width: 100%;
      max-width: 760px;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      border: 1px solid rgba(99,179,237,0.15);
      border-radius: 24px;
      padding: 44px 48px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 0 60px rgba(99,179,237,0.06), 0 30px 80px rgba(0,0,0,0.5);
      animation: fadeUp 0.5s ease-out both;
    }
    .glass-card:nth-child(2) { animation-delay: 0.15s; }

    @keyframes fadeUp {
      from { opacity:0; transform:translateY(20px); }
      to   { opacity:1; transform:translateY(0); }
    }

    .glass-card::before {
      content:'';
      position:absolute; top:-80px; right:-80px;
      width:260px; height:260px;
      background:radial-gradient(circle, rgba(99,179,237,0.1) 0%, transparent 70%);
      border-radius:50%; pointer-events:none;
    }

    .welcome-badge {
      display:inline-flex; align-items:center; gap:8px;
      background:rgba(99,179,237,0.1);
      border:1px solid rgba(99,179,237,0.3);
      border-radius:100px; padding:6px 16px;
      font-size:11px; color:#63b3ed;
      letter-spacing:1.5px; text-transform:uppercase;
      margin-bottom:24px;
    }
    .dot {
      width:6px; height:6px;
      background:#63b3ed; border-radius:50%;
      animation: blink 1.8s infinite;
    }
    @keyframes blink {
      0%,100%{ opacity:1; } 50%{ opacity:0.2; }
    }

    .nickname {
      font-family:'Black Han Sans', sans-serif;
      font-size:38px; color:#fff;
      line-height:1.1; margin-bottom:6px;
    }
    .nickname span {
      background:linear-gradient(90deg,#63b3ed,#9a75ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      background-clip:text;
    }

    .member-id {
      font-size:13px; color:rgba(255,255,255,0.35);
      margin-bottom:36px;
    }
    .member-id code {
      background:rgba(255,255,255,0.06);
      border-radius:6px; padding:2px 10px;
      color:rgba(255,255,255,0.45);
    }

    .divider {
      height:1px;
      background:linear-gradient(90deg,transparent,rgba(99,179,237,0.25),transparent);
      margin-bottom:32px;
    }

    .info-grid {
      display:grid; grid-template-columns:1fr 1fr;
      gap:14px; margin-bottom:32px;
    }
    .info-item {
      background:rgba(255,255,255,0.04);
      border:1px solid rgba(255,255,255,0.07);
      border-radius:14px; padding:18px 20px;
      transition:all 0.2s;
    }
    .info-item:hover {
      background:rgba(99,179,237,0.06);
      border-color:rgba(99,179,237,0.2);
      transform:translateY(-2px);
    }
    .info-label {
      font-size:10px; color:rgba(255,255,255,0.3);
      text-transform:uppercase; letter-spacing:1.2px; margin-bottom:8px;
    }
    .info-value { font-size:15px; font-weight:500; }

    .level-badge {
      display:inline-flex; align-items:center; gap:6px;
      background:linear-gradient(135deg,rgba(154,117,255,0.2),rgba(99,179,237,0.2));
      border:1px solid rgba(154,117,255,0.35);
      border-radius:8px; padding:4px 12px;
      font-size:14px; font-weight:600; color:#c4a3ff;
    }
    .level-num {
      background:rgba(154,117,255,0.25);
      border-radius:4px; padding:1px 6px;
      font-size:10px; color:rgba(255,255,255,0.5);
    }
    .info-grid {
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:14px; margin-bottom:32px;
  }
  .info-item-wide {
    grid-column: 1 / -1; /* 전체 너비 */
    background:rgba(255,255,255,0.04);
    border:1px solid rgba(255,255,255,0.07);
    border-radius:14px; padding:18px 20px;
    transition:all 0.2s;
  }
  .info-item-wide:hover {
    background:rgba(255,215,0,0.06);
    border-color:rgba(255,215,0,0.25);
    transform:translateY(-2px);
  }
  .point-label {
    font-size:10px; color:rgba(255,255,255,0.3);
    text-transform:uppercase; letter-spacing:1.2px;
    margin-bottom:10px;
  }
  .point-body {
    display:flex; align-items:center;
    justify-content:space-between; gap:16px;
  }
  .point-value {
    font-size:28px; font-weight:700;
    background:linear-gradient(90deg, #f6d365, #fda085);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    background-clip:text;
    font-family:'Black Han Sans', sans-serif;
    letter-spacing:1px;
  }
  .point-value span {
    font-size:14px; font-weight:400;
    color:rgba(255,255,255,0.3);
    -webkit-text-fill-color:rgba(255,255,255,0.3);
  }
  .point-bar-wrap {
    flex:1;
  }
  .point-bar-label {
    display:flex; justify-content:space-between;
    font-size:10px; color:rgba(255,255,255,0.25);
    margin-bottom:6px;
  }
  .point-bar-bg {
    height:6px; background:rgba(255,255,255,0.07);
    border-radius:100px; overflow:hidden;
  }
  .point-bar-fill {
    height:100%;
    background:linear-gradient(90deg, #f6d365, #fda085);
    border-radius:100px;
    animation: fillBar 1s ease-out both;
    animation-delay: 0.4s;
    width: 0%;
  }
  @keyframes fillBar {
    from { width: 0%; }
    to   { width: var(--fill-width); }
  }
  .point-icon {
    font-size:28px;
    filter: drop-shadow(0 0 8px rgba(246,211,101,0.5));
  }

    .action-buttons { display:flex; gap:12px; }
    .btn-main {
      flex:1; padding:14px; border-radius:12px;
      border:none; font-family:'Noto Sans KR',sans-serif;
      font-size:13px; font-weight:500; cursor:pointer;
      transition:all 0.2s; text-decoration:none;
      text-align:center; display:inline-block;
    }
    .btn-primary-main {
      background:linear-gradient(135deg,#4299e1,#9a75ff); color:#fff;
    }
    .btn-primary-main:hover {
      transform:translateY(-2px);
      box-shadow:0 8px 24px rgba(99,179,237,0.3);
      color:#fff; text-decoration:none;
    }
    .btn-secondary-main {
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      color:rgba(255,255,255,0.55);
    }
    .btn-secondary-main:hover {
      background:rgba(255,255,255,0.09);
      color:#fff; transform:translateY(-2px); text-decoration:none;
    }

    /* 게스트 글 섹션 */
    .section-header {
      display:flex; align-items:center; gap:10px;
      margin-bottom:20px;
    }
    .section-icon {
      width:34px; height:34px;
      background:linear-gradient(135deg,rgba(99,179,237,0.2),rgba(154,117,255,0.2));
      border:1px solid rgba(99,179,237,0.2);
      border-radius:10px;
      display:flex; align-items:center; justify-content:center;
      font-size:15px;
    }
    .section-title-text {
      font-size:16px; font-weight:600; color:#e8e8f0;
    }
    .count-badge {
      margin-left:auto;
      background:rgba(99,179,237,0.1);
      border:1px solid rgba(99,179,237,0.2);
      border-radius:20px; padding:3px 12px;
      font-size:11px; color:#63b3ed;
    }

    .guest-list { display:flex; flex-direction:column; gap:10px; }

    .guest-item {
      background:rgba(255,255,255,0.03);
      border:1px solid rgba(255,255,255,0.07);
      border-radius:14px; padding:16px 20px;
      display:grid;
      grid-template-columns:38px 1fr auto;
      gap:14px; align-items:center;
      transition:all 0.2s;
    }
    .guest-item:hover {
      background:rgba(99,179,237,0.05);
      border-color:rgba(99,179,237,0.18);
      transform:translateX(4px);
    }

    .guest-num {
      width:38px; height:38px;
      background:rgba(99,179,237,0.1);
      border:1px solid rgba(99,179,237,0.2);
      border-radius:10px;
      display:flex; align-items:center; justify-content:center;
      font-size:12px; color:#63b3ed; font-weight:700;
      flex-shrink:0;
    }

    .guest-content {
      font-size:14px; color:#c8c8d8; line-height:1.5;
      overflow:hidden;
      display:-webkit-box;
      -webkit-line-clamp:2;
      -webkit-box-orient:vertical;
    }

    .guest-meta { text-align:right; flex-shrink:0; }
    .guest-date {
      font-size:11px; color:rgba(255,255,255,0.25); margin-bottom:3px;
    }
    .guest-ip { font-size:10px; color:rgba(255,255,255,0.15); }

    .empty-state {
      text-align:center; padding:50px 20px;
      color:rgba(255,255,255,0.2);
    }
    .empty-icon { font-size:42px; margin-bottom:14px; }
    .empty-state p { font-size:13px; margin:0; }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />

<div class="main-wrapper">

  <!-- 프로필 카드 -->
  <div class="glass-card">
    <div class="welcome-badge">
      <span class="dot"></span>
      로그인 중
    </div>
		<!-- 회원 사진  -->
		<div class="text-center mb-3">
    <img src="${ctp}/images/member/${sPhoto}"
         style="width:100px; height:100px; border-radius:50%;
                object-fit:cover; border:3px solid rgba(99,179,237,0.4);"/>
		</div>
		
    <div class="nickname">
      안녕하세요, <span>${sNickName}</span>님
    </div>
    <div class="member-id">
      아이디 : <code>${sMid}</code>
    </div>

    <div class="divider"></div>

   <!-- info-grid 부분 교체 -->
<div class="info-grid">
  <div class="info-item">
    <div class="info-label">현재 등급</div>
    <div class="info-value">
      <span class="level-badge">
        ${strLevel}
        <span class="level-num">Lv.${sLevel}</span>
      </span>
    </div>
  </div>

  <div class="info-item">
    <div class="info-label">회원 상태</div>
    <div class="info-value" style="color:#68d391;">● 활동중</div>
  </div>

  <!-- 포인트 카드 (전체 너비) -->
  <div class="info-item-wide">
    <div class="point-label">⭐ 누적 포인트</div>
    <div class="point-body">
      <div class="point-icon">🪙</div>
      <div>
        <div class="point-value">
          ${sPoint} <span>pt</span>
        </div>
      </div>
      <div class="point-bar-wrap">
        <div class="point-bar-label">
          <span>0 pt</span>
          <span>다음 등급까지 ${1000 - sPoint} pt</span>
        </div>
        <div class="point-bar-bg">
          <div class="point-bar-fill"
               style="--fill-width: ${sPoint / 10}%">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

    <div class="action-buttons">
      <a href="${ctp}/MemberInfo.mem" class="btn-main btn-primary-main">내 정보 수정</a>
      <a href="javascript:logoutCheck()" class="btn-main btn-secondary-main">로그아웃</a>
    </div>
  </div>

  <div class="glass-card">
    <div class="section-header">
      <div class="section-icon">✍️</div>
      <span class="section-title-text">내가 작성한 게스트 글</span>
      <span class="count-badge">
        <c:choose>
          <c:when test="${not empty guestList}">${fn:length(guestList)}건</c:when>
          <c:otherwise>0건</c:otherwise>
        </c:choose>
      </span>
    </div>

    <c:choose>
      <c:when test="${empty guestList}">
        <div class="empty-state">
          <div class="empty-icon">📭</div>
          <p>작성한 게스트 글이 없습니다.</p>
        </div>
      </c:when>
      <c:otherwise>
        <div class="guest-list">
          <c:forEach var="g" items="${guestList}">
            <div class="guest-item">
              <div class="guest-num">${g.idx}</div>
              <div class="guest-content">${g.content}</div>
              <div class="guest-meta">
                <div class="guest-date">${g.visitDate}</div>
                <div class="guest-ip">${g.clientIp}</div>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

</div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>
