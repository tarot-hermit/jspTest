<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>memberList.jsp</title>
<%@ include file="/include/bs5.jsp"%>
<style>
:root {
		--primary: #1a1a2e;
		--accent: #e94560;
		--surface: #16213e;
		--card: #0f3460;
		--text: #eaeaea;
		--muted: #a0a0b0;
}

body {
		background-color: var(--primary);
		color: var(--text);
		font-family: 'Segoe UI', sans-serif;
}

.page-title {
		font-size: 1.8rem;
		font-weight: 700;
		letter-spacing: 6px;
		color: var(--text);
		position: relative;
		display: inline-block;
}

.page-title::after {
		content: '';
		display: block;
		width: 60px;
		height: 3px;
		background: var(--accent);
		margin: 8px auto 0;
		border-radius: 2px;
}

.member-table-wrapper {
		background: var(--surface);
		border-radius: 16px;
		overflow: hidden;
		box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
		border: 1px solid rgba(255, 255, 255, 0.05);
}

.member-table {
		width: 100%;
		border-collapse: collapse;
		font-size: 0.875rem;
}

.member-table thead {
		background: var(--card);
}

.member-table thead th {
		padding: 14px 16px;
		text-align: center;
		color: var(--accent);
		font-weight: 600;
		letter-spacing: 1px;
		font-size: 0.78rem;
		text-transform: uppercase;
		border-bottom: 2px solid rgba(233, 69, 96, 0.3);
		white-space: nowrap;
}

.member-table tbody tr {
		border-bottom: 1px solid rgba(255, 255, 255, 0.04);
		transition: background 0.2s;
}

.member-table tbody tr:hover {
		background: rgba(233, 69, 96, 0.07);
		cursor: pointer;
}

.member-table tbody td {
		padding: 12px 16px;
		text-align: center;
		color: var(--text);
		vertical-align: middle;
		white-space: nowrap;
}

.badge-level {
		display: inline-block;
		padding: 3px 10px;
		border-radius: 20px;
		font-size: 0.75rem;
		font-weight: 600;
		background: rgba(233, 69, 96, 0.15);
		color: var(--accent);
		border: 1px solid rgba(233, 69, 96, 0.3);
}

.badge-active {
		background: rgba(46, 213, 115, 0.15);
		color: #2ed573;
		border-color: rgba(46, 213, 115, 0.3);
}

.badge-del {
		background: rgba(255, 71, 87, 0.15);
		color: #ff4757;
		border-color: rgba(255, 71, 87, 0.3);
}

.member-photo {
		width: 38px;
		height: 38px;
		border-radius: 50%;
		object-fit: cover;
		border: 2px solid var(--accent);
}

.stat-chip {
		background: rgba(255, 255, 255, 0.06);
		border-radius: 8px;
		padding: 2px 8px;
		font-size: 0.8rem;
		color: var(--muted);
}

.idx-num {
		color: var(--muted);
		font-size: 0.78rem;
}

.empty-state {
		padding: 60px 20px;
		text-align: center;
		color: var(--muted);
}

.summary-bar {
		font-size: 0.85rem;
		color: var(--muted);
}

.summary-bar span {
		color: var(--accent);
		font-weight: 600;
}

/* ── 페이징 스타일 ── */
.paging-wrap {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 6px;
		margin-top: 28px;
}

.paging-wrap a, .paging-wrap span {
		display: inline-flex;
		align-items: center;
		justify-content: center;
		width: 36px;
		height: 36px;
		border-radius: 8px;
		font-size: 0.85rem;
		font-weight: 600;
		text-decoration: none;
		transition: all 0.2s;
}

.paging-wrap a {
		background: var(--surface);
		color: var(--muted);
		border: 1px solid rgba(255, 255, 255, 0.08);
}

.paging-wrap a:hover {
		background: var(--card);
		color: var(--text);
		border-color: var(--accent);
}

.paging-wrap span.current {
		background: var(--accent);
		color: #fff;
		border: 1px solid var(--accent);
}

