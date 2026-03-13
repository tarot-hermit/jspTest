<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ajaxForm.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    $(function() {
	    //alert('닉네임 : ${nickName}');
	    if('${nickName}' != '') document.getElementById("demo").innerHTML = '닉네임 : ${nickName}';
    });
    
    function idCheck(mid) {
    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		document.getElementById("mid").focus();
    		return "0";
    	}
    }
    
    // 비동기식
    function idCheck1() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag != "0") location.href = "AjaxCheck1.st?mid=" + mid;
    }
    
    // 비동기식(브라우저객체 : XMLHttpRequest)
    function idCheck2() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	let xhr = new XMLHttpRequest();
    	xhr.open("GET", "AjaxCheck2.st?mid=" + mid);
    	xhr.send();
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
    			document.getElementById("demo").innerHTML = '닉네임 : ' + xhr.responseText;
    		}
    	}
    }
    
    // 비동기식(front check :  fetch())
    function idCheck3() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	fetch("AjaxCheck2.st?mid=" + mid)
    		.then((res) => res.text())
    		.then((res) => {
    			document.getElementById("demo").innerHTML = res;
    			console.log("res : ", res);
    		})
    		.catch((error) => console.log("error : ", error));
    }
    
    // 비동기식(ajax처리)
    function ajaxCheck1() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxCheck1",
    		type : "get",
    		data : {"mid" : mid},
    		//dataTye : "json",
    		contentType: "application/json",
    		charset : "utf-8",
    		timeout : 10000,
    		beforeSend: function() {
    			console.log("mid(전) : ", mid);
    		},
    		success: (res) => {
    			//alert(res);
    			let str = '<font color="blue">검색한 아이디 : <b>'+mid+'</b> , 닉네임 : <b>'+res+'</b></font>';
    			$('#demo').html(str);
    		},
    		error : () => {
    			alert("전송오류!!");
    		},
    		complete: function() {
    			console.log("mid(후) : ", mid);
    		}
    	});
    }
    
    // 비동기통신(ajax처리 - 암기)
    function ajaxCheck2() {
    	// 자바스크립트로 유효성 검사
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxCheck1",
    		type : "post",
    		data : {"mid" : mid},
    		success: function(res) {			// (res) => {}
    			let str = "닉네임 : " + res;
    			$("#demo").html(res);
    		},
    		error : () => alert("전송실패!!")
    	});
    }
    
    // 비동기통신(ajax처리 - 암기) - 입력한 아이디로 검색후, '닉네임/성명/성별/이메일/레벨(한글로)'을 찾아서 demo에 출력하시오.
    function ajaxCheck3() {
    	// 자바스크립트로 유효성 검사
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxCheck3",
    		type : "post",
    		data : {mid : mid},
    		success: function(res) {
    			$("#demo").html(res);
    		},
    		error : () => alert("전송실패!!")
    	});
    }
    
    // 비동기통신(ajax처리 - 암기) - 입력한 아이디로 검색후, '닉네임/성명/성별/이메일/레벨(한글로)'을 찾아서 demo에 출력하시오.
    function ajaxCheck4() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxCheck4",
    		type : "post",
    		data : {mid : mid},
    		success: function(res) {
    			$("#demo").html(res);
    			if(res.indexOf("/") != -1) {
    				let str = res.split("/");
    				$("#imsiNickName").html(str[0]);
    				$("#imsiName").html(str[1]);
    				$("#imsiGender").html(str[2]);
    				$("#imsiEmail").html(str[3]);
    				$("#imsiLevel").html(str[4]);
    			}
    		},
    		error : () => alert("전송실패!!")
    	});
    }
    
    function ajaxCheck5() {
    	let mid = document.getElementById("mid").value.trim();
    	let flag = idCheck(mid);
    	if(flag == "0") return false;
    	
    	$.ajax({
    		url  : "${ctp}/AjaxCheck5",
    		type : "post",
    		data : {mid : mid},
    		success: function(res) {
    			
    			let js = JSON.parse(res);
    			console.log("js :",js);
    			
    		$("#imsiNickName").html(js.nickName);
				$("#imsiName").html(js.name);
				$("#imsiGender").html(js.gender);
				$("#imsiEmail").html(js.email);
				$("#imsiLevel").html(js.level);
				
    		},
    		error : () => alert("전송실패!!")
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>ajaxForm연습하기</h2>
  <hr/>
  <div class="text-center">
    <form name="myform">
      <div class="input-group mb-3">
      	<div class="input-group-text bg-secondary-subtle">아이디</div> 
        <input type="text" name="mid" id="mid" value="${sMid}" class="form-control"/>
      </div>
      <div class="mb-3">
        <input type="button" value="동기식" onclick="idCheck1()" class="btn btn-success" />
        <input type="button" value="비동기식1" onclick="idCheck2()" class="btn btn-primary" />
        <input type="button" value="비동기식2(front)" onclick="idCheck3()" class="btn btn-primary" />
      </div>
      <div class="mb-3">
        <input type="button" value="ajax1" onclick="ajaxCheck1()" class="btn btn-outline-success" />
        <input type="button" value="ajax2" onclick="ajaxCheck2()" class="btn btn-outline-primary" />
        <input type="button" value="ajax3" onclick="ajaxCheck3()" class="btn btn-outline-info" />
        <input type="button" value="ajax4" onclick="ajaxCheck4()" class="btn btn-outline-secondary" />
        <input type="button" value="ajax5" onclick="ajaxCheck5()" class="btn btn-outline-warning" />
      </div>
    </form>
    <hr/>
	  <div id="demo"></div>
	  <hr/>
	  <div>
	  	닉네임 : <span id="imsiNickName"></span><br/>
	  	성명 : <span id="imsiName"></span><br/>
	  	성별 : <span id="imsiGender"></span><br/>
	  	이메일 : <span id="imsiEmail"></span><br/>
	  	등급 : <span id="imsiLevel"></span><br/>
	  </div>
    <hr/>
    <pre>
    <h4>AJAX</h4>
    AJAX(Asynchronous Javascript And Xml) :
    자바스크립트 라이브러리중의 하나이며, 브라우저객체인 XMLHttpRequest를 이용해서 전체페이지를 고치지 않아도 부분적인 페이지 일부만을
    위한 데이터를 로드하는 기법이다.
    즉, 자바스크립트를 이용하여 서버에 데이터를 요청할때 비동기식으로 통신하는 방식. 과거는 XML방식을 많이 선호하였으나, 지금은 JSON방식을 많이 사용한다.
    
    <h5>AJAX에서의 전송메소드(방식)</h5>
    - GET : 데이터를 읽거나 주로 검색할때 사용
    - POST : 새로운 리소스를 생성할때 사용
    - PUT : 리소스를 생성/업데이트할때 사용
    - DELETE : 지정된 리소스를 삭제할때 사용
    </pre>
  </div>
  <hr/>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>