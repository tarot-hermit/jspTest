<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fileDownloadForm.jsp</title>
    <%@ include file="/include/bs5.jsp" %>
    <link rel="stylesheet" href="${ctp}/css/orangeLink.css"/>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
    <h2>fileDownload 연습</h2>
    <hr/>
    <h4>업로드된 파일 목록</h4>
    <p><br/></p>

    <form id="deleteForm" action="${ctp}/FileDelete.st" method="post">

        <table class="table table-bordered w-50">
            <tr class="table-secondary">
                <th><input type="checkbox" id="checkAll" title="전체선택"/></th>
                <th>파일명</th>
                <th>미리보기</th>
                <th>다운로드</th>
            </tr>

            <%-- 파일 없을 때 --%>
            <c:if test="${empty fileList}">
                <tr>
                    <td colspan="4" class="text-center text-muted">업로드된 파일이 없습니다.</td>
                </tr>
            </c:if>

            <%-- 파일 있을 때 --%>
            <c:if test="${not empty fileList}">
                <c:forEach var="fileName" items="${fileList}">
                    <c:set var="fNameArr" value="${fn:split(fileName, '.')}"/>
                    <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
                    <tr>
                        <td>
                            <input type="checkbox" name="deleteFiles" value="${fileName}" class="fileCheck"/>
                        </td>
                        <td>
                            ${fileName}
                            <c:if test="${not empty titleMap[fileName]}">
                                <br/><small class="text-muted">
                                    제목: ${fn:split(titleMap[fileName], '|')[0]}
                                    &nbsp;|&nbsp;
                                    작성자: ${fn:split(titleMap[fileName], '|')[1]}
                                </small>
                            </c:if>
                        </td>
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
            </c:if>

        </table>

        <button type="button" class="btn btn-danger" onclick="deleteSelected()">선택 파일 삭제</button>
        <button type="button" class="btn btn-warning" onclick="invertSelection()">선택 반전</button>
        <button type="button" class="btn btn-success" onclick="downloadSelected()">선택 파일 다운로드</button>
        <a href="${ctp}/FileUploadForm.st" class="btn btn-secondary">업로드 폼으로</a>
    </form>
</div>

<script>
    // 이미지 src 인코딩 + 클릭 시 새 탭에서 이미지 열기
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

    // 다운로드 링크 href 인코딩 처리
    document.querySelectorAll('a.download-link').forEach(a => {
        const base = a.getAttribute('data-base');
        const name = a.getAttribute('data-filename');
        a.href = base + encodeURIComponent(name);
    });

    // checkAll - 파일 없을 때도 안전하게
    const checkAll = document.getElementById('checkAll');
    if (checkAll) {
        checkAll.addEventListener('change', function () {
            document.querySelectorAll('.fileCheck').forEach(cb => cb.checked = this.checked);
        });
    }

    document.querySelectorAll('.fileCheck').forEach(cb => {
        cb.addEventListener('change', function () {
            const all = document.querySelectorAll('.fileCheck');
            const checked = document.querySelectorAll('.fileCheck:checked');
            document.getElementById('checkAll').checked = all.length === checked.length;
        });
    });

    // 선택 파일 다운로드
    function downloadSelected() {
        const checked = document.querySelectorAll('.fileCheck:checked');
        if (checked.length === 0) {
            alert('다운로드할 파일을 선택하세요.');
            return;
        }
        checked.forEach(cb => {
            const a = document.createElement('a');
            a.href = '${ctp}/FileDownload.st?fileName=' + encodeURIComponent(cb.value);
            a.download = cb.value;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        });
    }

    function deleteSelected() {
        const checked = document.querySelectorAll('.fileCheck:checked');
        if (checked.length === 0) {
            alert('삭제할 파일을 선택하세요.');
            return;
        }
        if (confirm(checked.length + '개 파일을 삭제하시겠습니까?')) {
            document.getElementById('deleteForm').submit();
        }
    }

    function invertSelection() {
        document.querySelectorAll('.fileCheck').forEach(cb => {
            cb.checked = !cb.checked;
        });
        const all = document.querySelectorAll('.fileCheck');
        const checked = document.querySelectorAll('.fileCheck:checked');
        document.getElementById('checkAll').checked = all.length === checked.length;
    }
</script>

<jsp:include page="/include/footer.jsp" />
</body>
</html>