
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Watch Out! Album</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/thumbnail-gallery.css" rel="stylesheet">
    
    <link href="/watchout/css/custom.css" rel="stylesheet">

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
					<li class="nav-item"><a class="nav-link"
						href="/watchout/news/news.jsp">News</a></li>
					<li class="nav-item active"><a class="nav-link"
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

      <h1 class="my-4 text-center text-lg-left">Watch Out! Album</h1>

      <div class="row text-center text-lg-left">

        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/1.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/2.jpg"" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/3.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/4.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/5.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/6.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/7.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/8.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/9.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/10.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/11.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="/watchout/album/img/12.jpg" alt="">
          </a>
        </div>
      </div>
      
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
