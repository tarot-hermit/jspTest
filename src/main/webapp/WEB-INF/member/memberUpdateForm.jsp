<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberUpdateForm.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    'use strict';

    let nickChecked = true;

    function fCheck() {
      if (!nickChecked) {
        alert("닉네임 중복체크를 해주세요.");
        document.getElementById("nickName").focus();
        return false;
      }

      let regNickName = /^[가-힣0-9_]{2,20}$/;
      let regName     = /^[가-힣a-zA-Z]{2,20}$/;
      const regEmail  = /^[a-zA-Z0-9._%+\-]+$/;
      const regUrl    = /^(https?:\/\/)?[a-z0-9]*\.([a-z0-9]{2,10})*\/?/i;
      const regTel    = /^\d{3,4}$/;

      let nickName = document.myform.nickName.value;
      let name     = document.myform.name.value;
      let email1   = document.myform.email1.value.trim();
      let email2   = document.myform.email2.value;
      let email    = email1 + "@" + email2;

      let tel1 = document.myform.tel1.value;
      let tel2 = document.myform.tel2.value.trim();
      let tel3 = document.myform.tel3.value.trim();
      let tel  = tel1 + "-" + tel2 + "-" + tel3;

      let postcode      = document.myform.postcode.value.trim();
      let roadAddress   = document.myform.roadAddress.value.trim();
      let detailAddress = document.myform.detailAddress.value.trim();
      let extraAddress  = document.myform.extraAddress.value.trim();

      // 주소를 입력했을 때만 새로 조합, 아니면 기존값 유지
      let address = "";
      if (postcode == "" && roadAddress == "") {
          address = "${vo.address}";  // 기존 주소 유지
      } else {
          address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
      }

      let homePage = document.myform.homePage.value.trim();

      if (!regNickName.test(nickName)) {
        alert("닉네임은 한글/숫자/밑줄만 사용가능합니다.");
        document.myform.nickName.focus();
        return false;
      }
      else if (!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        document.myform.name.focus();
        return false;
      }
      else if (!regEmail.test(email1)) {
        alert("이메일을 확인하세요.");
        document.getElementById("email1").focus();
        return false;
      }

      if (tel2 != "" && !regTel.test(tel2)) {
        alert("전화번호(국번)를 확인하세요.");
        document.getElementById("tel2").focus();
        return false;
      }
      else if (tel3 != "" && !regTel.test(tel3)) {
        alert("전화번호를 확인하세요.");
        document.getElementById("tel3").focus();
        return false;
      }
      else if (tel2 == "" && tel3 == "") {
        tel2 = " "; tel3 = " ";
      }
      else tel = tel1 + "-" + tel2 + "-" + tel3;

      if (homePage != "https://" && homePage != "" && !regUrl.test(homePage)) {
        alert("홈페이지를 확인하세요.");
        document.getElementById("homePage").focus();
        return false;
      }

      document.myform.tel.value     = tel;
      document.myform.address.value = address;
      document.myform.email.value   = email;

      document.myform.submit();
    }

    // 닉네임 중복체크
    function nickCheck() {
      let nickName = document.getElementById("nickName");
      let oriNick  = "${vo.nickName}"; // 원래 닉네임

      // 닉네임이 변경되지 않았으면 중복체크 통과
      if (nickName.value.trim() == oriNick) {
        nickChecked = true;
        alert("현재 닉네임입니다.");
        return;
      }
      if (nickName.value.trim() == "") {
        alert("닉네임을 입력하세요");
        nickName.focus();
        return false;
      }
      $.ajax({
        url  : "${ctp}/NickSearch.mem",
        type : "GET",
        data : { nickName : nickName.value.trim() },
        success: (res) => {
          if (res.trim() == "0") {
            alert("사용 가능한 닉네임입니다.");
            nickChecked = true;
          } else {
            alert("이미 사용 중인 닉네임입니다.");
            nickName.value = "";
            nickName.focus();
            nickChecked = false;
          }
        },
        error: () => alert("전송오류")
      });
    }

    document.addEventListener("DOMContentLoaded", function() {
      document.getElementById("nickName").addEventListener("input", () => { nickChecked = false; });
    });

    // 카카오 우편번호
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          let roadAddr = data.roadAddress;
          let extraRoadAddr = '';
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) extraRoadAddr += data.bname;
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          if (extraRoadAddr !== '') extraRoadAddr = ' (' + extraRoadAddr + ')';
          document.getElementById("sample6_postcode").value    = data.zonecode;
          document.getElementById("sample6_address").value     = roadAddr;
          document.getElementById("sample6_extraAddress").value = extraRoadAddr;
          document.getElementById("sample6_detailAddress").focus();
        }
      }).open();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">회 원 정 보 수 정</h2>
  <form name="myform" method="post" action="${ctp}/MemberUpdateOk.mem" enctype="multipart/form-data">

    <%-- 아이디 (수정불가) --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle">아이디</div>
      <input type="text" class="form-control" value="${vo.mid}" readonly />
    </div>

    <%-- 닉네임 --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="nickName">닉네임</label></div>
      <input type="text" class="form-control" name="nickName" id="nickName" value="${vo.nickName}" required />
      <input type="button" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()" />
    </div>

    <%-- 성명 --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="name">성명</label></div>
      <input type="text" class="form-control" name="name" id="name" value="${vo.name}" required />
    </div>

    <%-- 이메일 --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle">Email</div>
      <input type="text" class="form-control" id="email1" name="email1" value="${fn:split(vo.email,'@')[0]}" required />
      <div class="input-group-text">@</div>
      <select name="email2" class="form-select">
        <c:set var="emailDomain" value="${fn:split(vo.email,'@')[1]}"/>
        <option value="naver.com"   ${emailDomain == 'naver.com'   ? 'selected' : ''}>naver.com</option>
        <option value="hanmail.net" ${emailDomain == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
        <option value="hotmail.com" ${emailDomain == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
        <option value="gmail.com"   ${emailDomain == 'gmail.com'   ? 'selected' : ''}>gmail.com</option>
        <option value="nate.com"    ${emailDomain == 'nate.com'    ? 'selected' : ''}>nate.com</option>
        <option value="yahoo.com"   ${emailDomain == 'yahoo.com'   ? 'selected' : ''}>yahoo.com</option>
      </select>
    </div>

    <%-- 성별 --%>
    <div class="input-group mb-3">
      <label class="input-group-text bg-secondary-subtle">성 별</label>
      <div class="border form-control">
        <label class="form-check-label ms-3">
          <input type="radio" name="gender" class="form-check-input me-2" value="남자" ${vo.gender == '남자' ? 'checked' : ''}>남자
        </label>
        <label class="form-check-label">
          <input type="radio" name="gender" class="form-check-input me-2" value="여자" ${vo.gender == '여자' ? 'checked' : ''}>여자
        </label>
      </div>
    </div>

    <%-- 생일 --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="birthday">생일</label></div>
      <input type="date" name="birthday" value="${vo.birthday}" class="form-control" />
    </div>

    <%-- 전화번호 --%>
    <c:set var="telArr" value="${fn:split(vo.tel, '-')}"/>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle">전화번호</div>
      <select name="tel1" class="form-select">
        <option value="010" ${telArr[0] == '010' ? 'selected' : ''}>010</option>
        <option value="02"  ${telArr[0] == '02'  ? 'selected' : ''}>서울</option>
        <option value="031" ${telArr[0] == '031' ? 'selected' : ''}>경기</option>
        <option value="032" ${telArr[0] == '032' ? 'selected' : ''}>인천</option>
        <option value="041" ${telArr[0] == '041' ? 'selected' : ''}>충남</option>
        <option value="042" ${telArr[0] == '042' ? 'selected' : ''}>대전</option>
        <option value="043" ${telArr[0] == '043' ? 'selected' : ''}>충북</option>
        <option value="051" ${telArr[0] == '051' ? 'selected' : ''}>부산</option>
        <option value="052" ${telArr[0] == '052' ? 'selected' : ''}>울산</option>
        <option value="061" ${telArr[0] == '061' ? 'selected' : ''}>전북</option>
        <option value="062" ${telArr[0] == '062' ? 'selected' : ''}>광주</option>
      </select>
      <div class="input-group-text">-</div>
      <input type="text" name="tel2" size="4" maxlength="4" class="form-control" value="${telArr[1]}" />
      <div class="input-group-text">-</div>
      <input type="text" name="tel3" size="4" maxlength="4" class="form-control" value="${telArr[2]}" />
    </div>

    <%-- 주소 --%>
		<c:set var="addrArr" value="${fn:split(vo.address, '/')}"/>
		<div class="mb-2">
		  <div class="input-group mb-1">
		    <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control" value="${fn:trim(addrArr[0])}">
		    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
		  </div>
		  <div class="input-group mb-1">
		    <input type="text" name="roadAddress" id="sample6_address" placeholder="주소" class="form-control" value="${fn:trim(addrArr[1])}">
		  </div>
		  <div class="input-group mb-1">
		    <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control" value="${fn:trim(addrArr[2])}">
		    <input type="text" name="extraAddress"  id="sample6_extraAddress"  placeholder="참고항목"  class="form-control" value="${fn:trim(addrArr[3])}">
		  </div>
		</div>
		
    <%-- 홈페이지 --%>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="homePage">홈페이지</label></div>
      <input type="text" class="form-control" name="homePage" id="homePage" value="${vo.homePage}" />
    </div>

		   <%-- 직업 --%>
		<div class="input-group mb-2">
		  <div class="input-group-text bg-secondary-subtle">직업</div>
		  <c:set var="jobList" value="학생,회사원,공무원,군인,의사,법조인,세무인,자영업,기타"/>
		  <select class="form-select" name="job">
		    <c:forEach var="j" items="${jobList}">
		      <option ${vo.job == j ? 'selected' : ''}>${j}</option>
		    </c:forEach>
		  </select>
		</div>
			
			<%-- 취미 --%>
			<div class="input-group mb-2">
			  <label class="input-group-text bg-secondary-subtle">취미</label>
			  <div class="border form-control">
			    <c:forEach var="h" items="등산,낚시,수영,독서,영화감상,바둑,축구,기타">
			      <input type="checkbox" class="form-check-input ms-2 me-1" value="${h}" name="hobby"
			             ${fn:contains(vo.hobby, h.concat('/')) ? 'checked' : ''}/>${h}
			    </c:forEach>
			  </div>
			</div>
		

    <%-- 자기소개 --%>
    <div class="input-group mb-2">
      <label for="content" class="input-group-text bg-secondary-subtle">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content">${vo.content}</textarea>
    </div>

    <%-- 정보공개 --%>
    <div class="input-group mb-2">
      <label class="input-group-text bg-secondary-subtle">정보공개</label>
      <div class="border form-control">
        <label class="form-check-label ms-3">
          <input type="radio" class="form-check-input me-2" name="userInfor" value="공개"   ${vo.userInfor == '공개'   ? 'checked' : ''}/>공개
        </label>
        <label class="form-check-label">
          <input type="radio" class="form-check-input me-2" name="userInfor" value="비공개" ${vo.userInfor == '비공개' ? 'checked' : ''}/>비공개
        </label>
      </div>
    </div>
    
    <%-- 회원 사진 --%>
			<div class="input-group mb-1">
			  <div class="input-group-text bg-secondary-subtle border-secondary-subtle">
			    회원 사진(파일용량:2MByte이내)
			  </div>
			  <input type="file" name="fName" id="file" onchange="imgCheck(this)" 
			         class="bg-secondary-subtle form-control"/>
			</div>
			<div class="text-end m-0 p-0">
			  <img id="photoDemo" src="${ctp}/upload/${vo.photo}" width="100px"/>
			</div>
    

    <%-- 버튼 --%>
    <div class="text-center mt-3">
      <button type="button" class="btn btn-success" onclick="fCheck()">수정완료</button> &nbsp;
      <button type="reset"  class="btn btn-warning">다시작성</button> &nbsp;
      <button type="button" class="btn btn-info" onclick="history.back()">돌아가기</button>
    </div>

    <%-- hidden --%>
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
    <input type="hidden" name="email" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
