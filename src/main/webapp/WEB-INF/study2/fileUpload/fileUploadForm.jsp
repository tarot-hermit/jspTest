<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>fileUploadForm.jsp</title>
    <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
    <h2>fileUpload 연습</h2>
    <hr/>
    <h4>COS라이브러리를 이용한 파일 업로드</h4>
    <div>(https://www.servlets.com/cos/)</div>
    <p><br/></p>

    <c:if test="${not empty errorList}">
        <div class="alert alert-danger w-50">
            <c:forEach var="msg" items="${errorList}">
                <div>${msg}</div>
            </c:forEach>
        </div>
    </c:if>

    <form action="${ctp}/FileUpload1Ok.st" method="post" enctype="multipart/form-data"
          onsubmit="return validateForm()">
        <table class="table table-bordered w-50">
            <tr>
                <th class="table-secondary">제목</th>
                <td>
                    <input type="text" name="title" class="form-control"
                           value="${title}" placeholder="제목 입력"/>
                </td>
            </tr>
            <tr>
                <th class="table-secondary">작성자</th>
                <td>
                    <input type="text" name="writer" class="form-control"
                           value="${writer}" placeholder="작성자 입력"/>
                </td>
            </tr>
            <tr>
                <th class="table-secondary">파일선택</th>
                <td>
                    <input type="file" name="uploadFile" class="form-control"/>
                </td>
            </tr>
        </table>
        <button type="submit" class="btn btn-primary">업로드</button>
        <button type="reset" class="btn btn-secondary">초기화</button>
    </form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
<script>
function validateForm() {
    var title = document.querySelector("input[name='title']").value.trim();
    var writer = document.querySelector("input[name='writer']").value.trim();
    var fileInput = document.querySelector("input[name='uploadFile']");
    var fName = fileInput.value;

    if (title === "") {
        alert("제목을 입력해주세요.");
        document.querySelector("input[name='title']").focus();
        return false;
    }
    if (writer === "") {
        alert("작성자를 입력해주세요.");
        document.querySelector("input[name='writer']").focus();
        return false;
    }
    if (fName === "") {
        alert("파일을 선택해주세요.");
        return false;
    }

    // 파일 용량 체크
    var maxSize = 1024 * 1024 * 10; // 10MB
    if (fileInput.files[0].size > maxSize) {
        alert("파일 크기는 10MB 이하만 업로드 가능합니다.");
        return false;
    }

    // 파일 확장자 체크
    var ext = fName.substring(fName.lastIndexOf(".") + 1).toLowerCase();
    var allowExt = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "hwp", "ppt", "xls", "txt"];
    if (allowExt.indexOf(ext) === -1) {
        alert("허용된 파일 형식이 아닙니다.\n허용 형식 : " + allowExt.join(", "));
        return false;
    }

    return true;
}

</script>
</html>