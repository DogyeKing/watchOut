<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Watch Out! Video</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/2-col-portfolio.css" rel="stylesheet">

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
					<li class="nav-item"><a class="nav-link"
						href="/watchout/main.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/watchout/news/news.jsp">News</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/watchout/album/album.jsp">Album</a></li>
					<li class="nav-item active"><a class="nav-link"
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
		<h1 class="my-4">Watch Out!Records</h1>

		<div class="row">
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/7-wNCMuPS0c" target="blank"><img
						class="card-img-top" src="/watchout/video/img/solace.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/7-wNCMuPS0c" target="blank">End These Days - "Solace" Feat. Ryo Kinoshita of
								Crystal Lake (Official Music Video)</a>
						</h4>
						<p class="card-text">End These Days - "Solace" feat. Ryo
							Kinoshita of Crystal Lake (Official Music Video) End These Days
							"Ambivalence" out Nov 2nd. End These Days (Busan, South Korea)</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/CQVV-eY86dM" target="_blank"><img
						class="card-img-top" src="/watchout/video/img/noeazy11.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/CQVV-eY86dM" target="_blank">Noeazy - After All (Official Lyric Video)</a>
						</h4>
						<p class="card-text">Watch Out! Records is proud to announce
							and welcome a new addition to our roster, "Noeazy"! "After All",
							their brand new single off of the upcoming full-length album
							"Triangle", available June 27 via Watch Out! Records.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/ZG0KJX5Rbx4" target="_blank"><img class="card-img-top"
						src="/watchout/video/img/babel.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/ZG0KJX5Rbx4" target="_blank">Day Of Mourning - "Babel" (Official Audio Stream)</a>
						</h4>
						<p class="card-text">Day Of Mourning’s new album "This Too
							Will Pass" will be available on Watch Out! Records from April 12,
							2018</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/jX8RTjUUcLE" target="_blank"><img class="card-img-top"
						src="/watchout/video/img/apollo.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/jX8RTjUUcLE" target="_blank">Crystal Lake -
								Apollo【Official Music Video】</a>
						</h4>
						<p class="card-text">
							2017.10.11日 Release Crystal Lake「Apollo」 ¥2,100+tax / CUBE-1008 <br>

							Crystal Lake「TRUE NORTH FESTIVAL」 2017年10月21日（土）東京都 新木場STUDIO
							COAST http://crystallake.jp
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/s1YL1lw8iyg" target="_blank" ><img
						class="card-img-top" src="/watchout/video/img/vassline11.jpg"
						alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/s1YL1lw8iyg" target="_blank">Memories Of One (Memoir Ver.)</a>
						</h4>
						<p class="card-text">Provided to YouTube by Interpark Corp

							Memories Of One (Memoir Ver.) · 바세린 (VASSLINE) Memoirs Of The War

							℗ 2017 Interpark Released on: 2017-08-07 Auto-generated by
							YouTube.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="https://youtu.be/kTUXJXHDInk?list=RDkTUXJXHDInk" target="_blank"><img
						class="card-img-top" src="/watchout/video/img/messgram.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="https://youtu.be/kTUXJXHDInk?list=RDkTUXJXHDInk" target="_blank">Messgram - From Hatred to Apathy (Official Lyric
								Video)</a>
						</h4>
						<p class="card-text">
							Messgram New 2nd EP Available Now !!! <br> Naver Music : <a
								href="https://goo.gl/2baXzl">https://goo.gl/2baXzl</a><br>
							Melon : <a href="https://goo.gl/LQ64Og">https://goo.gl/LQ64Og</a><br>
							Bugs Music : <a href="https://goo.gl/JAsZV9">https://goo.gl/JAsZV9</a><br>
							Facebook : <a href="http://www.facebook.com/messgram">http://www.facebook.com/messgram</a><br>
							Twitter : <a href="http://twitter.com/messgramband">http://twitter.com/messgramband</a><br>
							Instagram :<a href="https://www.instagram.com/messgramofficial/">https://www.instagram.com/messgramofficial/</a><br>
							Web : <a href="http://www.messgram.com">http://www.messgram.com</a><br>
							<a href="www.soundcloud.com/messgram">www.soundcloud.com/messgram</a>
							<a href="messgramofficial@gmail.com">messgramofficial@gmail.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

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
