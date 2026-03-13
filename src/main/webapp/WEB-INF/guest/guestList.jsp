<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLine", "\n");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>guestList.jsp</title>
<%@ include file="/include/bs5.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctp}/css/orangeLink.css" />
<script>
    function deleteCheck(idx) {
        let ans = confirm("현재 게시글을 삭제하시겠습니까?");
        if (ans)
            location.href = "GuestDelete.gu?idx=" + idx;
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
    <jsp:include page="/include/header.jsp" />
    <jsp:include page="/include/nav.jsp" />
    <p><br /></p>
    <div class="container">
        <h2 class="text-center mb-3">방 명 록 리 스 트</h2>
        <table class="table table-borderless m-0 p-0">
            <tr>
                <td class="text-start">
                    <a href="GuestInput.gu" class="btn btn-success btn-sm">글쓰기</a>
                    <c:if test="${empty sAdmin}">
                        <a href="GuestAdmin.gu" class="btn btn-primary btn-sm">관리자</a>
                    </c:if>
                    <c:if test="${!empty sAdmin}">
                        <a href="GuestAdminLogout.gu" class="btn btn-primary btn-sm">관리자 로그아웃</a>
                    </c:if>
                </td>
                <td class="text-end">
                    <c:choose>
                        <c:when test="${currentPage <= 1}">
                            <a class="btn btn-success btn-sm disabled">이전페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a href="GuestList.gu?page=1" class="btn btn-success btn-sm">첫페이지</a>
                            <a href="GuestList.gu?page=${currentPage - 1}" class="btn btn-success btn-sm">이전페이지</a>
                        </c:otherwise>
                    </c:choose>
                    <b>${currentPage}</b> / ${totalPage}
                    <c:choose>
                        <c:when test="${currentPage >= totalPage}">
                            <a class="btn btn-primary btn-sm disabled">다음페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a href="GuestList.gu?page=${currentPage + 1}" class="btn btn-primary btn-sm">다음페이지</a>
                            <a href="GuestList.gu?page=${totalPage}" class="btn btn-primary btn-sm">마지막페이지</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>

        <c:forEach var="vo" items="${vos}" varStatus="st">
            <table class="table table-borderless m-0 p-0">
                <tr>
                    <td>
                        번호 : ${totalCount - start - st.index} &nbsp;
                        <c:if test="${!empty sAdmin}">
                            <a href="javascript:deleteCheck(${vo.idx})" class="badge bg-danger">삭제</a>
                        </c:if>
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
                            <c:otherwise>
                                ${vo.email}
                            </c:otherwise>
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
                    <td colspan="3" style="height: 180px">${fn:replace(vo.content, newLine, "<br/>")}</td>
                </tr>
            </table>
        </c:forEach>

        <!-- 하단 페이지네이션 -->
        <div class="d-flex justify-content-center mt-2">
            <ul class="pagination">

                <!-- 처음 -->
                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                    <c:choose>
                        <c:when test="${currentPage <= 1}">
                            <a class="page-link">처음</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="GuestList.gu?page=1">처음</a>
                        </c:otherwise>
                    </c:choose>
                </li>

                <!-- 이전 -->
                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                    <c:choose>
                        <c:when test="${currentPage <= 1}">
                            <a class="page-link">이전</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="GuestList.gu?page=${currentPage - 1}">이전</a>
                        </c:otherwise>
                    </c:choose>
                </li>

                <!-- 페이지 번호 -->
                <c:forEach var="i" begin="${(curBlock * scrSize) + 1}" end="${(curBlock * scrSize) + scrSize}">
                    <c:if test="${i <= totalPage}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <li class="page-item active"><a class="page-link">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="GuestList.gu?page=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <!-- 다음 -->
                <li class="page-item ${currentPage >= totalPage ? 'disabled' : ''}">
                    <c:choose>
                        <c:when test="${currentPage >= totalPage}">
                            <a class="page-link">다음</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="GuestList.gu?page=${currentPage + 1}">다음</a>
                        </c:otherwise>
                    </c:choose>
                </li>

                <!-- 마지막 -->
                <li class="page-item ${currentPage >= totalPage ? 'disabled' : ''}">
                    <c:choose>
                        <c:when test="${currentPage >= totalPage}">
                            <a class="page-link">마지막</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="GuestList.gu?page=${totalPage}">마지막</a>
                        </c:otherwise>
                    </c:choose>
                </li>

            </ul>
        </div>
    </div>
    <p><br /></p>
    <jsp:include page="/include/footer.jsp" />
</body>
</html>