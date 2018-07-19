<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
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
<link href="/watchout/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/watchout/css/custom.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/watchout/css/portfolio-item.css" rel="stylesheet">

</head>

<body>
	<%
		//1. 로긴을 한 상태(session), 2. 로긴을 안한 상태(x)
		String memID = null;
		if (session.getAttribute("memID") != null) {
			//로그인을 한 상태!!
			memID = (String) session.getAttribute("memID");
		}

		//2. 페이지 넘버 만들기
		int pageNum = 1;
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		String search = null;
		if (request.getParameter("search") != null && !request.getParameter("search").equals("")) {
			//로그인 한 상태 ->세션을 들고오면됨
			search = request.getParameter("search");
		}
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/watchout/main.jsp">Watch Out
				Records!!</a>
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
					<li class="nav-item"><a class="nav-link"
						href="/watchout/album/album.jsp">Album</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/watchout/video/video.jsp">Video</a></li>

					<li class="nav-item active"><a class="nav-link"
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

	<br>		

	
	<!-- 
					<form method="GET" action="/watchout/board/board.jsp" name="srch">
					<div class="form-group">
						<input type="search" class="form-control" id="search"
							name="search">
					</div>
					<button type="submit" class="btn btn-Secondary">Search</button>
					</form> -->
	<div class="container">
		<div class="row">
			<!-- 12개의 칼럼 -->
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<table class="table table-striped" style="border: 1px solid #dddddd">
					<thead>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							BoardDAO boardDAO = new BoardDAO();
							ArrayList<Board> list = boardDAO.getList(pageNum);
							if(search == null){
								 list = boardDAO.getList(pageNum);
							}else{
								list = boardDAO.search(search);
							}
							
							for(Board b : list){
						
						%>
						<tr>
							<td><%=b.getBdID()%></td>
							<td><a href="/watchout/board/view.jsp?bdID=<%=b.getBdID()%>">
									<%=b.getBdTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll("\n", "<br>")%>
							</a></td>
							<td><%=b.getMemID()%></td>
							<td><%=b.getBdDate()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<div>
				<%
					if (pageNum != 1) {
				%>
				<a class="btn btn-success"
					href="/watchout/board/board.jsp?pageNum=<%=pageNum - 1%>"
					style="margin: 2px">Prev</a>
				<%
					}

					if (boardDAO.nextPage(pageNum + 1)) {
				%>
				<a class="btn btn-success"
					href="/watchout/board/board.jsp?pageNum=<%=pageNum + 1%>"
					style="margin: 2px">Next</a>
				<%
					}
				%>


					<a class="btn btn-primary float-right"
						href="/watchout/board/write.jsp" style="margin: 2px">Write</a>
		
			
				<form class="form-inline float-right" method="GET" action="/watchout/board/board.jsp" name="srch"  >
					<input class="form-control mr-sm-2" type="text" 
						placeholder="Search" id="search" name="search" >
					<button class="btn btn-Secondary float-right" type="submit" >Search</button>
			</form> 
		</div>
			</div>

			<div class="col-lg-2"></div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="/watchout/vendor/jquery/jquery.min.js"></script>
	<script src="/watchout/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
