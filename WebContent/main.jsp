<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Portfolio Item - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/portfolio-item.css" rel="stylesheet">


	
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
			<a class="navbar-brand" href="#">Watch Out Records!!</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>

			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="main.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="news/news.jsp">News</a></li>
					<li class="nav-item"><a class="nav-link"
						href="album/album.jsp">Album</a></li>
					<li class="nav-item"><a class="nav-link"
						href="video/video.jsp">Video</a></li>

					<li class="nav-item"><a class="nav-link"
						href="board/board.jsp">Community</a></li>

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
								<a class="dropdown-item"
									href="/watchout/member/logoutAction.jsp">Log-out</a>
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

		<!-- Portfolio Item Heading -->
		<h1 class="my-4">
			Watch Out Records <small>@watchoutrecordsKR</small>
		</h1>

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<a href="https://www.facebook.com/watchoutrecordsKR/"
					target="_blank"> <img class="img-fluid"
					src="img/watchoutrecords1.jpg" alt="">
				</a>
			</div>


			<div class="col-md-4">
				<h3 class="my-3">Project Description</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
					viverra euismod odio, gravida pellentesque urna varius vitae. Sed
					dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris
					ultricies, justo eu convallis placerat, felis enim.</p>
			
			
				<div id="realtime" class="container">
					<h3>What's on</h3>
					<ul class="list-group">
						<li class="list-group-item">First item</li>
						<li class="list-group-item">Second item</li>
						<li class="list-group-item">Third item</li>
					</ul>
				</div>

			</div>

		</div>
		<!-- /.row -->

		<!-- Related Projects Row -->
		<h3 class="my-4">Watch Out Family</h3>

		<div class="row">

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=YmMPUT5gNCc"
					target="_blank"> <img class="img-fluid" src="img/dom1.jpg"
					alt="">
				</a>
			</div>

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=7-wNCMuPS0c"
					target="_blank"> <img class="img-fluid" src="img/etd1.jpg"
					alt="">
				</a>
			</div>

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=n_EdDaQE-TM"
					target="_blank"> <img class="img-fluid" src="img/vassline2.jpg"
					alt="">
				</a>
			</div>

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=58LeVo7j46w"
					target="_blank"> <img class="img-fluid" src="img/bring1.jpg"
					alt="">
				</a>
			</div>

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=Z84nfj9jKtw"
					target="_blank"> <img class="img-fluid" src="img/noeazy4.jpg"
					alt="">
				</a>
			</div>

			<div class="col-md-4 col-sm-6 mb-4">
				<a href="https://www.youtube.com/watch?v=alAmBYYv6qg"
					target="_blank"> <img class="img-fluid" src="img/mess.jpg"
					alt="">
				</a>
			</div>
		</div>

	</div>



	<!-- /.row -->

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
<!--  ajax 사용 -->
	<script>
		$(document).ready(function() {
			getAjaxList();
		});

		function getAjaxList() {
			console.log('hi');
			$.ajax({
				type : "GET",
				url : "ABoardList",
				dataType : "json",
				success : function(data) {
					//var obj = JSON.parse(data);
					//console.log(obj);
					//console.log(obj[0].bdTitle);
					var list = document
							.querySelectorAll('#realtime .list-group-item');
					list[0].textContent = data[0].bdTitle;
					list[1].textContent = data[1].bdTitle;
					list[2].textContent = data[2].bdTitle;
				}
			});
		}

		setInterval(getAjaxList, 5000);
	</script>
</body>

</html>
