<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>modalForm.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    $(function() {
    	let str = '';
    	str += '아이디 : ${vo.mid}<br/>';
    	str += '성명 : ${vo.name}<br/>';
    	str += '닉네임 : ${vo.nickName}<br/>';
    	str += '성별 : ${vo.gender}<br/>';
    	str += '취미 : ${vo.hobby}';
    	$("#demo").html(str);
    })
    
    function fCheck3(name) {
    	$("#myModal3 #modalName3").text(name);
    }
    function fCheck4(mid,name,nickName,gender,hobby) {
    	$("#myModal4 #modalMid4").text(mid);
    	$("#myModal4 #modalName4").text(name);
    	$("#myModal4 #modalNickName4").text(nickName);
    	$("#myModal4 #modalGender4").text(gender);
    	$("#myModal4 #modalHobby4").text(hobby);
    }
    
    // 아이디 검색
    function fCheck() {
    	let mid = document.getElementById("mid").value;
    	
    	location.href = "ModalFormOk.st?mid="+mid;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>Modal 연습</h2>
  <hr/>
  <div>
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal1">모달연습1</button>
    <input type="button" value="모달연습2" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal2" />
    <a href="#" onclick="fCheck3('홍길동')" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal3">모달연습3</a>
    <a href="#" onclick="fCheck4('${vo.mid}',${vo.name}',${vo.nickName}',${vo.gender}',${vo.hobby}')" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#myModal4">검색-모달연습4</a>
  </div>
  <hr/>
  <div class="input-group">
    <div class="input-group-text">아이디</div>
    <input type="text" name="mid" id="mid" value="${sMid}" class="form-control"/>
    <button type="button" onclick="fCheck()" class="btn btn-secondary">검색</button>
  </div>
  <hr/>
  <div id="demo"></div>
</div>

<!-- The Modal 1 -->
<div class="modal fade" id="myModal1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- The Modal 2 -->
<div class="modal" id="myModal2">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h3>Some text to enable scrolling..</h3>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- The Modal 3 -->
<div class="modal fade" id="myModal3">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">검색하신 성명은?</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        성명 : <span id="modalName3"></span>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- The Modal 4 -->
<div class="modal fade" id="myModal4">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        아이디 : <span id="modalMid4"></span><br/>
        성명 : <span id="modalName4"></span><br/>
        닉네임 : <span id="modalNickName4"></span><br/>
        성별 : <span id="modalGender4"></span><br/>
        취미 : <span id="modalHobby4"></span><br/>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>