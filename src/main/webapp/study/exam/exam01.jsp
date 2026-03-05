<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exam01.jsp</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body { background: #f6f7fb; }
    .page-wrap { max-width: 980px; margin: 0 auto; }
    .card-title-badge { font-size: .85rem; }
    .preview-box{
      background:#fff;
      border:1px solid rgba(0,0,0,.08);
      border-radius:16px;
      padding:14px;
      box-shadow: 0 6px 18px rgba(0,0,0,.06);
      transition: transform .15s ease, box-shadow .15s ease;
      min-height: 320px;
      display:flex;
      flex-direction: column;
      gap:10px;
    }
    .preview-box:hover{
      transform: translateY(-2px);
      box-shadow: 0 10px 24px rgba(0,0,0,.10);
    }
    .preview-label{
      display:flex;
      justify-content: space-between;
      align-items:center;
      font-size:.9rem;
      color:#495057;
    }
    .img-frame{
      flex: 1;
      border-radius:14px;
      background:#f1f3f5;
      display:flex;
      align-items:center;
      justify-content:center;
      overflow:hidden;
      border:1px dashed rgba(0,0,0,.15);
    }
    .img-frame img{
      width: 100%;
      height: 100%;
      object-fit: cover; 
      display:block;
    }
    select.form-control, select.form-select{
      border-radius: 12px;
    }
  </style>

  <script>
    
    const IMG_BASE = "<%=request.getContextPath()%>/images/";

    function setImage(fileName, targetImgId, labelId){
      const img = document.getElementById(targetImgId);
      const label = document.getElementById(labelId);

      img.src = IMG_BASE + fileName;
      if(label) label.textContent = fileName;
    }

    
    
  </script>
</head>

<body>
  <div class="container py-4">
    <div class="page-wrap">

      
      <div class="d-flex align-items-center justify-content-between mb-3">
        <div>
          <h3 class="mb-1 fw-bold">이미지 선택 미리보기</h3>
          <div class="text-muted">콤보박스 / 리스트박스로 11~20 이미지를 선택해서 미리보기 출력</div>
        </div>
        <span class="badge text-bg-primary card-title-badge px-3 py-2">exam01.jsp</span>
      </div>

      <div class="card shadow-sm border-0 rounded-4">
        <div class="card-body p-4">

          <h5 class="mb-3">
            <span class="badge text-bg-dark me-2">문제</span>
            콤보상자와 리스트박스에 11~20 파일명을 표시하고, 선택한 그림을 출력
          </h5>

          <form class="mt-3" name="myform" method="post" action="<%=request.getContextPath()%>/j0223/Test02">

            
            <div class="row g-3 mb-4">
              <div class="col-md-6">
                <label class="form-label fw-semibold">콤보박스 선택</label>
                <select class="form-select"
                        onchange="setImage(this.value, 'demo1', 'label1')">
                  <option value="11.jpg">11.jpg</option>
                  <option value="12.jpg">12.jpg</option>
                  <option value="13.jpg">13.jpg</option>
                  <option value="14.jpg">14.jpg</option>
                  <option value="15.jpg">15.jpg</option>
                  <option value="16.jpg">16.jpg</option>
                  <option value="17.jpg">17.jpg</option>
                  <option value="18.jpg">18.jpg</option>
                  <option value="19.jpg">19.jpg</option>
                  <option value="20.jpg">20.jpg</option>
                </select>
                <div class="form-text">선택 즉시 왼쪽 미리보기에 반영됩니다.</div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-semibold">리스트박스 선택</label>
                <select class="form-select" size="10"
                        onchange="setImage(this.value, 'demo2', 'label2')">
                  <option value="11.jpg">11.jpg</option>
                  <option value="12.jpg">12.jpg</option>
                  <option value="13.jpg">13.jpg</option>
                  <option value="14.jpg">14.jpg</option>
                  <option value="15.jpg">15.jpg</option>
                  <option value="16.jpg">16.jpg</option>
                  <option value="17.jpg">17.jpg</option>
                  <option value="18.jpg">18.jpg</option>
                  <option value="19.jpg">19.jpg</option>
                  <option value="20.jpg">20.jpg</option>
                </select>
                <div class="form-text">리스트에서 선택하면 오른쪽 미리보기에 반영됩니다.</div>
              </div>
            </div>

            <!-- 미리보기 영역 -->
            <div class="row g-3">
              <div class="col-md-6">
                <div class="preview-box">
                  <div class="preview-label">
                    <span class="fw-semibold">미리보기 1</span>
                    <span class="badge text-bg-light border" id="label1">11.jpg</span>
                  </div>
                  <div class="img-frame">
                    <img id="demo1"
                         src="<%=request.getContextPath()%>/images/11.jpg"
                         alt="demo1"
                         onerror="imgError(this)">
                  </div>
                </div>
              </div>

              <div class="col-md-6">
                <div class="preview-box">
                  <div class="preview-label">
                    <span class="fw-semibold">미리보기 2</span>
                    <span class="badge text-bg-light border" id="label2">11.jpg</span>
                  </div>
                  <div class="img-frame">
                    <img id="demo2"
                         src="<%=request.getContextPath()%>/images/11.jpg"
                         alt="demo2"
                         onerror="imgError(this)">
                  </div>
                </div>
              </div>
            </div>

          </form>
        </div>
      </div>

      <div class="text-center text-muted mt-4 small">
        이미지 경로: <code><%=request.getContextPath()%>/images/</code>
      </div>

    </div>
  </div>
</body>
</html>