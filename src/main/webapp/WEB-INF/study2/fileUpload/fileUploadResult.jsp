<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업로드 결과</title>
    <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
    <h2>업로드 결과</h2>
    <hr/>
    <table class="table table-bordered w-50">
        <tr>
            <th class="table-secondary">제목</th>
            <td>${title}</td>
        </tr>
        <tr>
            <th class="table-secondary">작성자</th>
            <td>${writer}</td>
        </tr>
        <tr>
            <th class="table-secondary">업로드 파일</th>
            <td>
                <%-- 다중 업로드인 경우 --%>
                <c:if test="${not empty savedNames}">
                    <c:forEach var="sName" items="${savedNames}" varStatus="st">
                        <div>${st.count}. ${originNames[st.index]} → ${sName}</div>
                    </c:forEach>
                </c:if>
                <%-- 단일 업로드인 경우 --%>
                <c:if test="${empty savedNames}">
                    ${originName} → ${savedName}
                </c:if>
            </td>
        </tr>
    </table>

    <h4>업로드된 파일 목록</h4>
    <table class="table table-bordered w-50">
        <tr class="table-secondary">
            <th>파일명</th>
            <th>미리보기</th>
            <th>다운로드</th>
        </tr>
        <c:forEach var="fileName" items="${fileList}">
            <c:set var="fNameArr" value="${fn:split(fileName, '.')}"/>
            <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
            <tr>
                <td>${fileName}</td>
                <td>
                    <c:if test="${extName == 'jpg' or extName == 'jpeg'
                               or extName == 'png' or extName == 'gif'}">
                        <img class="preview-img"
                             data-filename="${fileName}"
                             data-base="${ctp}/images/fileUpload/"
                             width="100" height="100"
                             style="object-fit:cover; cursor:pointer;"/>
                    </c:if>
                    <c:if test="${extName != 'jpg' and extName != 'jpeg'
                               and extName != 'png' and extName != 'gif'}">
                        이미지 아님
                    </c:if>
                </td>
                <td>
                    <a class="download-link btn btn-sm btn-primary"
                       data-filename="${fileName}"
                       data-base="${ctp}/FileDownload.st?fileName=">
                        [${fn:toUpperCase(extName)}] 다운로드
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="${ctp}/FileUploadForm.st" class="btn btn-secondary">돌아가기</a>
</div>

<script>
    // 이미지 src 인코딩 + 클릭 시 새 탭에서 열기
    document.querySelectorAll('img.preview-img').forEach(img => {
        const base = img.getAttribute('data-base');
        const name = img.getAttribute('data-filename');
        img.src = base + encodeURIComponent(name);

        img.addEventListener('click', function () {
            const newTab = window.open();
            newTab.document.write('<img src="' + this.src + '" style="max-width:100%;">');
            newTab.document.close();
        });
    });

    // 다운로드 링크 href 인코딩
    document.querySelectorAll('a.download-link').forEach(a => {
        const base = a.getAttribute('data-base');
        const name = a.getAttribute('data-filename');
        a.href = base + encodeURIComponent(name);
    });
</script>

<jsp:include page="/include/footer.jsp" />
</body>
</html>