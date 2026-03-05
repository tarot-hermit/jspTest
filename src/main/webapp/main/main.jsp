<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP Project(홍길동)</title>
<%@ include file="/include/bs5.jsp"%>

<style>
.main-carousel-img {
  width: 100%;
  height: 360px;
  object-fit: cover;
  display: block;
}
</style>
</head>
<body>
		<jsp:include page="/include/header.jsp" />
		<jsp:include page="/include/nav.jsp" />

		<%
		List<String> mainImgs1 = (List<String>) request.getAttribute("mainImgs1");
		List<String> mainImgs2 = (List<String>) request.getAttribute("mainImgs2");
		%>

		<div class="container mt-5">
				<div class="row">


						<div class="col-sm-4">
								<h2>About Me</h2>
								<h5>Photo of me:</h5>

								<div class="fakeimg">Fake Image</div>

								<p>Some text about me in culpa qui officia deserunt mollit
										anim..</p>
								<h3 class="mt-4">Some Links</h3>
								<p>Lorem ipsum dolor sit ame.</p>
								<ul class="nav nav-pills flex-column">
										<li class="nav-item"><a class="nav-link active" href="#">Active</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Link</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Link</a>
										</li>
										<li class="nav-item"><a class="nav-link disabled"
												href="#">Disabled</a></li>
								</ul>
								<hr class="d-sm-none">
						</div>


						<div class="col-sm-8">

								<h2>TITLE HEADING</h2>
								<h5>Title description, Dec 7, 2020</h5>


								<div id="mainCarousel1" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner">

												<%
												if (mainImgs1 != null && !mainImgs1.isEmpty()) {
													for (int i = 0; i < mainImgs1.size(); i++) {
														String img = mainImgs1.get(i);
														String active = (i == 0) ? "active" : "";
												%>
												<div class="carousel-item <%=active%>">
														<img class="d-block w-100 main-carousel-img"
																src="<%=request.getContextPath()%>/images/<%=img%>">
												</div>
												<%
												}
												} else {
												%>
												<div class="carousel-item active">
														<div
																class="d-flex align-items-center justify-content-center bg-secondary text-white main-carousel-img">
																표시할 이미지가 없습니다.</div>
												</div>
												<%
												}
												%>

										</div>

										<button class="carousel-control-prev" type="button"
												data-bs-target="#mainCarousel1" data-bs-slide="prev">
												<span class="carousel-control-prev-icon"></span>
										</button>
										<button class="carousel-control-next" type="button"
												data-bs-target="#mainCarousel1" data-bs-slide="next">
												<span class="carousel-control-next-icon"></span>
										</button>
								</div>

								<p class="mt-3">Some text..</p>
								<p>Sunt in culpa qui officia deserunt mollit anim id est
										laborum consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua. Ut enim ad minim
										veniam, quis nostrud exercitation ullamco.</p>

								<h2 class="mt-5">TITLE HEADING</h2>
								<h5>Title description, Sep 2, 2020</h5>


								<div id="mainCarousel2" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner">

												<%
												if (mainImgs2 != null && !mainImgs2.isEmpty()) {
													for (int i = 0; i < mainImgs2.size(); i++) {
														String img = mainImgs2.get(i);
														String active = (i == 0) ? "active" : "";
												%>
												<div class="carousel-item <%=active%>">
														<img class="d-block w-100 main-carousel-img"
																src="<%=request.getContextPath()%>/images/<%=img%>">
												</div>
												<%
												}
												} else {
												%>
												<div class="carousel-item active">
														<div
																class="d-flex align-items-center justify-content-center bg-secondary text-white main-carousel-img">
																표시할 이미지가 없습니다.</div>
												</div>
												<%
												}
												%>

										</div>

										<button class="carousel-control-prev" type="button"
												data-bs-target="#mainCarousel2" data-bs-slide="prev">
												<span class="carousel-control-prev-icon"></span>
										</button>
										<button class="carousel-control-next" type="button"
												data-bs-target="#mainCarousel2" data-bs-slide="next">
												<span class="carousel-control-next-icon"></span>
										</button>
								</div>

								<p class="mt-3">Some text..</p>
								<p>Sunt in culpa qui officia deserunt mollit anim id est
										laborum consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua. Ut enim ad minim
										veniam, quis nostrud exercitation ullamco.</p>

						</div>
				</div>
		</div>

		<jsp:include page="/include/footer.jsp" />
</body>
</html>