.paging-wrap a.arrow {
		color: var(--accent);
		font-size: 1rem;
}

.paging-wrap a.disabled {
		opacity: 0.3;
		pointer-events: none;
}

/* ── 모달 스타일 ── */
.member-modal-overlay {
		display: none;
		position: fixed;
		inset: 0;
		z-index: 9999;
		background: rgba(10, 10, 20, 0.85);
		backdrop-filter: blur(6px);
		-webkit-backdrop-filter: blur(6px);
		align-items: center;
		justify-content: center;
}

.member-modal-overlay.active {
		display: flex;
		animation: fadeIn 0.22s ease;
}

@keyframes fadeIn {
		from { opacity: 0; }
		to   { opacity: 1; }
}

.member-modal {
		background: var(--surface);
		border: 1px solid rgba(255, 255, 255, 0.08);
		border-radius: 20px;
		width: 100%;
		max-width: 560px;
		max-height: 90vh;
		overflow-y: auto;
		box-shadow: 0 24px 80px rgba(0, 0, 0, 0.6), 0 0 0 1px rgba(233,69,96,0.15);
		animation: slideUp 0.28s cubic-bezier(.22,1,.36,1);
		position: relative;
}

@keyframes slideUp {
		from { transform: translateY(40px); opacity: 0; }
		to   { transform: translateY(0);    opacity: 1; }
}

/* 모달 헤더 */
.modal-header-custom {
		position: relative;
		background: var(--card);
		border-radius: 20px 20px 0 0;
		padding: 32px 28px 24px;
		display: flex;
		align-items: center;
		gap: 20px;
		border-bottom: 1px solid rgba(255,255,255,0.06);
}

.modal-avatar {
		width: 80px;
		height: 80px;
		border-radius: 50%;
		object-fit: cover;
		border: 3px solid var(--accent);
		box-shadow: 0 0 0 5px rgba(233,69,96,0.15);
		flex-shrink: 0;
}

.modal-header-info h3 {
		margin: 0 0 4px;
		font-size: 1.25rem;
		font-weight: 700;
		color: var(--text);
}

.modal-header-info .modal-mid {
		font-size: 0.82rem;
		color: var(--muted);
		letter-spacing: 0.5px;
}

.modal-close-btn {
		position: absolute;
		top: 16px;
		right: 18px;
		background: rgba(255,255,255,0.06);
		border: none;
		color: var(--muted);
		width: 32px;
		height: 32px;
		border-radius: 8px;
		font-size: 1.1rem;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
		transition: all 0.18s;
		line-height: 1;
}

.modal-close-btn:hover {
		background: var(--accent);
		color: #fff;
}

/* 모달 바디 */
.modal-body-custom {
		padding: 24px 28px;
}

.info-section-title {
		font-size: 0.7rem;
		letter-spacing: 2px;
		text-transform: uppercase;
		color: var(--accent);
		font-weight: 700;
		margin-bottom: 12px;
		padding-bottom: 6px;
		border-bottom: 1px solid rgba(233,69,96,0.18);
}

.info-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 10px 18px;
		margin-bottom: 22px;
}

.info-item {
		display: flex;
		flex-direction: column;
		gap: 3px;
}

.info-label {
		font-size: 0.7rem;
		color: var(--muted);
		letter-spacing: 0.5px;
}

.info-value {
		font-size: 0.88rem;
		color: var(--text);
		font-weight: 500;
}

.info-value.accent { color: var(--accent); }

.stat-row {
		display: flex;
		gap: 10px;
		margin-bottom: 22px;
}

.stat-card {
		flex: 1;
		background: rgba(255,255,255,0.04);
		border: 1px solid rgba(255,255,255,0.07);
		border-radius: 12px;
		padding: 14px 12px;
		text-align: center;
}

.stat-card .s-val {
		font-size: 1.25rem;
		font-weight: 700;
		color: var(--accent);
		line-height: 1;
}

.stat-card .s-lbl {
		font-size: 0.7rem;
		color: var(--muted);
		margin-top: 4px;
}

