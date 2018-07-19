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

<!-- Custom styles for this template -->
<link href="/watchout/css/portfolio-item.css" rel="stylesheet">
<link href="/watchout/css/custom.css"
	rel="stylesheet">
</head>

<body>
	<%
		//1. 로그인을 한 상태(session), 2. 로그인을 안한 상태(x)
		String memID = null;
		if (session.getAttribute("memID") != null) {
			//로그인을 한 상태!!
			memID = (String) session.getAttribute("memID");
		}

		int bdID = 0;
		if (request.getParameter("bdID") != null) {
			bdID = Integer.parseInt(request.getParameter("bdID"));
		}

		BoardDAO boardDAO = new BoardDAO();
		Board board = boardDAO.getBoard(bdID);
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
					</li>
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
								<a class="dropdown-item" href="//member/logoutAction.jsp">Log-out</a>
							</div></li>
					</ul>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<!-- 12개의 칼럼 -->
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<table class="table table-striped" style="border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>글 제목</td>
							<td colspan="2"><%=board.getBdTitle()%></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=board.getMemID()%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%=board.getBdDate()%></td>
						</tr>
						<tr>
							<td>글 내용</td>
							<td colspan="2"><%=board.getBdContent()%></td>
						</tr>

					</tbody>
				</table>
				<a href="/watchout/board/board.jsp" class="btn btn-primary"
					style="margin: 2px">목록 </a>
				<!-- 수정!! 글쓴이만 수정버튼이 생기게 할 것임. -->
				<%
					if (memID != null && memID.equals(board.getMemID()) ||memID != null && memID.equals("admin")  ) {
				%>
				<a class="btn btn-primary"
					href="/watchout/board/update.jsp?bdID=<%=bdID%>">수정</a>
				<!-- bdID를 들고감 -->
				<a class="btn btn-primary"
					href="/watchout/board/deleteAction.jsp?bdID=<%=bdID%>">삭제</a>
				<!-- bdID를 들고감 -->
				<%-- <%
					} else if (memID != null && memID.equals("admin")) {
				%>
				<a class="btn btn-primary"
					href="/watchout/board/update.jsp?bdID=<%=bdID%>">수정</a>
				<!-- bdID를 들고감 -->
				<a class="btn btn-primary"
					href="/watchout/board/deleteAction.jsp?bdID=<%=bdID%>">삭제</a>
				<!-- bdID를 들고감 -->

				<%
					}else{
				%> --%>
						
				<%
				}
				%>
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
