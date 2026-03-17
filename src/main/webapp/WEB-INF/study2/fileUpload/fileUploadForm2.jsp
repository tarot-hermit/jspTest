<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>fileUploadForm2.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';

    let fileCount = 0;

    function addFile() {
        fileCount++;
        const container = document.getElementById('fileContainer');
        const div = document.createElement('div');
        div.className = 'input-group mt-1';
        div.id = 'fileDiv' + fileCount;

        // innerHTML 대신 직접 element 생성
        const input = document.createElement('input');
        input.type = 'file';
        input.name = 'uploadFile' + fileCount;
        input.className = 'form-control';
        input.accept = '.jpg,.jpeg,.gif,.png,.xls,.xlsx,.zip,.hwp,.ppt,.pptx,.doc,.pdf,.txt';

        const btn = document.createElement('button');
        btn.type = 'button';
        btn.className = 'btn btn-danger btn-sm';
        btn.textContent = '삭제';
        btn.onclick = function() { removeFile(fileCount); };

        div.appendChild(input);
        div.appendChild(btn);
        container.appendChild(div);
    }

    function removeFile(idx) {
        const div = document.getElementById('fileDiv' + idx);
        if(div) div.remove();
    }

    function fCheck() {
        let title  = document.querySelector("input[name='title']").value.trim();
        let writer = document.querySelector("input[name='writer']").value.trim();
        let maxSize  = 1024 * 1024 * 10;
        let allowExt = ['jpg','jpeg','gif','png','xls','xlsx','zip','hwp','ppt','pptx','doc','pdf','txt'];

        if(title == "") {
            alert("제목을 입력하세요.");
            document.querySelector("input[name='title']").focus();
            return false;
        }
        if(writer == "") {
            alert("작성자를 입력하세요.");
            document.querySelector("input[name='writer']").focus();
            return false;
        }

        // 모든 file input 수집
        let fileInputs = document.querySelectorAll('input[type="file"]');
        let hasFile = false;

        for(let i = 0; i < fileInputs.length; i++) {
            if(fileInputs[i].files.length > 0) {
                hasFile = true;
                let file = fileInputs[i].files[0];
                if(file.size > maxSize) {
                    alert("[" + file.name + "] 파일 크기는 10MB 이하만 가능합니다.");
                    return false;
                }
                let ext = file.name.substring(file.name.lastIndexOf(".")+1).toLowerCase();
                if(allowExt.indexOf(ext) === -1) {
                    alert("[" + file.name + "] 허용되지 않는 형식입니다.\n허용 형식: " + allowExt.join(", "));
                    return false;
                }
            }
        }

        if(!hasFile) {
            alert("파일을 1개 이상 선택하세요.");
            return false;
        }

        document.myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>멀티 fileUpload 연습2</h2>
  <hr/>
  <h4>COS라이브러리를 이용한 다중 파일 업로드</h4>
  <div>(https://servlets.com/cos/)</div>
  <hr/>

  <c:if test="${not empty errorList}">
      <div class="alert alert-danger w-50">
          <c:forEach var="msg" items="${errorList}">
              <div>${msg}</div>
          </c:forEach>
      </div>
  </c:if>

  <form name="myform" method="post" action="FileUpload2Ok.st" enctype="multipart/form-data">
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
                <div id="fileContainer">
                    <%-- 기본 1개 --%>
                    <input type="file" name="uploadFile0" class="form-control"
                           accept=".jpg,.jpeg,.gif,.png,.xls,.xlsx,.zip,.hwp,.ppt,.pptx,.doc,.pdf,.txt"/>
                </div>
                <button type="button" onclick="addFile()" class="btn btn-secondary btn-sm mt-2">
                    파일 추가 +
                </button>
            </td>
        </tr>
    </table>
    <input type="button" value="업로드" onclick="fCheck()" class="btn btn-success"/>
    <button type="reset" class="btn btn-secondary">초기화</button>
  </form>
  <hr/>
  <div>
    <a href="FileUploadForm.st" class="btn btn-warning">돌아가기</a>
    <a href="FileDownloadForm.st" class="btn btn-primary">다운로드폼으로</a>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>