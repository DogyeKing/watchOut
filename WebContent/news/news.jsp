<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>1 Col Portfolio - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/1-col-portfolio.css" rel="stylesheet">

</head>

<body>

	<%
		String memID = null;
		if (session.getAttribute("memID") != null) {
			memID = (String) session.getAttribute("memID");
		}
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/watchout/main.jsp">Watch Out Records!!</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a class="nav-link"
						href="/watchout/main.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="/watchout/news/news.jsp">News</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/watchout/album/album.jsp">Album</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/watchout/video/video.jsp">Video</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/watchout/board/board.jsp">Community</a></li>
					<%
						if (memID == null) {
					%>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown">Account</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/watchout/member/login.jsp">Log
									in</a> <a class="dropdown-item" href="/watchout/member/signin.jsp">Sign
									in</a>
							</div></li>
					</ul>
					<%
						} else {
					%>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown">Account</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/watchout/member/info.jsp">Information</a>
								<a class="dropdown-item" href="/member/logoutAction.jsp">Log-out</a>
							</div></li>
					</ul>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<h1 class="my-4">
			Watch Out! News
		</h1>

		<!-- Project One -->
		<div class="row">
			<div class="col-md-7">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="/watchout/news/img/noeazy.news1.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>
					Noeazy New Album <br>Triangle Release!
				</h3>

				<br>
				<p>
					Noeazy의 세번째 정규앨범 Triangle 을 이제 온라인 스트리밍 사이트에서 들어보실 수 있습니다!<br>
					아래의 링크에서 확인이 가능하며 해외 스트리밍은 업데이가 조금 늦어질 예정입니다.<br> .<br> .<br>
					.<br> Naver Music : <a href="http://bitly.kr/YAWx">"http://bitly.kr/YAWx" </a> <br>
					Melon : <a href="http://bitly.kr/s7eV">"http://bitly.kr/s7eV" </a> <br> Bugs : <a
						href="http://bitly.kr/tisk">"http://bitly.kr/tisk"</a> <br> M.net : <a
						href="http://bitly.kr/o8YY">"http://bitly.kr/o8YY"</a> <br> Sori Bada : <a
						href="http://bitly.kr/LGOq">"http://bitly.kr/LGOq"</a>
				</p>

			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Project Two -->
		<div class="row">
			<div class="col-md-7">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="/watchout/news/img/noeazy.m.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>noeazy 앨범 & 머천다이즈 <br> 온라인 판매!!</h3>
				<br>
				<br>
				<p>
					앨범 및 머천다이즈도 온라인 판매시작 합니다!!!<br> 페이스북 메세지로 주문 받습니다! <br>
					택배비 3000원이 추가되며,택배강국 대한민국이지만 저희 물건은 받는데까지<br> 최소 3일은 잡아주세요 흑흑
					최대한 빨리 처리해드리겠습니다! <br> (티셔츠 사이즈는 양키사이즈로 국산 티보다 한사이즈 큽니다!
					참고해주세용~!) <br> <br> <a
						href="http://noeazy.bandcamp.com/album/triangle">http://noeazy.bandcamp.com/album/triangle</a>
					<br> 청취 및 온라인 음원구매 가능...!
				</p>
				<br>

			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Project Three -->
		<div class="row">
			<div class="col-md-7">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="/watchout/news/img/novelist.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Novelists 내한투어 2차 라인업 발표</h3>
				<p>
				<br>
				<br> Tour with : End These Days + Secret Guest<br> <br>
					-9월 1일 (토) ClubHEAVY 대구클럽헤비 [대구] Torn Self - 톤셀프 / Retort Pouch -
					레토르트파우치 / Knob<br> <br> -9월 2일 (일) 홍대 A.O.R [서울] Day Of
					Mourning / Eighteen April / In Your Face IYF<br> <br>
					Novelists 내한투어 2차 라인업 공개입니다. 각 지역 오프닝 밴드 라인업이 공개되었습니다! 최종 라인업
					Secret Guest 공개는 6월 30일에 있을 예정이니 많은 기대 바랍니다!<br> <br> <br>
					▶예매하러가기 : <a href="http://naver.me/FogLFmwI">http://naver.me/FogLFmwI</a>
				</p>
				<br>

			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Project Four -->
		<div class="row">

			<div class="col-md-7">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="/watchout/news/img/sinstein.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Sinstein New Album Release!</h3>
				<br> <br>
				<p>
					약 1년간의 공백을 깨고 돌아온 Sinstein의 새 싱글<br> Above My Own이 오늘 디지털 음원으로
					발매 되었습니다! 현재 각종 국내 스트리밍 사이트들에서 확인이 가능하며 <br>해외 스트리밍은 주중에 공개 될
					예정입니다. <br> <br> -Naver Music<br> <a
						href="https://bit.ly/2JaY335">https://bit.ly/2JaY335</a> <br>
					<br> -Melon<br> <a href="https://bit.ly/2xEmPDs">https://bit.ly/2xEmPDs</a>
					<br> <br> -Genie<br> <a
						href="https://bit.ly/2HlvIkP">https://bit.ly/2HlvIkP</a> <br>
					<br> -Bugs!<br> <a href="https://bit.ly/2LYomHQ">https://bit.ly/2LYomHQ</a>
					<br> <br> -Soribada<br> <a
						href="https://bit.ly/2M0pomy">https://bit.ly/2M0pomy</a> <br>
					<br> -Mnet<br> <a href="https://bit.ly/2xEP5G9">https://bit.ly/2xEP5G9</a>
				</p>
				<br> <br>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