/* 모달 푸터 */
.modal-footer-custom {
		padding: 16px 28px 24px;
		display: flex;
		justify-content: flex-end;
		gap: 10px;
}

.btn-modal-detail {
		background: var(--accent);
		color: #fff;
		border: none;
		border-radius: 10px;
		padding: 9px 22px;
		font-size: 0.85rem;
		font-weight: 600;
		cursor: pointer;
		transition: opacity 0.18s;
		text-decoration: none;
		display: inline-flex;
		align-items: center;
		gap: 6px;
}

.btn-modal-detail:hover { opacity: 0.85; color: #fff; }

.btn-modal-close-footer {
		background: rgba(255,255,255,0.07);
		color: var(--muted);
		border: 1px solid rgba(255,255,255,0.1);
		border-radius: 10px;
		padding: 9px 22px;
		font-size: 0.85rem;
		font-weight: 600;
		cursor: pointer;
		transition: all 0.18s;
}

.btn-modal-close-footer:hover {
		background: rgba(255,255,255,0.13);
		color: var(--text);
}

/* 비공개 모달 */
.private-modal-body {
		padding: 48px 28px;
		text-align: center;
		color: var(--muted);
}

.private-modal-body .lock-icon {
		font-size: 2.8rem;
		margin-bottom: 14px;
		opacity: 0.6;
}

.private-modal-body p {
		font-size: 0.9rem;
		line-height: 1.6;
}

/* 스크롤바 */
.member-modal::-webkit-scrollbar { width: 5px; }
.member-modal::-webkit-scrollbar-track { background: transparent; }
.member-modal::-webkit-scrollbar-thumb { background: rgba(233,69,96,0.35); border-radius: 10px; }
</style>
</head>
<body>
		<jsp:include page="/include/header.jsp" />
		<jsp:include page="/include/nav.jsp" />

		<div class="container my-5">
				<div class="text-center mb-4">
						<h2 class="page-title">전 체 회 원 리 스 트</h2>
				</div>

				<div class="d-flex justify-content-between align-items-center mb-3 px-1">
						<p class="summary-bar mb-0">
								총 <span>${totalCount}</span> 명의 회원 &nbsp;|&nbsp; 페이지 <span>${currentPage}</span>
								/ <span>${totalPage}</span>
						</p>
				</div>

				<div class="member-table-wrapper">
						<table class="member-table">
								<thead>
										<tr>
												<th>No</th>
												<th>사진</th>
												<th>아이디</th>
												<th>닉네임</th>
												<th>이름</th>
												<th>성별</th>
												<th>생년월일</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>직업</th>
												<th>포인트</th>
												<th>레벨</th>
												<th>게시글</th>
												<th>가입일</th>
												<th>최근접속</th>
												<th>상태</th>
										</tr>
								</thead>
								<tbody>
										<c:choose>
												<c:when test="${empty vos}">
														<tr>
																<td colspan="16">
																		<div class="empty-state">등록된 회원이 없습니다.</div>
																</td>
														</tr>
												</c:when>
												<c:otherwise>
														<c:forEach var="vo" items="${vos}" varStatus="st">

																<%-- ── 공개 회원 행 ── --%>
																<c:choose>
																		<c:when test="${vo.userInfor == '공개' || sessionScope.sLevel == 0}">
																				<tr class="member-row" style="cursor:pointer;"
																						data-idx="${vo.idx}"
																						data-mid="${vo.mid}"
																						data-nickname="${vo.nickName}"
																						data-name="${vo.name}"
																						data-gender="${vo.gender}"
																						data-birthday="${fn:substring(vo.birthday, 0, 10)}"
																						data-tel="${vo.tel}"
																						data-email="${vo.email}"
																						data-job="${vo.job}"
																						data-point="${vo.point}"
																						data-level="${vo.level}"
																						data-visitcnt="${vo.visitCnt}"
																						data-startdate="${vo.startDate}"
																						data-lastdate="${vo.lastDate}"
																						data-userdel="${vo.userDel}"
																						data-userinfor="${vo.userInfor}"
																						data-photo="${not empty vo.photo ? vo.photo : ''}">
																				<td class="idx-num">${vo.idx}</td>
																				<td><c:choose>
																								<c:when test="${not empty vo.photo}">
																										<img src="${ctp}/images/member/${vo.photo}" class="member-photo" alt="사진" />
																								</c:when>
																								<c:otherwise>
																										<img src="${ctp}/images/member/noimage.jpg" class="member-photo" alt="기본사진" />
																								</c:otherwise>
																						</c:choose></td>
																				<td><strong>${vo.mid}</strong></td>
																				<td>
																						${vo.nickName}
																						<c:if test="${vo.userInfor != '공개'}">
																								<span class="badge-level" style="font-size:0.7rem;">비공개</span>
																						</c:if>
																				</td>
																				<td>${vo.name}</td>
																				<td><c:choose>
																								<c:when test="${vo.gender eq '남자'}">남자</c:when>
																								<c:when test="${vo.gender eq '여자'}">여자</c:when>
																								<c:otherwise>-</c:otherwise>
																						</c:choose></td>
																				<td class="stat-chip">${fn:substring(vo.birthday, 0, 10)}</td>
																				<td>${vo.tel}</td>
																				<td>${vo.email}</td>
																				<td>${vo.job}</td>
																				<td><span class="stat-chip">${vo.point}p</span></td>
																				<td><span class="badge-level">Lv.${vo.level}</span></td>
																				<td><span class="stat-chip">${vo.visitCnt}</span></td>
																				<td class="idx-num">${vo.startDate}</td>
																				<td class="idx-num">${vo.lastDate}</td>
																				<td><c:choose>
																								<c:when test="${vo.userDel eq 'N'}">
																										<span class="badge-level badge-active">정상</span>
																								</c:when>
																								<c:otherwise>
																										<span class="badge-level badge-del">탈퇴</span>
																								</c:otherwise>
																						</c:choose></td>
																				</tr>
																		</c:when>

																		<%-- ── 비공개 회원 (일반 사용자) 행 ── --%>
																		<c:otherwise>
																				<tr class="member-row private-row" style="cursor:pointer;"
																						data-private="true"
																						data-nickname="${vo.nickName}">
																						<td class="idx-num">${vo.idx}</td>
																						<td colspan="15" class="text-center" style="color: var(--muted);">
																								${vo.nickName} &nbsp;
																								<span class="badge-level" style="font-size: 0.7rem;">비공개</span>
																						</td>
																				</tr>
																		</c:otherwise>
																</c:choose>

														</c:forEach>
												</c:otherwise>
										</c:choose>
								</tbody>
						</table>
				</div>

				<%-- ── 페이징 버튼 ── --%>
				<div class="paging-wrap">
						<c:choose>
								<c:when test="${curBlock > 0}">
										<a href="${ctp}/MemberList.mem?page=${(curBlock - 1) * scrSize + 1}" class="arrow">&#171;</a>
								</c:when>
								<c:otherwise>
										<a class="arrow disabled">&#171;</a>
								</c:otherwise>
						</c:choose>
						<c:choose>
								<c:when test="${currentPage > 1}">
										<a href="${ctp}/MemberList.mem?page=${currentPage - 1}" class="arrow">&#8249;</a>
								</c:when>
								<c:otherwise>
										<a class="arrow disabled">&#8249;</a>
								</c:otherwise>
						</c:choose>
						<c:forEach begin="${curBlock * scrSize + 1}" end="${(curBlock + 1) * scrSize}" var="p">
								<c:if test="${p <= totalPage}">
										<c:choose>
												<c:when test="${p == currentPage}">
														<span class="current">${p}</span>
												</c:when>
												<c:otherwise>
														<a href="${ctp}/MemberList.mem?page=${p}">${p}</a>
												</c:otherwise>
										</c:choose>
								</c:if>
						</c:forEach>
						<c:choose>
								<c:when test="${currentPage < totalPage}">
										<a href="${ctp}/MemberList.mem?page=${currentPage + 1}" class="arrow">&#8250;</a>
								</c:when>
								<c:otherwise>
										<a class="arrow disabled">&#8250;</a>
								</c:otherwise>
						</c:choose>
						<c:choose>
								<c:when test="${curBlock < lastBlock}">
										<a href="${ctp}/MemberList.mem?page=${(curBlock + 1) * scrSize + 1}" class="arrow">&#187;</a>
								</c:when>
								<c:otherwise>
										<a class="arrow disabled">&#187;</a>
								</c:otherwise>
						</c:choose>
				</div>
		</div>

	
		<div class="member-modal-overlay" id="memberModalOverlay">
				<div class="member-modal" id="memberModal">

						<%-- 헤더: JS로 동적 채움 --%>
						<div class="modal-header-custom" id="modalHeader">
								<button class="modal-close-btn" id="modalCloseBtn" title="닫기">✕</button>
								<img id="modalPhoto" class="modal-avatar" src="" alt="프로필" />
								<div class="modal-header-info">
										<h3 id="modalNickname"></h3>
										<div class="modal-mid" id="modalMid"></div>
										<div style="margin-top:8px;" id="modalStatusBadge"></div>
								</div>
						</div>

						<%-- 바디: 공개 회원 정보 --%>
						<div class="modal-body-custom" id="modalBodyPublic">

								<%-- 통계 카드 --%>
								<div class="stat-row" id="modalStatRow">
										<div class="stat-card">
												<div class="s-val" id="modalPoint">-</div>
												<div class="s-lbl">포인트</div>
										</div>
										<div class="stat-card">
												<div class="s-val" id="modalLevel">-</div>
												<div class="s-lbl">레벨</div>
										</div>
										<div class="stat-card">
												<div class="s-val" id="modalVisit">-</div>
												<div class="s-lbl">방문수</div>
										</div>
								</div>

								<%-- 개인 정보 --%>
								<div class="info-section-title">개인 정보</div>
								<div class="info-grid">
										<div class="info-item">
												<span class="info-label">이름</span>
												<span class="info-value" id="modalName">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">성별</span>
												<span class="info-value" id="modalGender">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">생년월일</span>
												<span class="info-value" id="modalBirthday">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">직업</span>
												<span class="info-value" id="modalJob">-</span>
										</div>
								</div>

								<%-- 연락처 정보 --%>
								<div class="info-section-title">연락처</div>
								<div class="info-grid">
										<div class="info-item">
												<span class="info-label">전화번호</span>
												<span class="info-value" id="modalTel">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">이메일</span>
												<span class="info-value" id="modalEmail">-</span>
										</div>
								</div>

								<%-- 계정 정보 --%>
								<div class="info-section-title">계정 정보</div>
								<div class="info-grid">
										<div class="info-item">
												<span class="info-label">가입일</span>
												<span class="info-value" id="modalStartDate">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">최근 접속</span>
												<span class="info-value" id="modalLastDate">-</span>
										</div>
										<div class="info-item">
												<span class="info-label">공개 여부</span>
												<span class="info-value" id="modalInfor">-</span>
										</div>
								</div>
						</div>

						<%-- 바디: 비공개 안내 (기본 숨김) --%>
						<div class="private-modal-body" id="modalBodyPrivate" style="display:none;">
								<div class="lock-icon">🔒</div>
								<p>이 회원은 정보를 <strong>비공개</strong>로 설정했습니다.<br>닉네임 외 상세 정보를 확인할 수 없습니다.</p>
						</div>

						<%-- 푸터 --%>
						<div class="modal-footer-custom">
								<button class="btn-modal-close-footer" id="modalFooterCloseBtn">닫기</button>
								<a href="#" class="btn-modal-detail" id="modalDetailLink">
										상세 페이지 &rarr;
								</a>
						</div>

				</div>
		</div>

		<jsp:include page="/include/footer.jsp" />

		<script>
		(function () {
				var ctp = '${ctp}';
				var defaultPhoto = ctp + '/images/member/noimage.jpg';

				var overlay    = document.getElementById('memberModalOverlay');
				var closeBtn   = document.getElementById('modalCloseBtn');
				var footerClose= document.getElementById('modalFooterCloseBtn');

				/* ── 모달 열기 ── */
				function openModal(row) {
						var isPrivate = row.dataset.private === 'true';

						/* 비공개 처리 */
						document.getElementById('modalBodyPublic').style.display  = isPrivate ? 'none' : 'block';
						document.getElementById('modalBodyPrivate').style.display = isPrivate ? 'block' : 'none';
						document.getElementById('modalDetailLink').style.display  = isPrivate ? 'none' : 'inline-flex';

						var nickname = row.dataset.nickname || '-';
						document.getElementById('modalNickname').textContent = nickname;

						if (isPrivate) {
								document.getElementById('modalMid').textContent = '비공개 회원';
								document.getElementById('modalStatusBadge').innerHTML =
										'<span class="badge-level" style="font-size:0.75rem;">비공개</span>';
								var photo = document.getElementById('modalPhoto');
								photo.src = defaultPhoto;
								overlay.classList.add('active');
								return;
						}

						var d = row.dataset;

						var photo = document.getElementById('modalPhoto');
						photo.src = d.photo ? ctp + '/images/member/' + d.photo : defaultPhoto;

						document.getElementById('modalMid').textContent = '@' + (d.mid || '');

						var userDel = d.userdel;
						var badgeHtml = userDel === 'N'
								? '<span class="badge-level badge-active">정상</span>'
								: '<span class="badge-level badge-del">탈퇴</span>';
						if (d.userinfor && d.userinfor !== '공개') {
								badgeHtml += ' <span class="badge-level" style="font-size:0.7rem;margin-left:4px;">비공개</span>';
						}
						document.getElementById('modalStatusBadge').innerHTML = badgeHtml;

						/* 통계 */
						document.getElementById('modalPoint').textContent = (d.point || '0') + 'p';
						document.getElementById('modalLevel').textContent = 'Lv.' + (d.level || '0');
						document.getElementById('modalVisit').textContent = d.visitcnt || '0';

						/* 개인 */
						document.getElementById('modalName').textContent    = d.name     || '-';
						document.getElementById('modalGender').textContent  = d.gender   || '-';
						document.getElementById('modalBirthday').textContent= d.birthday || '-';
						document.getElementById('modalJob').textContent     = d.job      || '-';

						/* 연락처 */
						document.getElementById('modalTel').textContent   = d.tel   || '-';
						document.getElementById('modalEmail').textContent  = d.email || '-';

						/* 계정 */
						document.getElementById('modalStartDate').textContent = d.startdate || '-';
						document.getElementById('modalLastDate').textContent  = d.lastdate  || '-';
						document.getElementById('modalInfor').textContent     = d.userinfor || '-';

						/* 상세 페이지 링크 */
						document.getElementById('modalDetailLink').href =
								ctp + '/member/memberDetail.do?idx=' + (d.idx || '');

						overlay.classList.add('active');
						document.body.style.overflow = 'hidden';
				}

				/* ── 모달 닫기 ── */
				function closeModal() {
						overlay.classList.remove('active');
						document.body.style.overflow = '';
				}

				/* ── 이벤트 바인딩 ── */
				document.querySelectorAll('.member-row').forEach(function (row) {
						row.addEventListener('click', function () { openModal(row); });
				});

				closeBtn.addEventListener('click', closeModal);
				footerClose.addEventListener('click', closeModal);

				/* 오버레이 클릭 시 닫기 */
				overlay.addEventListener('click', function (e) {
						if (e.target === overlay) closeModal();
				});

				/* ESC 키로 닫기 */
				document.addEventListener('keydown', function (e) {
						if (e.key === 'Escape') closeModal();
				});
		})();
		</script>
</body>
</html>
