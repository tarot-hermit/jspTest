<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String today = java.time.LocalDate.now().toString();
  pageContext.setAttribute("today", today);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberJoin.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" type="text/css" href="${ctp}/css/orangeLink.css"/>
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
    
    // 정규식을 사용하세요....
    // 아이디는 4~20자의 영문 대/소문자와 숫자/밑줄 사용가능
    // 비밀번호는 2~15자...
    // 닉네임은 2~20자의 한글/숫자/밑줄 만 사용
    // 이름은 2~20자의 한글/영문
    // 이메일은 email형식에 맞도록처리...
    // 홈페이지입력시는 url형식에 맞도록 처리...
    // 전화번호입력시는 전화번호형식에 맞도록처리
    
    let idChecked = false;
		let nickChecked = false;
    
    
    function fCheck() {
    	
    	 if (!idChecked) {
    	        alert("아이디 중복체크를 해주세요.");
    	        document.getElementById("mid").focus();
    	        return false;
    	    }
    	    if (!nickChecked) {
    	        alert("닉네임 중복체크를 해주세요.");
    	        document.getElementById("nickName").focus();
    	        return false;
    	    }
    	
    	// 정규식을 이용한 유효성검사처리.....
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;			// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    	//let regPwd = /{2,15}$/;										// 비밀번호는 2~15
      let regNickName = /^[가-힣0-9_]{2,20}$/;		// 닉네임은 2~20자의 한글, 숫자, 밑줄만 가능
      let regName = /^[가-힣a-zA-Z]{2,20}$/;			// 이름은 2~20자의 한글/영문 가능
      const regEmail = /^[a-zA-Z0-9._%+\-]+$/; 	// 이메일은 email형식에 맞도록 처리...
      const regUrl = /^(https?:\/\/)?[a-z0-9]*\.([a-z0-9]{2,10})*\/?/i; // 홈페이지입력시는 url형식에 맞도록 처리...
      const regTel = /^\d{3,4}$/; 						// 전화번호입력시는 전화번호형식에 맞도록처리
    	
    	
    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
    	let mid = document.myform.mid.value.trim();
    	let pwd = document.myform.pwd.value.trim();
    	let nickName = document.myform.nickName.value;
    	let name = document.myform.name.value;
    	
    	let email1 = document.myform.email1.value.trim();
    	let email2 = document.myform.email2.value;
    	let email = email1 + "@" + email2;
    	
    	let tel1 = document.myform.tel1.value;
    	let tel2 = document.myform.tel2.value.trim();
    	let tel3 = document.myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	let postcode = document.myform.postcode.value + " ";
    	let roadAddress = document.myform.roadAddress.value + " ";
    	let detailAddress = document.myform.detailAddress.value + " ";
    	let extraAddress = document.myform.extraAddress.value + " ";
    	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
    	
    	let homePage = document.myform.homePage.value.trim();
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		document.myform.mid.focus();
    		return false;
    	}
    	else if(pwd.length < 2 || pwd.length > 15) {
        alert("비밀번호는 2~15 자리로 작성해주세요.");
        document.myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        document.myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        document.myform.name.focus();
        return false;
      }
      else if(!regEmail.test(email1)) {
        alert("이메일을 확인하세요.");
        document.getElementById("email1").focus();
        return false;
      }
    	
    	// 필수입력 아닌 사항들의 체크
			
    	if(tel2 != "" && !regTel.test(tel2)) {
    		alert("전화번호(국번호)를 확인하세요.");
        document.getElementById("tel2").focus();
        return false;
			}
    	else if(tel3 != "" && !regTel.test(tel3)) {
    		alert("전화번호를 확인하세요.");
        document.getElementById("tel3").focus();
        return false;
			}
			else if(tel2 == "" && tel3 == "") {
				tel2 = " ";
				tel3 = " ";
			}
			else tel = tel1 + "-" + tel2 + "-" + tel3;
    	
      if(homePage != "https://" && homePage != "" && !regUrl.test(homePage)) {
        alert("홈페이지를 확인하세요.");
        document.getElementById("homePage").focus();
        return false;
      }
      
    	//alert("회원가입완료!!");
    	
    	// 앞에서 모든 자료를 정상적으로 유효성 검사를 마친후 빠진 필드의 내용을 채워서 서버로 전송처리한다.
    	document.myform.tel.value = tel;
    	document.myform.address.value = address;
    	document.myform.email.value = email;
    	
    	document.myform.submit();
    }
    // 아이디 중복체크
    function idCheck() {
		let mid = document.getElementById("mid");
		if(mid.value.trim() == "") {
			alert("아이디를 입력하세요");
			mid.focus();
			return false;
		}
		$.ajax({
	        url  : "IdSearch.mem",
	        type : "GET",
	        data : { mid : mid.value.trim() },
	        success: (res) => {
	            if (res.trim() == "0") {
	                alert("사용 가능한 아이디입니다.");
	                idChecked = true;
	            } else {
	                alert("이미 사용 중인 아이디입니다.");
	                mid.value = "";
	                mid.focus();
	                idChecked = false;
	            }
	        },
	        error: () => alert("전송오류")
	    });
    }
    function nickCheck() {
		let nickName = document.getElementById("nickName");
		if(nickName.value.trim() == "") {
			alert("닉네임을입력하세요");
			nickName.focus();
			return false;
		}
		$.ajax({
	        url  : "NickSearch.mem",
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
    
    document.getElementById("mid").addEventListener("input", () => { idChecked = false; });
    document.getElementById("nickName").addEventListener("input", () => { nickChecked = false; });
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">회 원 가 입</h2>
  <form name="myform" method="post" action="MemberJoinOk.mem" enctype="multipart/form-data">
  	<div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="mid">아이디</label></div>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
      <input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="pwd">비밀번호 :</label></div>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="nickName">닉네임</label></div>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
      <input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="name">성명</label></div>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="email1">Email address:</label></div>
      <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
      <div class="input-group-text bg-secondary-subtle">@</div>
      <select name="email2" class="form-select">
        <option value="naver.com" selected>naver.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="hotmail.com">hotmail.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="yahoo.com">yahoo.com</option>
      </select>
    </div>
    <div class="input-group mb-3">
      <label class="input-group-text bg-secondary-subtle border-secondary-subtle">성 별</label>
      <div class="border form-control">
      <label class="form-check-label ms-3">
        <input type="radio" name="gender" class="form-check-input me-2" value="남자" checked>남자
      </label>
      <label class="form-check-label">
        <input type="radio" name="gender" class="form-check-input me-2" value="여자">여자
      </label>
      </div>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="birthday">생일</label></div>
      <input type="date" name="birthday" value="${today}" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle">전화번호</div>
      <select name="tel1" class="form-select">
        <option value="010" selected>010</option>
        <option value="02">서울</option>
        <option value="031">경기</option>
        <option value="032">인천</option>
        <option value="041">충남</option>
        <option value="042">대전</option>
        <option value="043">충북</option>
        <option value="051">부산</option>
        <option value="052">울산</option>
        <option value="061">전북</option>
        <option value="062">광주</option>
      </select>
      <div class="input-group-text">-</div>
      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>
      <div class="input-group-text">-</div>
      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
    </div>
    <div class="mb-2">
      <div class="input-group mb-1">
        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호를 입력하세요." class="form-control">
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
      </div>
      <div class="input-group mb-1">
        <input type="text" name="roadAddress" id="sample6_address" placeholder="주소" class="form-control">
      </div>
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
				<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
      </div>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="homePage">homePage address</label></div>
      <input type="text" class="form-control" name="homePage" value="https://" id="homePage"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text bg-secondary-subtle"><label for="name">직업</label></div>
      <select class="form-select" id="job" name="job">
        <option>학생</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>법조인</option>
        <option>세무인</option>
        <option>자영업</option>
        <option selected>기타</option>
      </select>
    </div>
    <div class="input-group mb-2">
      <label class="input-group-text bg-secondary-subtle border-secondary-subtle">취미</label>
      <div class="border form-control">
        <input type="checkbox" class="form-check-input ms-2 me-1" value="등산" name="hobby"/>등산
        <input type="checkbox" class="form-check-input ms-2 me-1" value="낚시" name="hobby"/>낚시
        <input type="checkbox" class="form-check-input ms-2 me-1" value="수영" name="hobby"/>수영
        <input type="checkbox" class="form-check-input ms-2 me-1" value="독서" name="hobby"/>독서
        <input type="checkbox" class="form-check-input ms-2 me-1" value="영화감상" name="hobby"/>영화감상
        <input type="checkbox" class="form-check-input ms-2 me-1" value="바둑" name="hobby"/>바둑
        <input type="checkbox" class="form-check-input ms-2 me-1" value="축구" name="hobby"/>축구
        <input type="checkbox" class="form-check-input ms-2 me-1" value="기타" name="hobby" checked/>기타
      </div>
    </div>
    <div class="input-group mb-2">
      <label for="content" class="input-group-text bg-secondary-subtle border-secondary-subtle">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="input-group mb-2">
      <label class="input-group-text bg-secondary-subtle border-secondary-subtle">정보공개</label>
      <div class="border form-control">
        <label class="form-check-label ms-3">
          <input type="radio" class="form-check-input me-2" name="userInfor" value="공개" checked/>공개
        </label>
        <label class="form-check-label">
          <input type="radio" class="form-check-input me-2" name="userInfor" value="비공개"/>비공개
        </label>
    	</div>
    </div>
    <div class="input-group mb-1">
      <div class="input-group-text bg-secondary-subtle border-secondary-subtle">회원 사진(파일용량:2MByte이내)</div>
      <input type="file" name="fName" id="file" onchange="imgCheck(this)" class="bg-secondary-subtle form-control"/>
    </div>
    <div class="text-end m-0 p-0"><img id="photoDemo" width="100px"/></div>
    <div class="text-center">
	    <button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button> &nbsp;
	    <button type="reset" class="btn btn-warning">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-info" onclick="location.href='MemberLogin.mem';">돌아가기</button>
    </div>
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
    <input type="hidden" name="email" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>